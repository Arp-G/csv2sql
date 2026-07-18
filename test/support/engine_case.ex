defmodule Csv2sql.EngineCase do
  @moduledoc """
  Test harness for full engine runs.

  Provides:

    * a per-test tmp dir (via ExUnit's built-in `:tmp_dir` tag)
    * `csv!/3` — write a CSV fixture from row lists
    * `unique_name/1` — collision-free table/file names, so DB-backed
      tests run `async: true` safely
    * `run_import/3` — start a run subscribed to its events, wait for the
      terminal event, auto-register table cleanup, and return
      `%{run_id, run, events}`
    * `assert_event/2` — assert an event matching a pattern was emitted
    * adapter-neutral DB verification: `count!/2`, `select!/4`,
      `column_types!/2`, `table_exists?/2`, `drop_table!/2`, `db_query!/3`

  DB-backed modules are parameterized over adapters — see `db_parameters/1`.
  """

  use ExUnit.CaseTemplate

  import ExUnit.Assertions

  alias Csv2sql.Config
  alias Csv2sql.Config.Db
  alias Csv2sql.Events
  alias Csv2sql.Run

  alias NimbleCSV.RFC4180, as: CSV

  using do
    quote do
      import Csv2sql.EngineCase

      alias Csv2sql.Config
      alias Csv2sql.Events
      alias Csv2sql.File, as: CsvFile
      alias Csv2sql.Run

      @moduletag :tmp_dir
    end
  end

  @await_timeout :timer.seconds(60)

  @adapter_names %{"postgres" => :postgres, "mysql" => :mysql}
  @adapter_modules %{postgres: Csv2sql.Adapters.Postgres, mysql: Csv2sql.Adapters.MySql}
  @probe_ports %{postgres: 5432, mysql: 3306}

  # Normalized column types per adapter, for `column_types!/2`.
  @pg_column_types %{
    "integer" => :integer,
    "bigint" => :bigint,
    "character varying" => :varchar,
    "text" => :text,
    "double precision" => :float,
    "boolean" => :boolean,
    "date" => :date,
    "timestamp without time zone" => :datetime
  }
  @mysql_column_types %{
    "int" => :integer,
    "bigint" => :bigint,
    "varchar" => :varchar,
    "text" => :text,
    "longtext" => :longtext,
    "double" => :float,
    "tinyint" => :boolean,
    "date" => :date,
    "datetime" => :datetime
  }

  @doc """
  Parameter sets for DB-backed test modules (ExUnit `:parameterize`).

      use Csv2sql.EngineCase, async: true,
        parameterize: Csv2sql.EngineCase.db_parameters()

  Each set merges `%{db_adapter: ..., db_url: ...}` into the test context,
  and the whole module runs once per set. Selection: the
  `CSV2SQL_TEST_ADAPTERS` env var (comma-separated, pinned in CI) wins;
  otherwise Postgres is the baseline and optional adapters join when
  their server is reachable. Memoized so every test file sees one
  decision.

  `db_parameters(:mysql)` narrows to one adapter — useful for
  adapter-specific behavior tests; the module simply runs zero times when
  that adapter isn't selected.
  """
  @spec db_parameters(atom() | nil) :: [map()]
  def db_parameters(only \\ nil) do
    params =
      case :persistent_term.get({__MODULE__, :db_parameters}, nil) do
        nil ->
          computed = compute_db_parameters()
          :persistent_term.put({__MODULE__, :db_parameters}, computed)
          computed

        computed ->
          computed
      end

    case only do
      nil -> params
      adapter -> Enum.filter(params, &(&1.db_adapter == adapter))
    end
  end

  @doc "The connection URL DB-backed tests use for `adapter`."
  @spec test_db_url(atom()) :: String.t()
  def test_db_url(:postgres) do
    System.get_env(
      "CSV2SQL_TEST_POSTGRES_URL",
      "postgres://postgres:postgres@localhost:5432/postgres"
    )
  end

  def test_db_url(:mysql) do
    System.get_env(
      "CSV2SQL_TEST_MYSQL_URL",
      "mysql://root:mysql@localhost:3306/csv2sql_test"
    )
  end

  @doc "The DB settings for the current test, from its (parameterized) context."
  @spec db_params(map()) :: %{adapter: atom(), url: String.t()}
  def db_params(context) do
    adapter = Map.get(context, :db_adapter, :postgres)
    %{adapter: adapter, url: Map.get(context, :db_url, test_db_url(adapter))}
  end

  @doc "Writes `rows` (lists of strings, header first) as `dir/name`."
  @spec csv!(Path.t(), String.t(), [[String.t()]]) :: Path.t()
  def csv!(dir, name, rows) do
    path = Path.join(dir, name)
    File.write!(path, CSV.dump_to_iodata(rows))
    path
  end

  @doc "A collision-free name for tables/files."
  @spec unique_name(String.t()) :: String.t()
  def unique_name(base), do: "#{base}_#{System.unique_integer([:positive])}"

  @doc "Builds a valid test `%Config{}` for `source_dir` using the context's DB."
  @spec build_config(Path.t(), map(), map()) :: Config.t()
  def build_config(source_dir, context, overrides \\ %{}) do
    db = db_params(context)
    {db_overrides, top_overrides} = Map.pop(overrides, :db, %{})

    params =
      Map.merge(
        %{
          source_dir: source_dir,
          # Small pools: many async tests run concurrently against one
          # local server; the auto-sized pool would exhaust max_connections.
          db: Map.merge(%{adapter: db.adapter, url: db.url, pool_size: 2}, db_overrides)
        },
        top_overrides
      )

    case Config.new(params) do
      {:ok, config} -> config
      {:error, changeset} -> flunk("invalid test config: #{inspect(changeset.errors)}")
    end
  end

  @doc """
  Runs a full import over `source_dir` and returns `%{run_id, run, events}`.

  The test process is subscribed before the run starts, so the returned
  event list is complete (ending in the terminal event). Created tables
  are dropped on test exit.
  """
  @spec run_import(Path.t(), map(), map()) ::
          %{run_id: String.t(), run: Run.t(), events: [struct()]}
  def run_import(source_dir, context, overrides \\ %{}) do
    config = build_config(source_dir, context, overrides)
    {:ok, run_id} = Csv2sql.start_run(config, subscribe: true)

    events = collect_events(run_id, [])
    {:ok, run} = Csv2sql.run_state(run_id)
    register_table_cleanup(run)

    %{run_id: run_id, run: run, events: events}
  end

  @doc "Collects a run's events until (and including) the terminal one."
  @spec collect_events(String.t(), [struct()]) :: [struct()]
  def collect_events(run_id, acc) do
    receive do
      %{run_id: ^run_id} = event ->
        if is_struct(event) and Events.terminal?(event) do
          Enum.reverse([event | acc])
        else
          collect_events(run_id, [event | acc])
        end
    after
      @await_timeout ->
        flunk("run #{run_id} emitted no terminal event; got:\n#{inspect(acc, pretty: true)}")
    end
  end

  @doc "Registers an on_exit that drops every table of the run (best-effort)."
  @spec register_table_cleanup(Run.t()) :: :ok
  # Analyze runs create no tables — and may deliberately point at an
  # unreachable server.
  def register_table_cleanup(%Run{config: %Config{mode: :analyze}}), do: :ok

  def register_table_cleanup(%Run{} = run) do
    tables = run |> Run.files_in_order() |> Enum.map(& &1.table_name)
    db = run.config.db

    ExUnit.Callbacks.on_exit(fn -> drop_tables(db, tables) end)
  end

  # -- Adapter-neutral DB verification ---------------------------------------

  @doc "Exact row count of `table` (via the adapter itself)."
  @spec count!(map(), String.t()) :: non_neg_integer()
  def count!(context, table) do
    {adapter, db} = adapter_db(context)

    with_test_conn(db, fn conn ->
      {:ok, count} = adapter.exact_count(conn, table)
      count
    end)
  end

  @doc "Selects `columns` from `table` ordered by `order_by`; returns rows."
  @spec select!(map(), String.t(), [String.t()], String.t()) :: [[term()]]
  def select!(context, table, columns, order_by) do
    {adapter, db} = adapter_db(context)

    columns_sql =
      Enum.map_join(columns, ", ", &IO.iodata_to_binary(adapter.quote_ident(&1)))

    sql =
      IO.iodata_to_binary([
        "SELECT ",
        columns_sql,
        " FROM ",
        adapter.quote_ident(table),
        " ORDER BY ",
        adapter.quote_ident(order_by)
      ])

    with_test_conn(db, fn conn ->
      {:ok, %{rows: rows}} = adapter.query(conn, sql, [])
      rows
    end)
  end

  @doc """
  The column types of `table` in schema order, normalized to the engine's
  abstract type names (`:integer`, `:varchar`, `:float`, ...) so
  assertions are adapter-independent.
  """
  @spec column_types!(map(), String.t()) :: [atom()]
  def column_types!(context, table) do
    {adapter, db} = adapter_db(context)
    {sql, mapping} = column_types_query(db.adapter)

    with_test_conn(db, fn conn ->
      {:ok, %{rows: rows}} = adapter.query(conn, sql, [table])

      Enum.map(rows, fn [type] ->
        Map.get(mapping, String.downcase(type), {:unknown, type})
      end)
    end)
  end

  @doc "Whether `table` exists (via the adapter itself)."
  @spec table_exists?(map(), String.t()) :: boolean()
  def table_exists?(context, table) do
    {adapter, db} = adapter_db(context)
    with_test_conn(db, fn conn -> adapter.table_exists?(conn, table) end)
  end

  @doc "Drops `table` if it exists."
  @spec drop_table!(map(), String.t()) :: :ok
  def drop_table!(context, table) do
    {adapter, db} = adapter_db(context)

    with_test_conn(db, fn conn ->
      {:ok, _result} = adapter.query(conn, IO.iodata_to_binary(adapter.drop_table_sql(table)), [])
      :ok
    end)
  end

  @doc "Runs raw SQL (caller supplies dialect) against the context's DB."
  @spec db_query!(map(), String.t(), [term()]) :: [[term()]] | nil
  def db_query!(context, sql, params \\ []) do
    {adapter, db} = adapter_db(context)

    with_test_conn(db, fn conn ->
      {:ok, %{rows: rows}} = adapter.query(conn, sql, params)
      rows
    end)
  end

  @doc """
  Asserts that some event in `events` matches `pattern` (full `match?/2`
  semantics — pins and partial struct matches work).
  """
  defmacro assert_event(events, pattern) do
    pattern_string = Macro.to_string(pattern)

    quote do
      events = unquote(events)

      assert Enum.any?(events, &match?(unquote(pattern), &1)),
             "no event matched #{unquote(pattern_string)}\nevents:\n" <>
               inspect(
                 Enum.map(events, &%{&1.__struct__ => Map.delete(Map.from_struct(&1), :at)}),
                 pretty: true,
                 limit: 50
               )
    end
  end

  # -- Internals --------------------------------------------------------------

  defp compute_db_parameters do
    "CSV2SQL_TEST_ADAPTERS"
    |> System.get_env()
    |> selected_adapters()
    |> Enum.map(&%{db_adapter: &1, db_url: test_db_url(&1)})
  end

  # Postgres is the baseline; optional adapters join when their server is
  # reachable locally. CI pins the selection via the env var instead.
  defp selected_adapters(nil) do
    optional = for adapter <- [:mysql], reachable?(adapter), do: adapter

    case optional do
      [] -> IO.puts("[EngineCase] DB adapters: postgres (mysql not reachable — skipped)")
      _some -> IO.puts("[EngineCase] DB adapters: #{Enum.join([:postgres | optional], ", ")}")
    end

    [:postgres | optional]
  end

  defp selected_adapters(env_value) do
    env_value
    |> String.split(",", trim: true)
    |> Enum.map(&Map.fetch!(@adapter_names, String.trim(&1)))
  end

  defp reachable?(adapter) do
    uri = adapter |> test_db_url() |> URI.parse()
    host = String.to_charlist(uri.host || "localhost")
    port = uri.port || @probe_ports[adapter]

    case :gen_tcp.connect(host, port, [], 300) do
      {:ok, socket} ->
        :gen_tcp.close(socket)
        true

      {:error, _reason} ->
        false
    end
  end

  defp adapter_db(context) do
    db = db_params(context)
    {Map.fetch!(@adapter_modules, db.adapter), %Db{adapter: db.adapter, url: db.url}}
  end

  defp column_types_query(:postgres) do
    {"SELECT data_type FROM information_schema.columns " <>
       "WHERE table_schema = 'public' AND table_name = $1 ORDER BY ordinal_position",
     @pg_column_types}
  end

  defp column_types_query(:mysql) do
    {"SELECT DATA_TYPE FROM information_schema.columns " <>
       "WHERE table_schema = DATABASE() AND table_name = ? ORDER BY ORDINAL_POSITION",
     @mysql_column_types}
  end

  defp drop_tables(_db, []), do: :ok

  defp drop_tables(%Db{} = db, tables) do
    adapter = Map.fetch!(@adapter_modules, db.adapter)

    with_test_conn(db, fn conn ->
      Enum.each(tables, fn table ->
        adapter.query(conn, IO.iodata_to_binary(adapter.drop_table_sql(table)), [])
      end)
    end)
  rescue
    # Cleanup is best-effort: a run that failed before touching the DB
    # (or a dropped test database) must not fail the test from on_exit.
    _error -> :ok
  end

  defp with_test_conn(%Db{} = db, fun) do
    opts = Db.conn_opts(db) ++ [pool_size: 1]

    {:ok, conn} =
      case db.adapter do
        :postgres -> Postgrex.start_link(opts)
        :mysql -> MyXQL.start_link(opts)
      end

    try do
      fun.(conn)
    after
      GenServer.stop(conn)
    end
  end
end

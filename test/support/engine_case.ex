defmodule Csv2sql.EngineCase do
  @moduledoc """
  Test harness for full engine runs.

  Provides:

    * a per-test tmp dir (via ExUnit's built-in `:tmp_dir` tag)
    * `csv!/3` — write a CSV fixture from row lists
    * `unique_name/1` — collision-free table/file names, so DB-backed
      tests run `async: true` safely
    * `run_import/2` — start a run subscribed to its events, wait for the
      terminal event, auto-register table cleanup, and return
      `%{run_id, run, events}`
    * `assert_event/2` — assert an event matching a pattern was emitted
    * `db_query!/1` — verify database state directly

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

  @adapter_names %{"postgres" => :postgres}

  @doc """
  Parameter sets for DB-backed test modules (ExUnit `:parameterize`).

      use Csv2sql.EngineCase, async: true,
        parameterize: Csv2sql.EngineCase.db_parameters()

  Each set merges `%{db_adapter: ..., db_url: ...}` into the test context,
  and the whole module runs once per set. Selection: the
  `CSV2SQL_TEST_ADAPTERS` env var (comma-separated, pinned in CI) wins;
  otherwise Postgres is the baseline and optional adapters join when their
  server is reachable. Memoized so every test file sees one decision.
  """
  @spec db_parameters() :: [map()]
  def db_parameters do
    case :persistent_term.get({__MODULE__, :db_parameters}, nil) do
      nil ->
        params = compute_db_parameters()
        :persistent_term.put({__MODULE__, :db_parameters}, params)
        params

      params ->
        params
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

  @doc "The DB settings for the current test, from its (parameterized) context."
  @spec db_params(map()) :: %{adapter: atom(), url: String.t()}
  def db_params(context) do
    adapter = Map.get(context, :db_adapter, :postgres)
    %{adapter: adapter, url: Map.get(context, :db_url, test_db_url(adapter))}
  end

  defp compute_db_parameters do
    "CSV2SQL_TEST_ADAPTERS"
    |> System.get_env()
    |> selected_adapters()
    |> Enum.map(&%{db_adapter: &1, db_url: test_db_url(&1)})
  end

  defp selected_adapters(nil) do
    # Postgres is the baseline; optional adapters (MySQL, from stage 2)
    # will join here when their server is reachable locally.
    [:postgres]
  end

  defp selected_adapters(env_value) do
    env_value
    |> String.split(",", trim: true)
    |> Enum.map(&Map.fetch!(@adapter_names, String.trim(&1)))
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

  @doc "Registers an on_exit that drops every table of the run."
  @spec register_table_cleanup(Run.t()) :: :ok
  def register_table_cleanup(%Run{} = run) do
    tables = run |> Run.files_in_order() |> Enum.map(& &1.table_name)
    db = run.config.db

    ExUnit.Callbacks.on_exit(fn -> drop_tables(db, tables) end)
  end

  defp drop_tables(%Db{} = db, tables) do
    with_test_conn(db, fn conn ->
      Enum.each(tables, &Postgrex.query!(conn, ~s(DROP TABLE IF EXISTS "#{&1}"), []))
    end)
  end

  @doc "Runs a SQL query against the context's test database, returning rows."
  @spec db_query!(map(), String.t(), [term()]) :: [[term()]]
  def db_query!(context, sql, params \\ []) do
    db = db_params(context)

    with_test_conn(%Db{adapter: db.adapter, url: db.url}, fn conn ->
      Postgrex.query!(conn, sql, params).rows
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

  defp with_test_conn(%Db{} = db, fun) do
    opts = Db.conn_opts(db)
    {:ok, conn} = Postgrex.start_link(opts ++ [pool_size: 1])

    try do
      fun.(conn)
    after
      GenServer.stop(conn)
    end
  end
end

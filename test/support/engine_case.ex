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

  @doc "The Postgres URL used by DB-backed tests."
  @spec test_db_url() :: String.t()
  def test_db_url do
    System.get_env(
      "CSV2SQL_TEST_POSTGRES_URL",
      "postgres://postgres:postgres@localhost:5432/postgres"
    )
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

  @doc "Builds a valid test `%Config{}` for `source_dir` with overrides."
  @spec build_config(Path.t(), map()) :: Config.t()
  def build_config(source_dir, overrides \\ %{}) do
    {db_overrides, top_overrides} = Map.pop(overrides, :db, %{})

    params =
      Map.merge(
        %{
          source_dir: source_dir,
          # Small pools: many async tests run concurrently against one
          # local Postgres; the auto-sized pool would exhaust max_connections.
          db: Map.merge(%{adapter: :postgres, url: test_db_url(), pool_size: 2}, db_overrides)
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
  @spec run_import(Path.t(), map()) :: %{run_id: String.t(), run: Run.t(), events: [struct()]}
  def run_import(source_dir, overrides \\ %{}) do
    config = build_config(source_dir, overrides)
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
    url = test_db_url()

    ExUnit.Callbacks.on_exit(fn -> drop_tables(url, tables) end)
  end

  defp drop_tables(url, tables) do
    with_test_conn(url, fn conn ->
      Enum.each(tables, &Postgrex.query!(conn, ~s(DROP TABLE IF EXISTS "#{&1}"), []))
    end)
  end

  @doc "Runs a SQL query against the test database, returning rows."
  @spec db_query!(String.t(), [term()]) :: [[term()]]
  def db_query!(sql, params \\ []) do
    with_test_conn(test_db_url(), fn conn ->
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

  defp with_test_conn(url, fun) do
    opts = Db.conn_opts(%Db{adapter: :postgres, url: url})
    {:ok, conn} = Postgrex.start_link(opts ++ [pool_size: 1])

    try do
      fun.(conn)
    after
      GenServer.stop(conn)
    end
  end
end

defmodule Csv2sql.FakeAdapter do
  @moduledoc """
  A scriptable adapter for unit-testing the insert engine without a
  database.

  `conn` is an Agent holding a script: each `insert_rows/4` call pops the
  next entry — `{:ok, :all}` inserts everything, `{:error, class, msg}`
  fails with an error of that class. An exhausted script succeeds.
  All calls are logged for assertions.
  """

  use Csv2sql.Adapter

  defmodule Boom do
    @moduledoc false
    defexception [:class, :message]
  end

  @doc "Starts a script agent. Entries: `{:ok, :all} | {:error, class, msg}`."
  @spec start_script([tuple()]) :: {:ok, pid()}
  def start_script(script), do: Agent.start_link(fn -> %{script: script, calls: []} end)

  @doc "The rows passed to each insert_rows call, in order."
  @spec calls(pid()) :: [[[term()]]]
  def calls(agent), do: agent |> Agent.get(& &1.calls) |> Enum.reverse()

  @impl true
  def pool_spec(_db, _opts), do: raise("FakeAdapter has no pool")

  @impl true
  def ensure_database(_db), do: :ok

  @impl true
  def quote_ident(name), do: name

  @impl true
  def sql_type(_type), do: "FAKE"

  @impl true
  def placeholder(_index), do: "?"

  @impl true
  def query(_conn, _sql, _params), do: {:ok, %{num_rows: 0, rows: [[0]]}}

  @impl true
  def table_exists?(_conn, _table), do: false

  @impl true
  def insert_rows(agent, _table, _columns, rows) do
    action =
      Agent.get_and_update(agent, fn %{script: script, calls: calls} = state ->
        case script do
          [next | rest] -> {next, %{state | script: rest, calls: [rows | calls]}}
          [] -> {{:ok, :all}, %{state | calls: [rows | calls]}}
        end
      end)

    case action do
      {:ok, :all} -> {:ok, length(rows)}
      {:error, class, message} -> {:error, %Boom{class: class, message: message}}
    end
  end

  @impl true
  def classify_error(%Boom{class: class}), do: class
  def classify_error(%DBConnection.ConnectionError{}), do: :connection
  def classify_error(_error), do: :fatal
end

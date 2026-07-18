defmodule Csv2sql do
  @moduledoc """
  Csv2sql — bulk-load CSV files into a database with automatic schema
  inference.

  This module is the public API of the engine. A *run* imports (or, in
  `:analyze` mode, dry-runs) every CSV in a source directory:

      {:ok, config} =
        Csv2sql.Config.new(%{
          source_dir: "/data/csvs",
          db: %{adapter: :postgres, url: "postgres://localhost/mydb"}
        })

      {:ok, run_id} = Csv2sql.start_run(config, subscribe: true)
      {:ok, run} = Csv2sql.await(run_id)

  Progress arrives as `Csv2sql.Events` structs on the caller's mailbox
  (when subscribed) — the LiveView UI, the CLI reporter, and the test
  harness all consume the same events.

  Runs are fully isolated: each gets its own supervision tree, DB
  connection pool, and registry-scoped names, so concurrent runs coexist.
  """

  alias Csv2sql.Config
  alias Csv2sql.Events
  alias Csv2sql.Run

  @doc """
  Starts a run and returns its id.

  Options:

    * `:subscribe` — when `true`, subscribes the caller to the run's
      events *before* the run starts, so no event can be missed.

  """
  @spec start_run(Config.t(), Keyword.t()) :: {:ok, String.t()} | {:error, term()}
  def start_run(%Config{} = config, opts \\ []) do
    run_id = generate_run_id()

    if opts[:subscribe], do: Events.subscribe(run_id)

    case DynamicSupervisor.start_child(Csv2sql.RunsSupervisor, {Run.Supervisor, {run_id, config}}) do
      {:ok, _pid} ->
        {:ok, run_id}

      {:error, reason} ->
        if opts[:subscribe], do: Events.unsubscribe(run_id)
        {:error, reason}
    end
  end

  @doc "The current state of a run (`{:error, :not_found}` after teardown)."
  @spec run_state(String.t()) :: {:ok, Run.t()} | {:error, :not_found}
  def run_state(run_id) do
    case Run.whereis(Run.server_name(run_id)) do
      nil -> {:error, :not_found}
      _pid -> {:ok, Run.Server.get_state(run_id)}
    end
  end

  @doc """
  All currently known runs (newest first). Runs disappear a grace period
  after reaching a terminal state (their reports remain on disk).
  """
  @spec list_runs() :: [Run.t()]
  def list_runs do
    Csv2sql.RunRegistry
    |> Registry.select([{{{:server, :"$1"}, :_, :_}, [], [:"$1"]}])
    |> Enum.flat_map(fn run_id ->
      case run_state(run_id) do
        {:ok, run} -> [run]
        {:error, :not_found} -> []
      end
    end)
    |> Enum.sort_by(& &1.started_at, {:desc, DateTime})
  end

  @doc "Cancels a running run (idempotent)."
  @spec cancel_run(String.t()) :: :ok | {:error, :not_found}
  def cancel_run(run_id) do
    case Run.whereis(Run.server_name(run_id)) do
      nil -> {:error, :not_found}
      _pid -> Run.Server.cancel(run_id)
    end
  end

  @doc """
  Blocks until the run reaches a terminal state and returns it.

  Subscribes to the run's events, so waiting is message-driven — no
  polling loop.
  """
  @spec await(String.t(), timeout()) :: {:ok, Run.t()} | {:error, :not_found | :timeout}
  def await(run_id, timeout \\ :timer.minutes(5)) do
    Events.subscribe(run_id)

    case run_state(run_id) do
      {:ok, %Run{} = run} ->
        if Run.terminal?(run), do: {:ok, run}, else: wait_for_terminal(run_id, timeout)

      {:error, :not_found} ->
        {:error, :not_found}
    end
  end

  defp wait_for_terminal(run_id, timeout) do
    receive do
      %{run_id: ^run_id} = event ->
        if is_struct(event) and Events.terminal?(event) do
          run_state(run_id)
        else
          wait_for_terminal(run_id, timeout)
        end
    after
      timeout -> {:error, :timeout}
    end
  end

  defp generate_run_id do
    8 |> :crypto.strong_rand_bytes() |> Base.encode32(case: :lower, padding: false)
  end
end

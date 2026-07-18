defmodule Csv2sql.Run.Supervisor do
  @moduledoc """
  The per-run supervision tree.

      Run.Supervisor (temporary, max_restarts: 0)
      ├── Run.Server          — state, events, cancel; outlives the core
      └── core (Supervisor, temporary, max_restarts: 0)
          ├── DB pool         — owned by the run; dies with it
          ├── Task.Supervisor — file/insert workers
          └── Run.Pipeline    — the orchestration task

  Nothing inside a run is ever restarted: worker failures surface as
  file-level errors, a pipeline crash is converted to `RunFailed` by the
  server (which monitors it), and a server crash tears the whole run down.
  """

  use Supervisor, restart: :temporary

  alias Csv2sql.Config
  alias Csv2sql.Config.Db
  alias Csv2sql.Run
  alias Csv2sql.Run.Pipeline

  @spec start_link({String.t(), Config.t()}) :: Supervisor.on_start()
  def start_link({run_id, %Config{} = config}) do
    Supervisor.start_link(__MODULE__, {run_id, config}, name: Run.sup_name(run_id))
  end

  @impl true
  def init({run_id, config}) do
    children = [
      {Csv2sql.Run.Server, {run_id, config}},
      %{
        id: :core,
        type: :supervisor,
        restart: :temporary,
        start:
          {Supervisor, :start_link,
           [
             core_children(run_id, config),
             [strategy: :one_for_one, max_restarts: 0, name: Run.core_name(run_id)]
           ]}
      }
    ]

    Supervisor.init(children, strategy: :one_for_one, max_restarts: 0)
  end

  defp core_children(run_id, config) do
    db_children(run_id, config) ++
      [
        {Task.Supervisor, name: Run.tasks_name(run_id)},
        Supervisor.child_spec(
          {Task, fn -> Pipeline.run(run_id, config) end},
          id: :pipeline,
          restart: :temporary
        )
      ]
  end

  # Analyze mode (dry run) never touches a database — no pool, no
  # database creation/verification.
  defp db_children(_run_id, %Config{mode: :analyze}), do: []

  defp db_children(run_id, config) do
    adapter = Config.adapter(config)
    pool_size = Db.pool_size(config.db, config)

    [
      %{
        id: :ensure_database,
        restart: :temporary,
        start: {__MODULE__, :start_ensure_database, [adapter, config.db]}
      },
      adapter.pool_spec(config.db, name: Run.pool_name(run_id), pool_size: pool_size)
    ]
  end

  @doc false
  # Runs as a child "start" before the pool: does its work and returns
  # :ignore (nothing to supervise) or fails the whole run tree startup
  # with a meaningful reason.
  @spec start_ensure_database(module(), Db.t()) :: :ignore | {:error, term()}
  def start_ensure_database(adapter, db) do
    case adapter.ensure_database(db) do
      :ok -> :ignore
      {:error, reason} -> {:error, {:ensure_database_failed, reason}}
    end
  end
end

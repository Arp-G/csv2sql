defmodule Csv2sql.Run do
  @moduledoc """
  The state of one run, plus the per-run process naming scheme.

  Nothing in a run is globally named: every process registers under
  `Csv2sql.RunRegistry` keyed by `run_id`, so concurrent runs coexist and
  a finished/crashed run can never collide with the next one.
  """

  alias Csv2sql.Config
  alias Csv2sql.Error
  alias Csv2sql.File, as: CsvFile
  alias Csv2sql.Run.Summary

  @enforce_keys [:id, :config, :started_at]
  defstruct [
    :id,
    :config,
    :started_at,
    :finished_at,
    :summary,
    :error,
    status: :pending,
    files: %{},
    file_order: []
  ]

  @type status :: :pending | :running | :completed | :completed_with_errors | :failed | :cancelled

  @type t :: %__MODULE__{
          id: String.t(),
          config: Config.t(),
          started_at: DateTime.t(),
          finished_at: DateTime.t() | nil,
          summary: Summary.t() | nil,
          error: Error.t() | nil,
          status: status(),
          files: %{optional(String.t()) => CsvFile.t()},
          file_order: [String.t()]
        }

  @terminal [:completed, :completed_with_errors, :failed, :cancelled]

  @doc "Whether the run reached a terminal status."
  @spec terminal?(t() | status()) :: boolean()
  def terminal?(%__MODULE__{status: status}), do: terminal?(status)
  def terminal?(status), do: status in @terminal

  @doc "Stores the discovered files (establishes ordering)."
  @spec set_files(t(), [CsvFile.t()]) :: t()
  def set_files(%__MODULE__{} = run, files) do
    %{
      run
      | files: Map.new(files, &{&1.path, &1}),
        file_order: Enum.map(files, & &1.path)
    }
  end

  @doc "Upserts one file's state."
  @spec put_file(t(), CsvFile.t()) :: t()
  def put_file(%__MODULE__{} = run, %CsvFile{} = file) do
    %{run | files: Map.put(run.files, file.path, file)}
  end

  @doc "Files in stable discovery order."
  @spec files_in_order(t()) :: [CsvFile.t()]
  def files_in_order(%__MODULE__{} = run) do
    run.file_order |> Enum.map(&run.files[&1]) |> Enum.filter(& &1)
  end

  # -- Registry names ---------------------------------------------------------

  @doc "Via-name of the run's state server."
  @spec server_name(String.t()) :: {:via, module(), term()}
  def server_name(run_id), do: via({:server, run_id})

  @doc "Via-name of the run's DB connection pool."
  @spec pool_name(String.t()) :: {:via, module(), term()}
  def pool_name(run_id), do: via({:pool, run_id})

  @doc "Via-name of the run's task supervisor."
  @spec tasks_name(String.t()) :: {:via, module(), term()}
  def tasks_name(run_id), do: via({:tasks, run_id})

  @doc "Via-name of the run's core supervisor."
  @spec core_name(String.t()) :: {:via, module(), term()}
  def core_name(run_id), do: via({:core, run_id})

  @doc "Via-name of the run's top-level supervisor."
  @spec sup_name(String.t()) :: {:via, module(), term()}
  def sup_name(run_id), do: via({:sup, run_id})

  @doc "Resolves a run-scoped name to a pid."
  @spec whereis({:via, module(), term()}) :: pid() | nil
  def whereis({:via, Registry, {registry, key}}) do
    case Registry.lookup(registry, key) do
      [{pid, _value}] -> pid
      [] -> nil
    end
  end

  defp via(key), do: {:via, Registry, {Csv2sql.RunRegistry, key}}
end

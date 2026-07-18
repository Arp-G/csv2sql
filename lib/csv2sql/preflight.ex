defmodule Csv2sql.Preflight do
  @moduledoc """
  Pre-run checklist, executed before any file is touched.

  Every check runs (failures don't short-circuit, so the user sees the
  full picture), each is broadcast as a `PreflightCheck` event, and any
  `:failed` check blocks the run with a clear `RunFailed`. Analyze mode
  skips the database checks entirely.
  """

  use Ecto.Schema

  alias Csv2sql.Config
  alias Csv2sql.Events
  alias Csv2sql.Run.Artifacts

  defmodule Check do
    @moduledoc "One preflight check result."
    use Ecto.Schema

    @ids [:source_dir, :artifacts_dir, :database, :permissions]
    @statuses [:passed, :failed, :warning, :skipped]

    @primary_key false
    embedded_schema do
      field(:id, Ecto.Enum, values: @ids)
      field(:status, Ecto.Enum, values: @statuses)
      field(:detail, :string, default: "")
    end

    @type t :: %__MODULE__{
            id: :source_dir | :artifacts_dir | :database | :permissions,
            status: :passed | :failed | :warning | :skipped,
            detail: String.t()
          }
  end

  @doc "Runs all checks, emitting a `PreflightCheck` event per result."
  @spec run(String.t(), Config.t(), module(), term()) :: [Check.t()]
  def run(run_id, %Config{} = config, adapter, conn) do
    [
      source_dir_check(config),
      artifacts_dir_check(config, run_id),
      database_check(config, adapter),
      permissions_check(config, adapter, conn)
    ]
    |> Enum.map(fn check ->
      Events.emit(run_id, Events.PreflightCheck, check: check)
      check
    end)
  end

  @doc "Whether any check blocks the run."
  @spec blocked?([Check.t()]) :: boolean()
  def blocked?(checks), do: Enum.any?(checks, &(&1.status == :failed))

  @doc "A one-line summary of the failed checks."
  @spec failure_summary([Check.t()]) :: String.t()
  def failure_summary(checks) do
    checks
    |> Enum.filter(&(&1.status == :failed))
    |> Enum.map_join("; ", &"#{&1.id}: #{&1.detail}")
  end

  defp source_dir_check(config) do
    case File.ls(config.source_dir) do
      {:ok, entries} ->
        csv_count = Enum.count(entries, &(&1 |> String.downcase() |> String.ends_with?(".csv")))

        if csv_count > 0 do
          %Check{id: :source_dir, status: :passed, detail: "#{csv_count} CSV file(s)"}
        else
          %Check{id: :source_dir, status: :warning, detail: "no CSV files found"}
        end

      {:error, reason} ->
        %Check{id: :source_dir, status: :failed, detail: "cannot read directory: #{reason}"}
    end
  end

  defp artifacts_dir_check(config, run_id) do
    dir = Artifacts.ensure_dir!(config, run_id)
    probe = Path.join(dir, ".write_probe")
    File.write!(probe, "ok")
    File.rm!(probe)
    %Check{id: :artifacts_dir, status: :passed, detail: dir}
  rescue
    exception ->
      %Check{id: :artifacts_dir, status: :failed, detail: Exception.message(exception)}
  end

  defp database_check(%Config{mode: :analyze}, _adapter),
    do: %Check{id: :database, status: :skipped, detail: "analyze mode"}

  defp database_check(config, adapter) do
    case adapter.ensure_database(config.db) do
      :ok ->
        %Check{id: :database, status: :passed, detail: "reachable (auto-created if supported)"}

      {:error, {:database_not_found, name}} ->
        %Check{
          id: :database,
          status: :failed,
          detail: "database #{inspect(name)} does not exist — create it first"
        }

      {:error, reason} ->
        %Check{id: :database, status: :failed, detail: error_detail(reason)}
    end
  end

  defp permissions_check(%Config{mode: :analyze}, _adapter, _conn),
    do: %Check{id: :permissions, status: :skipped, detail: "analyze mode"}

  defp permissions_check(_config, adapter, conn) do
    case adapter.permissions_probe(conn) do
      :ok ->
        %Check{id: :permissions, status: :passed, detail: "CREATE/INSERT/DROP verified"}

      {:error, reason} ->
        %Check{id: :permissions, status: :failed, detail: error_detail(reason)}
    end
  end

  defp error_detail(%{__exception__: true} = exception), do: Exception.message(exception)
  defp error_detail(reason), do: inspect(reason)
end

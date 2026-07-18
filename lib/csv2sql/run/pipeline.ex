defmodule Csv2sql.Run.Pipeline do
  @moduledoc """
  The per-run orchestration fold.

  Discovers files, fans them out through `FilePipeline` with bounded
  concurrency, and reports completion. Completion is structural — when the
  stream below returns, the run is done; there is no completion-counting
  protocol anywhere.

  Files are isolated: a file whose process crashes becomes a `FileFailed`
  and its siblings keep going.
  """

  alias Csv2sql.Config
  alias Csv2sql.Error
  alias Csv2sql.Events
  alias Csv2sql.Events.FileFailed
  alias Csv2sql.File, as: CsvFile
  alias Csv2sql.Preflight
  alias Csv2sql.Run
  alias Csv2sql.Run.Artifacts
  alias Csv2sql.Run.FilePipeline
  alias Csv2sql.Run.Server
  alias Csv2sql.Source.Discovery
  alias Csv2sql.TimeParse

  @doc "Runs the pipeline for `run_id`. Called inside the run's core task."
  @spec run(String.t(), Config.t()) :: :ok
  def run(run_id, %Config{} = config) do
    Server.pipeline_started(run_id, self())

    adapter = Config.adapter(config)
    conn = Run.pool_name(run_id)

    checks = Preflight.run(run_id, config, adapter, conn)
    Server.preflight(run_id, checks)

    if Preflight.blocked?(checks) do
      error = Error.run_error(:preflight, :preflight_failed, Preflight.failure_summary(checks))
      Server.fail_run(run_id, error)
      :ok
    else
      execute(run_id, config, adapter, conn)
    end
  end

  defp execute(run_id, config, adapter, conn) do
    files = Discovery.discover(config.source_dir)
    Server.started(run_id, files)

    # Config validation guarantees these compile.
    {:ok, date_patterns} = TimeParse.compile_all(config.date_patterns)
    {:ok, datetime_patterns} = TimeParse.compile_all(config.datetime_patterns)

    ctx = %{
      run_id: run_id,
      config: config,
      adapter: adapter,
      conn: conn,
      parsers: %{date: date_patterns, datetime: datetime_patterns},
      artifacts_dir: Artifacts.ensure_dir!(config, run_id),
      # Probed once per run (import mode only — analyze has no pool): the
      # byte budget for one INSERT is the configured chunk budget, capped
      # by the server's packet limit.
      max_insert_bytes: if(config.mode == :import, do: max_insert_bytes(adapter, conn, config))
    }

    results =
      Run.tasks_name(run_id)
      |> Task.Supervisor.async_stream_nolink(files, &FilePipeline.run(&1, ctx),
        max_concurrency: config.file_workers,
        ordered: true,
        timeout: :infinity
      )
      |> Enum.zip(files)
      |> Enum.map(&unwrap(&1, run_id))

    Server.complete(run_id, results)
    :ok
  end

  defp max_insert_bytes(adapter, conn, config) do
    packet = adapter.max_packet_bytes(conn)
    min(config.insert_chunk_bytes, div(packet * 8, 10))
  end

  defp unwrap({{:ok, %CsvFile{} = file}, _original}, _run_id), do: file

  defp unwrap({{:exit, reason}, %CsvFile{} = original}, run_id) do
    error = Error.from_caught(:load, original.path, :exit, reason)
    file = CsvFile.fail(original, error)
    Server.file_update(run_id, file)
    Events.emit(run_id, FileFailed, path: file.path, error: error)
    file
  end
end

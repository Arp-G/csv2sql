defmodule Csv2sql.Run.Server do
  @moduledoc """
  The per-run state server.

  Owns the authoritative `%Csv2sql.Run{}`, receives progress posts from the
  pipeline, emits run-lifecycle events, and implements cancellation. It
  monitors the pipeline task and converts an abnormal exit into `RunFailed` —
  there is no other crash-handling protocol.

  After a terminal state the server stays queryable for a grace period,
  then asks the runs supervisor to tear the whole run tree down.
  """

  use GenServer

  alias Csv2sql.Config
  alias Csv2sql.Error
  alias Csv2sql.Events
  alias Csv2sql.Events.{RunCancelled, RunCompleted, RunFailed, RunStarted}
  alias Csv2sql.File, as: CsvFile
  alias Csv2sql.Run
  alias Csv2sql.Run.Summary

  @teardown_after :timer.seconds(60)

  # -- Client API -------------------------------------------------------------

  @spec start_link({String.t(), Config.t()}) :: GenServer.on_start()
  def start_link({run_id, config}) do
    GenServer.start_link(__MODULE__, {run_id, config}, name: Run.server_name(run_id))
  end

  @doc "Registers and monitors the pipeline task."
  @spec pipeline_started(String.t(), pid()) :: :ok
  def pipeline_started(run_id, pid),
    do: GenServer.call(Run.server_name(run_id), {:pipeline_started, pid})

  @doc "Records discovered files and emits `RunStarted` (synchronous, so ordering is deterministic)."
  @spec started(String.t(), [CsvFile.t()]) :: :ok
  def started(run_id, files), do: GenServer.call(Run.server_name(run_id), {:started, files})

  @doc "Posts an updated per-file state."
  @spec file_update(String.t(), CsvFile.t()) :: :ok
  def file_update(run_id, file), do: GenServer.cast(Run.server_name(run_id), {:file_update, file})

  @doc "Marks the run complete with final per-file states."
  @spec complete(String.t(), [CsvFile.t()]) :: :ok
  def complete(run_id, files), do: GenServer.call(Run.server_name(run_id), {:complete, files})

  @doc "The current run state."
  @spec get_state(String.t()) :: Run.t()
  def get_state(run_id), do: GenServer.call(Run.server_name(run_id), :get_state)

  @doc "Cancels a running run (idempotent)."
  @spec cancel(String.t()) :: :ok
  def cancel(run_id), do: GenServer.call(Run.server_name(run_id), :cancel)

  @doc """
  Fails the whole run (idempotent): stops the core, marks unfinished
  files `:skipped`, emits `RunFailed`. Used for run-fatal errors
  (database unreachable) and strict mode.
  """
  @spec fail_run(String.t(), Error.t()) :: :ok
  def fail_run(run_id, %Error{} = error),
    do: GenServer.call(Run.server_name(run_id), {:fail_run, error})

  # -- Server -----------------------------------------------------------------

  @impl true
  def init({run_id, config}) do
    run = %Run{id: run_id, config: config, started_at: DateTime.utc_now()}
    {:ok, %{run: run, pipeline_ref: nil}}
  end

  @impl true
  def handle_call({:pipeline_started, pid}, _from, state) do
    {:reply, :ok, %{state | pipeline_ref: Process.monitor(pid)}}
  end

  def handle_call({:started, files}, _from, %{run: run} = state) do
    run = %{Run.set_files(run, files) | status: :running}
    Events.emit(run.id, RunStarted, file_count: length(files))
    Enum.each(files, &Events.emit(run.id, Events.FileDiscovered, file: &1))
    {:reply, :ok, %{state | run: run}}
  end

  def handle_call({:complete, files}, _from, %{run: run} = state) do
    duration = DateTime.diff(DateTime.utc_now(), run.started_at, :millisecond)
    summary = Summary.build(files, duration)

    status = if summary.files_failed > 0, do: :completed_with_errors, else: :completed

    run =
      Enum.reduce(files, run, &Run.put_file(&2, &1))
      |> Map.put(:status, status)
      |> Map.put(:finished_at, DateTime.utc_now())
      |> Map.put(:summary, summary)

    Events.emit(run.id, RunCompleted, summary: summary)
    {:reply, :ok, schedule_teardown(%{state | run: run})}
  end

  def handle_call(:get_state, _from, state), do: {:reply, state.run, state}

  def handle_call(:cancel, _from, %{run: run} = state) do
    if Run.terminal?(run) do
      {:reply, :ok, state}
    else
      stop_core(run.id)
      run = %{run | status: :cancelled, finished_at: DateTime.utc_now()}
      Events.emit(run.id, RunCancelled)
      {:reply, :ok, schedule_teardown(%{state | run: run})}
    end
  end

  def handle_call({:fail_run, error}, _from, %{run: run} = state) do
    if Run.terminal?(run) do
      {:reply, :ok, state}
    else
      stop_core(run.id)

      run = %{
        run
        | files: skip_unfinished(run.files),
          status: :failed,
          finished_at: DateTime.utc_now(),
          error: error
      }

      Events.emit(run.id, RunFailed, error: error)
      {:reply, :ok, schedule_teardown(%{state | run: run})}
    end
  end

  @impl true
  def handle_cast({:file_update, file}, %{run: run} = state) do
    {:noreply, %{state | run: Run.put_file(run, file)}}
  end

  @impl true
  def handle_info({:DOWN, ref, :process, _pid, reason}, %{pipeline_ref: ref, run: run} = state) do
    if Run.terminal?(run) or reason == :normal do
      {:noreply, state}
    else
      error =
        Error.run_error(
          :load,
          :pipeline_crashed,
          reason |> Exception.format_exit() |> String.slice(0, 2000)
        )

      run = %{run | status: :failed, finished_at: DateTime.utc_now(), error: error}
      Events.emit(run.id, RunFailed, error: error)
      {:noreply, schedule_teardown(%{state | run: run})}
    end
  end

  def handle_info(:teardown, %{run: run} = state) do
    # Termination must come from outside this process (we are part of the
    # tree being stopped), hence the detached task.
    run_id = run.id

    Task.start(fn ->
      case Run.whereis(Run.sup_name(run_id)) do
        nil -> :ok
        pid -> DynamicSupervisor.terminate_child(Csv2sql.RunsSupervisor, pid)
      end
    end)

    {:noreply, state}
  end

  def handle_info(_message, state), do: {:noreply, state}

  defp skip_unfinished(files) do
    Map.new(files, fn
      {path, %CsvFile{status: status} = file} when status not in [:done, :failed, :skipped] ->
        {path, %{file | status: :skipped}}

      {path, file} ->
        {path, file}
    end)
  end

  defp stop_core(run_id) do
    case Run.whereis(Run.core_name(run_id)) do
      nil ->
        :ok

      pid ->
        # Async: the pipeline may be mid-call to this server; a synchronous
        # stop here could deadlock on its shutdown.
        Task.start(fn -> Supervisor.stop(pid, :shutdown) end)
    end
  end

  defp schedule_teardown(state) do
    Process.send_after(self(), :teardown, @teardown_after)
    state
  end
end

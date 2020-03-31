defmodule Csv2sql.Server do
  use GenServer

  @schema_file_path Application.get_env(:csv2sql, Csv2sql.SchemaMaker)[:schema_file_path]
  def start_link(worker_count) do
    GenServer.start_link(__MODULE__, worker_count, name: __MODULE__)
  end

  def work_done() do
    GenServer.cast(__MODULE__, :done)
  end

  # Starts the server with initial state set to worker_count
  # The init function uses send_after to tell the runtime to queue a message to this
  # server immediately (that is, after waiting 0 ms). When the init function exits, the
  # server is then free to pick up this message, which triggers the handle_info
  # callback, and the workers get started
  def init(worker_count) do
    Process.send_after(self(), :kickoff, 0)
    {:ok, worker_count}
  end

  def handle_info(:kickoff, worker_count) do
    Csv2sql.DB.prepare_db()

    File.rm(@schema_file_path <> "/" <> "schema.sql")

    1..worker_count
    |> Enum.each(fn _ -> Csv2sql.WorkerSupervisor.add_worker() end)

    {:noreply, worker_count}
  end

  def handle_cast(:done, 1) do
    :timer.sleep(100)
    Csv2sql.TimerServer.get_time_spend()
    :timer.sleep(100)
    # validate_results()
    System.halt(0)
  end

  def handle_cast(:done, worker_count) do
    {:noreply, worker_count - 1}
  end
end

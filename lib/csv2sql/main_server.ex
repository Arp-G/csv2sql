defmodule Csv2sql.MainServer do
  use GenServer

  @worker_count Application.get_env(:csv2sql, Csv2sql.MainServer)[:worker_count]
  @db_worker_count Application.get_env(:csv2sql, Csv2sql.MainServer)[:db_worker_count]
  @schema_file_path Application.get_env(:csv2sql, Csv2sql.SchemaMaker)[:schema_file_path]
  @imported_csv_directory Application.get_env(:csv2sql, Csv2sql.MainServer)[
                            :imported_csv_directory
                          ]
  def start_link(_) do
    GenServer.start_link(__MODULE__, :no_args, name: __MODULE__)
  end

  def work_done() do
    GenServer.cast(__MODULE__, :done)
  end

  # Starts the server with initial state set to worker_count
  # The init function uses send_after to tell the runtime to queue a message to this
  # server immediately (that is, after waiting 0 ms). When the init function exits, the
  # server is then free to pick up this message, which triggers the handle_info
  # callback, and the workers get started
  def init(_) do
    Process.send_after(self(), :kickoff, 0)
    {:ok, @worker_count}
  end

  def handle_info(:kickoff, worker_count) do
    Csv2sql.Helpers.greet()

    Csv2sql.Database.prepare_db()

    File.rm(@schema_file_path <> "/" <> "schema.sql")

    1..@worker_count
    |> Enum.each(fn _ -> Csv2sql.WorkerSupervisor.add_worker() end)

    1..@db_worker_count
    |> Enum.each(fn _ -> Csv2sql.DbWorkerSupervisor.add_worker() end)

    {:noreply, worker_count}
  end

  def handle_cast(:done, 1) do
    wait_for_pending_jobs()

    :timer.sleep(2000)

    # Add line break
    IO.puts("----------------------------------------")
    IO.puts("")

    CliSpinners.spin_fun(
      [
        frames: :arrow2,
        text: "Finished importing CSVs...",
        done: ""
      ],
      fn ->
        CliSpinners.spin(
          frames: :clock,
          text: "Staring Validation Process...",
          done: "Staring Validation Process..."
        )

        :timer.sleep(3000)
      end
    )

    Csv2sql.Helpers.print_msg("\nValidation Process Started...\n\n", :green)

    Csv2sql.ImportValidator.validate_import(@imported_csv_directory)

    Csv2sql.TimerServer.get_time_spend()

    :timer.sleep(100)

    System.halt(0)

    {:noreply, 0}
  end

  def handle_cast(:done, worker_count) do
    {:noreply, worker_count - 1}
  end

  defp wait_for_pending_jobs() do
    cond do
      Csv2sql.JobQueueServer.get_job_count() > 0 -> wait_for_pending_jobs()
      true -> nil
    end
  end
end

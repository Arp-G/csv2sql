defmodule Csv2sql.MainServer do
  use GenServer
  alias Csv2sql.{JobQueueServer, Database, Observer}

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
    make_directories_if_not_present()
    Process.send_after(self(), :kickoff, 0)
    worker_count = Application.get_env(:csv2sql, Csv2sql.MainServer)[:worker_count]
    {:ok, worker_count}
  end

  def handle_info(:kickoff, worker_count) do
    worker_config = Application.get_env(:csv2sql, Csv2sql.Worker)
    main_server_config = Application.get_env(:csv2sql, Csv2sql.MainServer)

    if worker_config[:set_insert_schema] || worker_config[:set_insert_data],
      do: Database.prepare_db()

    if Application.get_env(:csv2sql, Csv2sql.Worker)[:set_make_schema],
      do: File.rm("#{main_server_config[:db_worker_count]}/schema.sql")

    1..worker_count
    |> Enum.each(fn _ -> Csv2sql.WorkerSupervisor.add_worker() end)

    1..main_server_config[:db_worker_count]
    |> Enum.each(fn _ -> Csv2sql.DbWorkerSupervisor.add_worker() end)

    {:noreply, worker_count}
  end

  def handle_cast(:done, 1) do
    Observer.update_active_worker_count(0)

    wait_for_pending_jobs()

    :timer.sleep(1000)

    start_validation_message()

    if(Application.get_env(:csv2sql, Csv2sql.MainServer)[:set_validate]) do
      Observer.change_stage(:validation)

      Csv2sql.Helpers.print_msg("\nValidation Process Started...\n\n", :green)

      %{file_list: file_list} = Csv2sql.Observer.get_stats()

      Csv2sql.ImportValidator.validate_import(file_list)
      |> Csv2sql.Observer.update_validation_status()
    else
      Csv2sql.Observer.update_validation_status({:skipped, nil})
      Csv2sql.Helpers.print_msg("\nValidation Process Skipped...\n\n", :green)
    end

    pretty_print_time_take()

    :timer.sleep(100)

    Observer.change_stage(:finish)

    {:noreply, 0}
  end

  def handle_cast(:done, worker_count) do
    Csv2sql.Observer.update_active_worker_count(worker_count - 1)
    {:noreply, worker_count - 1}
  end

  defp wait_for_pending_jobs() do
    cond do
      JobQueueServer.get_job_count() > 0 -> wait_for_pending_jobs()
      true -> nil
    end
  end

  defp pretty_print_time_take() do
    %{start_time: start_time} = Csv2sql.Observer.get_stats()

    time_taken =
      DateTime.utc_now()
      |> Time.diff(start_time, :millisecond)
      |> Kernel./(1000)
      |> Float.round()

    """

    ----------------------------------------

    FINISHED !!!

    The operation took #{time_taken} seconds


    ----------------------------------------

    """
    |> Csv2sql.Helpers.print_msg(:green)
  end

  defp make_directories_if_not_present() do
    source_csv_directory =
      Application.get_env(:csv2sql, Csv2sql.MainServer)[:source_csv_directory]

    imported_csv_directory =
      Application.get_env(:csv2sql, Csv2sql.MainServer)[:imported_csv_directory]

    validated_csv_directory =
      Application.get_env(:csv2sql, Csv2sql.MainServer)[:validated_csv_directory]

    if source_csv_directory && !File.exists?(source_csv_directory) do
      Csv2sql.Helpers.print_msg("ERROR: csv source directory does not exists !", :red)
      System.halt(0)
    end

    if imported_csv_directory, do: File.mkdir(imported_csv_directory)

    if validated_csv_directory, do: File.mkdir(validated_csv_directory)
  end

  defp start_validation_message() do
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
  end
end

defmodule Csv2sql do
  @spec start() :: :ok
  def start() do
    # Subscribe to progress tracker
    Csv2sql.ProgressTracker.add_subscriber()

    # Trap Exits
    Process.flag(:trap_exit, true)

    # Load configurations
    Csv2sql.Config.Loader.load(%{
      db_type: "mysql",
      db_url: "root:root@localhost/csv2sql?socket=/var/run/mysqld/mysqld.sock&pool_size=15",
      log: false,
      source_directory: "/home/arpan/dev/csv2sql/apps/csv2sql/priv/"
    })

    # Begin analysis
    Csv2sql.Stages.Analyze.analyze_files()

    # Await messages
    receive do
      :finish ->
        IO.puts("Received finish message ")

      {:error, err} ->
        IO.puts("Received error message #{inspect(err)}")

      {:EXIT, _pid, reason} ->
        IO.puts("Exited with reason #{inspect(reason)}")

      msg ->
        IO.puts("Unexpected message received #{inspect(msg)}")
    end
  end
end

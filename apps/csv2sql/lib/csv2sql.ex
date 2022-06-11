defmodule Csv2sql do
  @spec start() :: :ok
  def start() do
    Csv2sql.ProgressTracker.add_subscriber()

    Csv2sql.Config.Loader.load(%{
      db_type: "mysql",
      db_url: "root:root@localhost/csv2sql?socket=/var/run/mysqld/mysqld.sock&pool_size=15",
      log: false,
      source_directory: "/home/arpan/dev/csv2sql/apps/csv2sql/priv/src"
    })

    Csv2sql.Stages.Analyze.analyze_files()

    receive do
      :finish ->
        IO.puts("Received finish message ")

      {:error, err} ->
        IO.puts("Received error message #{inspect(err)}")

      msg ->
        IO.puts("Unexpected message received #{inspect(msg)}")
    end
  end
end

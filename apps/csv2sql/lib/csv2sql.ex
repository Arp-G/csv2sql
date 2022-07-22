defmodule Csv2sql do
  require Logger

  @spec main([binary]) :: :ok
  def main(args) do
    case Csv2sql.Config.Parser.parse(args) do
      {:cont, parsed} ->
        Csv2sql.Config.Loader.load(parsed)
        Csv2sql.Stages.Analyze.analyze_files()

      {:stop, text} ->
        Logger.info(text)
    end
  end

  # For testing
  @spec start() :: :ok
  def start() do
    # Subscribe to progress tracker
    Csv2sql.ProgressTracker.add_subscriber()

    # Trap Exits
    Process.flag(:trap_exit, true)

    # Load configurations
    Csv2sql.Config.Loader.load(%{
      db_type: "mysql",
      db_url: "root:mysql@localhost/csv2sql",
      log: false,
      source_directory: "/home/arpan/dev/others/csv2sql/apps/csv2sql/priv/"
    })

    # Begin analysis
    Task.start(fn -> Csv2sql.Stages.Analyze.analyze_files() end)

    # Await messages
    receive do
      :finish ->
        IO.puts("Received finish message ")
        :finish

      {:error, err} ->
        IO.puts("Received error message #{inspect(err)}")
        err

      {:EXIT, _pid, reason} ->
        IO.puts("Exited with reason #{inspect(reason)}")
        reason

      msg ->
        IO.puts("Unexpected message received #{inspect(msg)}")
        msg
    end
  end
end

defmodule Csv2sql.Application do
  @moduledoc """
    Main application module for csv2sql
  """

  use Application
  @current_env Mix.env()

  def start(_type, _args) do
    children = [
      Csv2sql.ProgressTracker,
      {Registry, keys: :unique, name: Csv2sql.Loader.ProducerRegistry},
      {Task.Supervisor, name: Csv2sql.Database.ConnectionSupervisor},
      Csv2sql.Database.ConnectionTest
    ]

    opts = [strategy: :one_for_one, name: Csv2sql.Supervisor]
    res = Supervisor.start_link(children, opts)

    # Don't start loading CSVs on app start for dev and test environments
    if @current_env == :prod, do: kickoff()
    res
  end

  defp get_args do
    # REF: https://github.com/bake-bake-bake/bakeware/blob/main/lib/bakeware/script.ex
    argc_str = System.get_env("BAKEWARE_ARGC", "0")

    argc =
      case Integer.parse(argc_str) do
        {argc, ""} -> argc
        _ -> raise "Invalid BAKEWARE_ARGC - #{argc_str}"
      end

    if argc > 0, do: for(v <- 1..argc, do: System.get_env("BAKEWARE_ARG#{v}")), else: []
  end

  defp kickoff do
    Csv2sql.ProgressTracker.add_subscriber()
    get_args() |> Csv2sql.main()
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

    # Application.stop(:csv2sql)
    System.stop()
    # exit(:normal)
  end
end

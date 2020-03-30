defmodule Csv2sql.Server do
  use GenServer

  @source_csv_directory Application.get_env(:csv2sql, Csv2sql.SchemaMaker)[:source_csv_directory]
  def init(_) do
    Process.send_after(self(), :kickoff, 0)
    {:ok, nil}
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  def handle_info(:kickoff, worker_count) do
    Path.wildcard("#{@source_csv_directory}/*.csv")
    |> Enum.each(&Csv2sql.WorkerSupervisor.add_worker/1)

    {:noreply, worker_count}
  end
end

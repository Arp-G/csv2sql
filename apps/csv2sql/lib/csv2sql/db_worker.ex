defmodule Csv2sql.DbWorker do
  use GenServer
  alias Csv2sql.{JobQueueServer, Database}

  def start_link(_) do
    GenServer.start_link(__MODULE__, :no_args)
  end

  def init(_) do
    Process.send_after(self(), :start_new_db_work, 0)
    {:ok, nil}
  end

  @doc """
  Recursively requests the job queue for work(chunks of data)
  """
  def handle_info(:start_new_db_work, _) do
    JobQueueServer.get_work()
    |> case do
      {file, data_chunk} ->
        Database.insert_data_chunk(file, data_chunk)

      :no_work ->
        nil
    end

    send(self(), :start_new_db_work)

    {:noreply, nil}
  end
end

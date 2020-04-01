defmodule Csv2sql.DbWorker do
  use GenServer

  alias Csv2sql.FileStreamServer, as: FS

  def start_link(_) do
    GenServer.start_link(__MODULE__, :no_args)
  end

  def init(_) do
    Process.send_after(self(), :start_new_db_work, 0)
    {:ok, nil}
  end

  def handle_info(:start_new_db_work, _) do
    FS.get_work()
    |> case do
      {file, data, is_last_chunk} -> Csv2sql.DB.prepare_insert_query(file, data, is_last_chunk)
      :stream_expired -> IO.puts("DONE !")
      msg -> msg
    end

    send(self(), :start_new_db_work)

    {:noreply, nil}
  end
end

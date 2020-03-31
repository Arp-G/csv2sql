defmodule Csv2sql.Worker do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :no_args)
  end

  def init(_) do
    Process.send_after(self(), :start_new_work, 0)
    {:ok, nil}
  end

  def handle_info(:start_new_work, _) do
    file = Csv2sql.FileServer.next_file()

    if file do
      file
      |> make_schema()
      |> insert_schema()
      |> insert_data()

      send(self(), :start_new_work)

      {:noreply, nil}
    else
      Csv2sql.Server.work_done()
      {:noreply, nil}
      # {:stop, :normal, nil}
    end
  end

  def make_schema(file) do
    queries = Csv2sql.SchemaMaker.make_schema(file)
    {file, queries}
  end

  def insert_schema({file, queries}) do
    Csv2sql.DB.make_db_schema(queries)
    file
  end

  def insert_data(file) do
    Csv2sql.DataTransfer.process_file(file)
    file
  end
end

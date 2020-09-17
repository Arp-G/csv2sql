defmodule Csv2sql.Worker do
  use GenServer

  alias Csv2sql.Observer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :no_args)
  end

  def init(_) do
    Process.send_after(
      self(),
      {:start_new_work, Application.get_env(:csv2sql, Csv2sql.Worker)},
      0
    )

    {:ok, nil}
  end

  def handle_info(
        {:start_new_work,
         work_config = [
           set_make_schema: set_make_schema,
           set_insert_schema: set_insert_schema,
           set_insert_data: set_insert_data,
           gui: gui
         ]},
        _
      ) do
    file = Csv2sql.FileServer.next_file()

    if file do
      if(set_make_schema) do
        if gui, do: Observer.update_file_status(file, :infer_schema)

        result = make_schema(file)

        if(set_insert_schema) do
          if gui, do: Observer.update_file_status(file, :insert_schema)

          insert_schema(result)
        end
      end

      if(set_insert_data) do
        if gui, do: Observer.update_file_status(file, :insert_data)

        insert_data(file)
      end

      send(self(), {:start_new_work, work_config})

      {:noreply, nil}
    else
      Csv2sql.MainServer.work_done()
      {:noreply, nil}
    end
  end

  def make_schema(file) do
    queries = Csv2sql.SchemaMaker.make_schema(file)
    {file, queries}
  end

  def insert_schema({file, queries}) do
    Csv2sql.Database.make_db_schema(queries)
    file
  end

  def insert_data(file) do
    Csv2sql.DataTransfer.process_file(file)
    file
  end
end

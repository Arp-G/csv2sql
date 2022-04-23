defmodule Csv2sql.Worker do
  use GenServer
  alias Csv2sql.{MainServer, Observer}

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
           set_insert_data: set_insert_data
         ]},
        _
      ) do
    {file, row_count} = Observer.next_file()

    if file do
      if set_make_schema do
        Observer.update_file_status(file, :infer_schema)
        result = make_schema(file)

        if set_insert_schema do
          Observer.update_file_status(file, :insert_schema)
          insert_schema(result)
        end
      end

      if set_insert_data && row_count != 0 do
        Observer.update_file_status(file, :insert_data)
        insert_data(file)
      end

      if set_insert_data && row_count == 0, do: handle_empty_file(file)
      send(self(), {:start_new_work, work_config})
      {:noreply, nil}
    else
      MainServer.work_done()
      {:noreply, nil}
    end
  end

  defp make_schema(file) do
    queries = Csv2sql.SchemaMaker.make_schema(file)
    {file, queries}
  end

  defp insert_schema({file, queries}) do
    Csv2sql.Database.make_db_schema(queries)
    file
  end

  defp insert_data(file) do
    Csv2sql.DataTransfer.process_file(file)
    file
  end

  # Handle csvs having 0 rows, change status to finish and move to imported directory
  defp handle_empty_file(file) do
    Observer.update_file_status(file, :finish)

    File.rename!(
      file,
      "#{Application.get_env(:csv2sql, MainServer)[:imported_csv_directory]}/#{Path.basename(file)}"
    )
  end
end

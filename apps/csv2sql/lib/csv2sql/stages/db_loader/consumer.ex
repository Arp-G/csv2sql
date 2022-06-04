defmodule Csv2sql.DbLoader.Consumer do
  def start_link({file, data_chunk}) do
    Task.start_link(fn ->
      Process.put(:file, file.path)
      Csv2sql.Database.insert_data_chunk(file, data_chunk)
    end)
  end
end

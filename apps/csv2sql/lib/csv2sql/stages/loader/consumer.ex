defmodule Csv2sql.Loader.Consumer do
  def start_link({file, data_chunk}) do
    Task.start_link(fn ->
      Csv2sql.Database.insert_data_chunk(file, data_chunk)
    end)
  end
end

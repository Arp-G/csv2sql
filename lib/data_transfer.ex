defmodule Csv2sql.DataTransfer do
  alias NimbleCSV.RFC4180, as: CSV
  require Logger

  def process_file(file) do
    file
    |> File.stream!()
    |> CSV.parse_stream()
    |> Enum.chunk_every(100)
    |> Enum.each(fn rows ->
      Csv2sql.DB.prepare_insert_query(file, rows)
    end)

    File.rm(file)
  end
end

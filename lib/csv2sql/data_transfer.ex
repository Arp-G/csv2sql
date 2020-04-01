defmodule Csv2sql.DataTransfer do
  alias NimbleCSV.RFC4180, as: CSV

  @imported_csv_directory Application.get_env(:csv2sql, Csv2sql.MainServer)[:imported_csv_directory]
  def process_file(file) do

    Csv2sql.Helpers.print_msg("Begin data tranfer for file: " <> Path.basename(file))

    file
    |> File.stream!()
    |> CSV.parse_stream()
    |> Stream.chunk_every(100)
    |> Enum.each(fn rows ->
      Csv2sql.DB.prepare_insert_query(file, rows)
    end)

    File.rename!(file, @imported_csv_directory <> "/" <> Path.basename(file))
    Csv2sql.Helpers.print_msg("Finished processing file: " <> Path.basename(file), :green)
  end
end

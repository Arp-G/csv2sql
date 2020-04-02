defmodule Csv2sql.Database do
  alias NimbleCSV.RFC4180, as: CSV
  alias Csv2sql.Repo

  def make_db_schema([drop_query, create_query]) do
    database_name = Application.get_env(:csv2sql, Csv2sql.Repo)[:database_name]

    table_name =
      String.trim_leading(drop_query, "DROP TABLE IF EXISTS #{database_name}.")
      |> String.trim_trailing(";")

    execute_query(drop_query)
    execute_query(create_query)
    Csv2sql.Helpers.print_msg("Create Schema for: #{table_name}")
  end

  defp execute_query(query) do
    Ecto.Adapters.SQL.query!(Repo, query, [])
  end

  def insert_data_chunk(file, data_chunk) do
    database_name = Application.get_env(:csv2sql, Csv2sql.Repo)[:database_name]

    table_name =
      file
      |> Path.basename()
      |> String.trim_trailing(".csv")

    headers = get_headers(file)

    data_chunk =
      Enum.map(data_chunk, fn row ->
        row
        |> Enum.with_index()
        |> Enum.reduce(%{}, fn {col, index}, map ->
          header = Enum.at(headers, index)

          Map.put(map, header, col)
        end)
      end)

    Repo.insert_all(table_name, data_chunk, prefix: database_name)
  end

  def prepare_db() do
    database_name = Application.get_env(:csv2sql, Csv2sql.Repo)[:database_name]
    Ecto.Adapters.SQL.query!(
      Repo,
      "CREATE DATABASE IF NOT EXISTS #{database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;",
      []
    )

    Ecto.Adapters.SQL.query!(
      Repo,
      "SET GLOBAL SQL_MODE=\"NO_BACKSLASH_ESCAPES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION,NO_ZERO_IN_DATE\";",
      []
    )
  end

  defp get_headers(file) do
    [headers] =
      file
      |> File.stream!()
      |> Stream.take(1)
      |> CSV.parse_stream(skip_headers: false)
      |> Enum.to_list()

    headers
  end
end

defmodule Csv2sql.DB do
  require Logger
  alias NimbleCSV.RFC4180, as: CSV
  alias Csv2sql.Repo

  @database Application.get_env(:csv2sql, Csv2sql.Repo)[:database]
  def make_db_schema([drop_query, create_query]) do
    # tobe be moved
    Ecto.Adapters.SQL.query!(
      Repo,
      "set global sql_mode=\"NO_BACKSLASH_ESCAPES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION,NO_ZERO_IN_DATE\";",
      []
    )

    table_name =
      String.trim_leading(drop_query, "DROP TABLE IF EXISTS #{@database}.")
      |> String.trim_trailing(";")

    execute_query(drop_query)
    execute_query(create_query)
    Logger.debug("Create Schema for: #{table_name}")
  end

  defp execute_query(query) do
    Ecto.Adapters.SQL.query!(Repo, query, [])
  end

  def prepare_insert_query(file, rows) do
    table_name =
      file
      |> Path.basename()
      |> String.trim_trailing(".csv")

    headers = get_headers(file)

    data_chunk =
      Enum.map(rows, fn row ->
        row
        |> Enum.with_index()
        |> Enum.reduce(%{}, fn {col, index}, map ->
          header = Enum.at(headers, index)

          Map.put(map, header, col)
        end)
      end)

    Repo.insert_all(table_name, data_chunk)


    # cols =
    #   headers
    #   |> Enum.reduce("(", fn header, str -> str <> "`" <> header <> "`" <> ", " end)
    #   |> String.trim_trailing(", ")
    #   |> Kernel.<>(")")

    # values =
    #   1..Enum.count(row)
    #   |> Enum.reduce("(", fn _, str -> str <> "?, " end)
    #   |> String.trim_trailing(", ")
    #   |> Kernel.<>(")")

    # # row = row |> Enum.map(&String.trim/1)

    # IO.inspect("INSERT INTO #{@database}.#{table_name} VALUES " <> values <> ";")

    # MyXQL.query!(
    #   :myxql,
    #   "INSERT INTO #{@database}.#{table_name} " <> cols <> " VALUES " <> values <> ";",
    #   row
    # )
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

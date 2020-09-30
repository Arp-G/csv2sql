defmodule Csv2sql.Database do
  alias NimbleCSV.RFC4180, as: CSV
  alias Csv2sql.{Repo, Helpers, Observer, ErrorTracker}

  @doc """
    Creates the table for a csv file
  """
  def make_db_schema([drop_query, create_query]) do
    try do
      execute_query(drop_query)
      execute_query(create_query)
    catch
      _, reason ->
        ErrorTracker.add_error(reason)
    end

    log_table_created(drop_query)
  end

  @doc """
  Inserts a chunk of data in the database
  """
  def insert_data_chunk(file, data_chunk) do
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

    try do
      Repo.insert_all(table_name, data_chunk,
        prefix: Application.get_env(:csv2sql, Csv2sql.Repo)[:database_name]
      )
    catch
      _, reason ->
        ErrorTracker.add_error(reason)
    end

    Observer.update_file_status(file, :insert_data)
  end

  @doc """
  Prepares Database for data insertion by creating the Database if not exists
  """
  def prepare_db() do
    database_name = Application.get_env(:csv2sql, Csv2sql.Repo)[:database_name]

    execute_query(
      "CREATE DATABASE IF NOT EXISTS #{database_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;"
    )

    execute_query(
      "SET GLOBAL SQL_MODE=\"NO_BACKSLASH_ESCAPES,NO_ENGINE_SUBSTITUTION,NO_ZERO_IN_DATE\";"
    )
  end

  defp execute_query(query), do: Ecto.Adapters.SQL.query!(Repo, query, [])

  defp get_headers(file) do
    [headers] =
      file
      |> File.stream!()
      |> Stream.take(1)
      |> CSV.parse_stream(skip_headers: false)
      |> Enum.to_list()

    headers
  end

  # Logs the table that was created
  # Gets the table name from the DROP query
  defp log_table_created(drop_query) do
    table_name =
      drop_query
      |> String.trim_leading(
        "DROP TABLE IF EXISTS #{Application.get_env(:csv2sql, Csv2sql.Repo)[:database_name]}."
      )
      |> String.trim_trailing(";")

    Helpers.print_msg("Create Schema for: #{table_name}")
  end
end

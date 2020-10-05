defmodule Csv2sql.Database do
  alias NimbleCSV.RFC4180, as: CSV
  alias Csv2sql.{Helpers, Observer, ErrorTracker}

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

    data_chunk = file |> Observer.get_schema() |> encode_data_chunk(data_chunk)

    try do
      Csv2sql.get_repo().insert_all(
        table_name,
        data_chunk,
        prefix:
          if(Csv2sql.get_db_type() == :mysql,
            do: Application.get_env(:csv2sql, Csv2sql.get_repo())[:database_name]
          )
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
    if Csv2sql.get_db_type() == :mysql do
      database = Application.get_env(:csv2sql, Csv2sql.get_repo())[:database_name]

      execute_query(
        "CREATE DATABASE IF NOT EXISTS #{database} CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;"
      )

      execute_query(
        "SET GLOBAL SQL_MODE=\"NO_BACKSLASH_ESCAPES,NO_ENGINE_SUBSTITUTION,NO_ZERO_IN_DATE\";"
      )
    end
  end

  defp encode_data_chunk(types, data_chunk) do
    Enum.any?(types, fn {_, type} ->
      case type do
        "TEXT" -> false
        <<"VARCHAR"::binary, _offset::binary>> -> false
        _ -> true
      end
    end)
    |> if do
      # convert list of tuples to map
      types =
        types
        |> Enum.reduce(%{}, fn {key, val}, map ->
          Map.put(map, key, val)
        end)

      Enum.map(data_chunk, fn chunk ->
        Enum.map(chunk, fn {col, val} ->
          val =
            if val == "" do
              nil
            else
              case(types[col]) do
                "INT" ->
                  String.to_integer(val)

                # MYSQL
                "BIT" ->
                  if val == "0" || val == "false", do: 0, else: 1

                # PGSQL
                "BOOLEAN" ->
                  if val == "0" || val == "false", do: false, else: true

                # PGSQL
                <<"NUMERIC"::binary, _offset::binary>> ->
                  {val, ""} = Float.parse(val)
                  val

                _ ->
                  val
              end
            end

          {col, val}
        end)
      end)
    else
      data_chunk
    end
  end

  defp execute_query(query) do
    Csv2sql.get_repo() |> Ecto.Adapters.SQL.query!(query, [])
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

  # Logs the table that was created
  # Gets the table name from the DROP query
  defp log_table_created(drop_query) do
    database =
      if Csv2sql.get_db_type() == :postgres,
        do: "",
        else: "#{Application.get_env(:csv2sql, Csv2sql.get_repo())[:database_name]}."

    table_name =
      drop_query
      |> String.trim_leading("DROP TABLE IF EXISTS #{database}")
      |> String.trim_trailing(";")

    Helpers.print_msg("Create Schema for: #{table_name}")
  end
end

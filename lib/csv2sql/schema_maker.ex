defmodule Csv2sql.SchemaMaker do
  alias NimbleCSV.RFC4180, as: CSV

  def make_schema(file_path) do
    [drop, create] =
      file_path
      |> get_types()
      |> query_maker(file_path)

    query = """

    #{drop}

    #{create}

    """

    schema_file_path = Application.get_env(:csv2sql, Csv2sql.SchemaMaker)[:schema_file_path]

    File.write("#{schema_file_path}/schema.sql", query, [:append])

    Csv2sql.Helpers.print_msg("Infer Schema for: #{Path.basename(file_path)}")

    [drop, create]
  end

  def check_type(item, type) do
    item = String.trim(item)

    empty = is_empty?(item)

    if(empty) do
      Map.put(type, :is_empty, type.is_empty && empty)
    else
      is_date = type.is_date && is_date?(item)
      is_timestamp = type.is_timestamp && is_timestamp?(item)
      is_integer = type.is_integer && is_integer?(item)
      is_float = type.is_float && is_float?(item)
      is_boolean = type.is_boolean && is_boolean?(item)
      is_text = type.is_text || is_text?(item)

      %{
        is_empty: type.is_empty && empty,
        is_date: is_date,
        is_timestamp: is_timestamp,
        is_boolean: is_boolean,
        is_integer: is_integer,
        is_float: is_float,
        is_text: is_text
      }
    end
  end

  defp query_maker(types, file_path) do
    database_name = Application.get_env(:csv2sql, Csv2sql.Repo)[:database_name]

    table_name =
      file_path
      |> Path.basename()
      |> String.trim_trailing(".csv")

    create_table =
      types
      |> Enum.reduce("CREATE TABLE #{database_name}.#{table_name} (", fn {column_name, type},
                                                                         query ->
        query <> "`#{column_name}` #{type}, "
      end)
      |> String.trim_trailing(", ")
      |> Kernel.<>(");")

    ["DROP TABLE IF EXISTS #{database_name}.#{table_name};", "#{create_table}"]
  end

  def get_types(path) do
    headers = get_headers(path)

    varchar_limit = Application.get_env(:csv2sql, Csv2sql.SchemaMaker)[:varchar_limit]

    headers_type_list =
      headers
      |> Enum.map(fn _header -> get_type_map() end)

    path
    |> File.stream!()
    |> CSV.parse_stream()
    |> Stream.chunk_every(
      Application.get_env(:csv2sql, Csv2sql.SchemaMaker)[:schema_infer_chunk_size]
    )
    |> Task.async_stream(__MODULE__, :infer_type, [headers_type_list], timeout: :infinity)
    |> Enum.reduce(List.duplicate(get_type_map(), Enum.count(headers)), fn {:ok, result}, acc ->
      # Here we get a list of type maps for each chunk of data
      # We need to merge theses type maps obtained from each chunk

      for {acc_map, result_map} <- Enum.zip(acc, result) do
        %{
          is_empty: acc_map.is_empty && result_map.is_empty,
          is_date: acc_map.is_date && result_map.is_date,
          is_timestamp: acc_map.is_timestamp && result_map.is_timestamp,
          is_boolean: acc_map.is_boolean && result_map.is_boolean,
          is_integer: acc_map.is_integer && result_map.is_integer,
          is_float: acc_map.is_float && result_map.is_float,
          is_text: acc_map.is_text || result_map.is_text
        }
      end
    end)
    |> Enum.with_index()
    |> Enum.reduce(%{}, fn {type, index}, acc ->
      header = Enum.at(headers, index)

      type =
        cond do
          type[:is_empty] -> "VARCHAR(#{varchar_limit})"
          type[:is_timestamp] -> "TIMESTAMP"
          type[:is_date] -> "DATE"
          type[:is_boolean] -> "BIT"
          type[:is_integer] -> "INT"
          type[:is_float] -> "DOUBLE"
          type[:is_text] -> "TEXT"
          true -> "VARCHAR(#{varchar_limit})"
        end

      Map.put(acc, header, type)
    end)
  end

  def infer_type(chunk, headers_type_list) do
    Enum.reduce(chunk, headers_type_list, fn cols, type_list ->
      for {item, item_type_map} <- Enum.zip(cols, type_list) do
        check_type(item, item_type_map)
      end
    end)
  end

  defp get_headers(path) do
    [headers] =
      path
      |> File.stream!()
      |> Stream.take(1)
      |> CSV.parse_stream(skip_headers: false)
      |> Enum.to_list()

    headers
  end

  defp get_type_map() do
    %{
      is_empty: true,
      is_date: true,
      is_timestamp: true,
      is_boolean: true,
      is_integer: true,
      is_float: true,
      is_text: false
    }
  end

  defp is_empty?(item) do
    item == ""
  end

  defp is_date?(item) do
    Regex.match?(~r/\d\d\d\d-\d\d-\d\d/, item)
  end

  defp is_timestamp?(item) do
    Regex.match?(~r/\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\d/, item)
  end

  defp is_boolean?(item) do
    item
    |> Integer.parse()
    |> case do
      {1, ""} -> true
      {0, ""} -> true
      _ -> false
    end
  end

  defp is_integer?(item) do
    case Integer.parse(item) do
      {item, ""} -> if item > -2_147_483_648 && item < 2_147_483_647, do: true, else: false
      _ -> false
    end
  end

  defp is_float?(item) do
    try do
      case Float.parse(item) do
        {_, ""} ->
          true

        _ ->
          false
      end
    rescue
      _e in ArgumentError -> false
    end
  end

  defp is_text?(item) do
    varchar_limit = Application.get_env(:csv2sql, Csv2sql.SchemaMaker)[:varchar_limit]
    if String.length(item) > varchar_limit, do: true, else: false
  end
end

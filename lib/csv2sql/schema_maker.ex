defmodule Csv2sql.SchemaMaker do
  alias NimbleCSV.RFC4180, as: CSV

  @varchar_limit Application.get_env(:csv2sql, Csv2sql.SchemaMaker)[:varchar_limit]
  @schema_file_path Application.get_env(:csv2sql, Csv2sql.SchemaMaker)[:schema_file_path]
  @database Application.get_env(:csv2sql, Csv2sql.Repo)[:database_name]

  @spec make_schema(
          binary
          | maybe_improper_list(
              binary | maybe_improper_list(any, binary | []) | char,
              binary | []
            )
        ) :: [binary, ...]
  def make_schema(file_path) do
    [drop, create] =
      file_path
      |> get_types()
      |> query_maker(file_path)

    query = """

    #{drop}

    #{create}

    """

    File.write("#{@schema_file_path}/schema.sql", query, [:append])

    Csv2sql.Helpers.print_msg("Infer Schema for: #{Path.basename(file_path)}")

    [drop, create]
  end

  defp query_maker(types, file_path) do
    table_name =
      file_path
      |> Path.basename()
      |> String.trim_trailing(".csv")

    create_table =
      types
      |> Enum.reduce("CREATE TABLE #{@database}.#{table_name} (", fn {column_name, type}, query ->
        query <> "`#{column_name}` #{type}, "
      end)
      |> String.trim_trailing(", ")
      |> Kernel.<>(");")

    ["DROP TABLE IF EXISTS #{@database}.#{table_name};", "#{create_table}"]
  end

  defp get_types(path) do
    headers = get_headers(path)

    headers_type_list =
      headers
      |> Enum.map(fn _header -> get_type_map() end)

    path
    |> File.stream!()
    |> CSV.parse_stream()
    |> Enum.reduce(headers_type_list, fn cols, type_list ->
      cols
      |> Enum.with_index()
      |> Enum.reduce(type_list, fn {item, index}, type_list ->
        item_type_map = Enum.at(type_list, index)

        new_item_type_map = check_type(item, item_type_map)

        List.update_at(type_list, index, fn _ -> new_item_type_map end)
      end)
    end)
    |> Enum.with_index()
    |> Enum.reduce(%{}, fn {type, index}, acc ->
      header = Enum.at(headers, index)

      type =
        cond do
          # empty
          type[:is_empty] -> "VARCHAR(#{@varchar_limit})"
          type[:is_date] -> "DATE"
          type[:is_timestamp] -> "TIMESTAMP"
          type[:is_boolean] -> "BIT"
          type[:is_text] -> "TEXT"
          true -> "VARCHAR(#{@varchar_limit})"
        end

      Map.put(acc, header, type)
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
      is_text: false
    }
  end

  def check_type(item, type) do
    item = String.trim(item)

    empty = is_empty?(item)

    if(empty) do
      Map.put(type, :is_empty, type.is_empty && empty)
    else
      is_date = type.is_date && is_date?(item)
      is_timestamp = type.is_timestamp && is_timestamp?(item)
      is_boolean = type.is_boolean && is_boolean?(item)
      is_text = type.is_text || is_text?(item)

      %{
        is_empty: type.is_empty && empty,
        is_date: is_date,
        is_timestamp: is_timestamp,
        is_boolean: is_boolean,
        is_text: is_text
      }
    end
  end

  defp is_empty?(item) do
    item
    |> String.length() == 0
  end

  defp is_date?(item) do
    String.length(item) == 10 && Regex.match?(~r/\d\d\d\d-\d\d-\d\d/, item)
  end

  defp is_timestamp?(item) do
    Regex.match?(~r/\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\d/, item)
  end

  defp is_boolean?(item) do
    item
    |> Integer.parse()
    |> case do
      {1, ""} -> String.length(item) == 1
      {0, ""} -> String.length(item) == 1
      _ -> false
    end
  end

  defp is_text?(item) do
    if String.length(item) > @varchar_limit, do: true, else: false
  end
end

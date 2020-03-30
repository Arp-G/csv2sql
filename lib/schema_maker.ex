defmodule Csv2sql.SchemaMaker do
  alias NimbleCSV.RFC4180, as: CSV

  def make_schema(file_path) do
    file_path
    |> get_types()
    |> query_maker(file_path)
  end

  def parallel_make_schemas(path) do
    me = self()

    Path.wildcard("#{path}/*.csv")
    |> Enum.map(fn file ->
      fun = fn file -> {file, make_schema(file)} end

      spawn_link(fn -> send(me, {self(), fun.(file)}) end)
    end)
    |> Enum.map(fn pid ->
      receive do
        {^pid, result} -> result
      end
    end)
  end

  defp query_maker(types, file_path) do
    table_name =
      file_path
      |> Path.basename()
      |> String.trim_trailing(".csv")

    types
    |> Enum.reduce("CREATE TABLE #{table_name} (", fn {column_name, type}, query ->
      query <> "#{column_name} #{type}, "
    end)
    |> String.trim_trailing(", ")
    |> Kernel.<>(");")
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
          type[:is_empty] -> :varchar
          type[:is_date] -> :date
          type[:is_timestamp] -> :timestamp
          type[:is_boolean] -> :bit
          type[:is_text] -> :text
          true -> :varchar
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
    limit = Application.get_env(:csv2sql, Csv2sql.SchemaMaker)[:varchar_limit]

    if String.length(item) > limit, do: true, else: false
  end
end

defmodule Csv2sql.TypeDeducer do
  alias NimbleCSV.RFC4180, as: CSV
  use Csv2sql.Types
  import Csv2sql.Helpers.Misc, only: [get_config: 1]
  alias Csv2sql.TypeDeducer.TypeChecker

  @moduledoc """
    Deduces column types of a given csv file
  """
  @spec get_csv_headers(binary) :: list(binary())
  def get_csv_headers(path) when is_binary(path) do
    [headers] =
      path
      |> File.stream!()
      |> Stream.take(1)
      |> CSV.parse_stream(skip_headers: false)
      |> Enum.to_list()

    headers
  end

  @spec get_types(binary) :: map()
  def get_types(csv_file_path) do
    headers = get_csv_headers(csv_file_path)

    # Type maps for every csv column
    initial_column_type_list = get_initial_type_map(headers)

    types =
      csv_file_path
      |> File.stream!()
      |> CSV.parse_stream()
      |> Stream.chunk_every(get_config(:schema_infer_chunk_size))
      |> Task.async_stream(
        fn rows -> infer_type_for_chunk(rows, initial_column_type_list) end,
        timeout: :infinity,
        ordered: false,
        max_concurrency: get_config(:worker_count)
      )
      |> Enum.reduce(initial_column_type_list, fn {:ok, chunk_type_maps}, existing_type_maps ->
        # Here we get a list of type maps for each chunk of data
        # We need to merge theses type maps obtained from each chunk to get the final type map
        for {acc_map, result_map} <- Enum.zip(existing_type_maps, chunk_type_maps) do
          merge_type_maps(acc_map, result_map)
        end
      end)
      |> Enum.with_index()
      |> Enum.reduce(%{}, fn {type, index}, acc ->
        header = Enum.at(headers, index)
        Map.put(acc, header, type)
      end)
      |> header_map_to_list(headers)

    types
  end

  defp infer_type_for_chunk(rows_chunk, headers_type_list) do
    Enum.reduce(rows_chunk, headers_type_list, fn cols, type_list ->
      for {item, item_type_map} <- Enum.zip(cols, type_list) do
        TypeChecker.check_type(item, item_type_map)
      end
    end)
  end

  defp get_initial_type_map(headers) do
    %{
      is_empty: true,
      is_date: true,
      is_datetime: true,
      is_boolean: true,
      is_integer: true,
      is_float: true,
      is_text: false
    }
    |> List.duplicate(Enum.count(headers))
  end

  defp header_map_to_list(header_map, headers) do
    Enum.reduce(headers, [], fn header, acc ->
      acc ++ [{header, header_map[header]}]
    end)
  end

  defp merge_type_maps(existing_type_map, current_type_map) do
    %{
      is_empty: existing_type_map.is_empty && current_type_map.is_empty,
      is_date: existing_type_map.is_date && current_type_map.is_date,
      is_datetime: existing_type_map.is_datetime && current_type_map.is_datetime,
      is_boolean: existing_type_map.is_boolean && current_type_map.is_boolean,
      is_integer: existing_type_map.is_integer && current_type_map.is_integer,
      is_float: existing_type_map.is_float && current_type_map.is_float,
      is_text: existing_type_map.is_text || current_type_map.is_text
    }
  end
end

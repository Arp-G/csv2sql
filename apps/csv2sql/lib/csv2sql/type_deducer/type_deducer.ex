defmodule Csv2sql.TypeDeducer do
  @moduledoc """
    Deduces column types of a given csv file
  """

  alias NimbleCSV.RFC4180, as: CSV
  use Csv2sql.Types
  alias Csv2sql.{TypeDeducer.TypeChecker, Database, Helpers}

  @spec get_types(binary) :: %{String.t() => type_map()}
  def get_types(csv_file_path) do
    headers = Helpers.get_csv_headers(csv_file_path)

    # Initial type maps for every csv column
    initial_column_type_list = get_initial_type_map(headers)

    types =
      csv_file_path
      |> File.stream!(read_ahead: 10_000)
      |> CSV.parse_stream()
      |> Stream.chunk_every(Helpers.get_config(:schema_infer_chunk_size))
      # By default Flow work with batches of 500 items that is 500 chunks in this case
      # Set max demand to 1 to avoid blocking if data not available
      |> Flow.from_enumerable(max_demand: 1)
      # Infer type for chunk: returns array of type maps for that chunk
      |> Flow.map(fn rows -> infer_type_for_chunk(rows, initial_column_type_list) end)
      # Reduce overy array of type maps for every chunk to produce a final array of type maps for the chunk
      # Here we are reducing parallely accross multiple stages or partitions thus leading to a separate reduction result from each stage/partition
      |> Flow.reduce(
        fn -> initial_column_type_list end,
        &merge_type_maps/2
      )
      # Departition to combine results from every reduction stage/partition, to get a single type map list
      |> Flow.departition(
        fn -> initial_column_type_list end,
        &merge_type_maps/2,
        & &1
      )
      |> Enum.to_list()
      |> List.flatten()
      |> Enum.zip(headers)
      |> Enum.into(%{}, fn {column_type_map, column_name} ->
        {column_name, Database.get_db_type(column_type_map)}
      end)

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

  defp merge_type_maps(existing_type_maps, current_type_maps) do
    for {acc_map, current_map} <- Enum.zip(existing_type_maps, current_type_maps) do
      %{
        is_empty: acc_map.is_empty && current_map.is_empty,
        is_date: acc_map.is_date && current_map.is_date,
        is_datetime: acc_map.is_datetime && current_map.is_datetime,
        is_boolean: acc_map.is_boolean && current_map.is_boolean,
        is_integer: acc_map.is_integer && current_map.is_integer,
        is_float: acc_map.is_float && current_map.is_float,
        is_text: acc_map.is_text || current_map.is_text
      }
    end
  end
end

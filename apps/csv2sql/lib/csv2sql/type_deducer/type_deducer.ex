defmodule Csv2sql.TypeDeducer do
  @moduledoc """
    Deduces column types of a given csv file
  """

  alias NimbleCSV.RFC4180, as: CSV
  use Csv2sql.Types
  alias Csv2sql.{TypeDeducer.TypeChecker, Database, Helpers}
  require Logger

  # Read ahead 10,000 lines when reading csv files
  @csv_read_ahead 10_000

  @spec get_count_and_types(binary) :: {non_neg_integer(), csv_col_types_list()}
  def get_count_and_types(csv_file_path) do
    try do
      headers = Helpers.get_csv_headers(csv_file_path)
      # Initial type maps for every csv column
      initial_column_type_list = get_initial_type_map(headers)

      # Don't crash if linked flow process crashes
      Process.flag(:trap_exit, true)

      [{row_count, column_type_map}] =
        csv_file_path
        |> File.stream!([:trim_bom, read_ahead: @csv_read_ahead])
        |> CSV.parse_stream()
        |> Stream.chunk_every(Helpers.get_config(:schema_infer_chunk_size))
        # By default Flow work with batches of 500 items that is 500 chunks in this case
        # Set max demand to 1 to avoid blocking if data not available
        |> Flow.from_enumerable(max_demand: 1, stages: Helpers.get_config(:worker_count))
        # Infer type for chunk: returns array of type maps for that chunk
        |> Flow.map(fn rows ->
          {Enum.count(rows), infer_type_for_chunk(rows, initial_column_type_list)}
        end)
        # Reduce overy array of type maps for every chunk to produce a final array of type maps for the chunk
        # Here we are reducing parallely accross multiple stages or partitions thus leading to a separate reduction result from each stage/partition
        |> Flow.reduce(
          fn -> {0, initial_column_type_list} end,
          fn {count_sum, existing_type_maps}, {count, new_type_maps} ->
            {count_sum + count, merge_type_maps(existing_type_maps, new_type_maps)}
          end
        )
        # Departition to combine results from every reduction stage/partition, to get a single type map list
        |> Flow.departition(
          fn -> {0, initial_column_type_list} end,
          fn {count_sum, existing_type_maps}, {count, new_type_maps} ->
            {count_sum + count, merge_type_maps(existing_type_maps, new_type_maps)}
          end,
          & &1
        )
        |> Enum.to_list()
        |> List.flatten()

      csv_file_name = Path.basename(csv_file_path)
      headers =
        headers
        |> fix_invalid_column_names(csv_file_name)
        |> fix_duplicate_column_names(csv_file_name)

      types =
        column_type_map
        |> Enum.zip(headers)
        |> Enum.into(Keyword.new(), fn {column_type_map, column_name} ->
          {column_name, Database.get_db_type(column_type_map)}
        end)

      {row_count, types}
    catch
      # Catch CSV parsing failures
      _, reason ->
        Csv2sql.ProgressTracker.report_error(reason)
        exit(reason)
    end
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

  defp fix_invalid_column_names(columns, csv_file_name) do
    {updated_column_names, _missing_count} =
      Enum.map_reduce(columns, 1, fn column, missing_count ->
        trimmed_column = String.trim(column)

        cond do
          trimmed_column != column ->
            Logger.warn("Trimmed spaces for column \"#{column}\" in csv #{csv_file_name}")
            {String.trim(trimmed_column), missing_count}

          trimmed_column == "" ->
            Logger.warn(
              "Renamed empty column as \"missing_column_#{missing_count}\" in csv #{csv_file_name}"
            )

            {"missing_column_#{missing_count}", missing_count + 1}

          true ->
            {column, missing_count}
        end
      end)

    updated_column_names
  end

  defp fix_duplicate_column_names(columns, csv_file_name) do
    {updated_column_names, _acc} =
      Enum.map_reduce(columns, %{}, fn column, count_map ->
        {_cur_value, count_map} =
          Map.get_and_update(count_map, column, fn
            nil -> {nil, 0}
            count -> {nil, count + 1}
          end)

        updated_column_name =
          count_map
          |> Map.get(column, 0)
          |> get_duplicate_column_name(column, csv_file_name)

        {updated_column_name, count_map}
      end)

    updated_column_names
  end

  defp get_duplicate_column_name(count, column, _csv_file_name) when count == 0, do: column

  defp get_duplicate_column_name(count, column, csv_file_name) do
    Logger.warn(
      "Renamed duplicate column \"#{column}\" to \"#{column}_#{count}\" in csv #{csv_file_name}"
    )

    "#{column}_#{count}"
  end
end

defmodule Csv2sql.Stages.Analyze do
  alias Csv2sql.{TypeDeducer, File, Helpers}

  def run do
    source_directory = Helpers.get_config(:source_directory)
  end

  def get_files do
    Helpers.get_config(:source_directory)
    |> File.ls!()
    |> Flow.from_enumerable()
    |> Flow.reject(fn file ->
      extension =
        file
        |> String.trim()
        |> String.slice(-4..-1)
        |> String.downcase()

      extension != ".csv"
    end)
    |> Flow.reduce(fn -> %{} end, &get_file_stats/2)
    |> Flow.departition(
        fn -> initial_column_type_list end,
        &merge_type_maps/2,
        & &1
      )
  end

  @doc """
  Get row count in csv file
  """
  def get_count_from_csv(file) do
    file
    |> File.stream!()
    |> CSV.parse_stream()
    |> Enum.count()
  end

  def get_file_stats(file, files_map) do
    path = "#{Helpers.get_config(:source_directory)}/#{file}"

    file_struct=%Csv2sql.File{
      name: String.slice(file, 0..-5),
      path: path,
      size: size,
      row_count: get_count_from_csv(path),
      status: :pending
    }

    Map.put(files_map, path, file_struct)
  end
end

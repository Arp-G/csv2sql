defmodule Csv2sql.Stages.Analyze do
  use Csv2sql.Types
  alias Csv2sql.{TypeDeducer, Helpers}
  import ShorterMaps

  @spec get_files :: files_map()
  def get_files do
    source_direcotry = Helpers.get_config(:source_directory)

    files_list =
      source_direcotry
      |> File.ls!()
      |> Enum.filter(&is_csv?/1)
      |> Enum.map(fn file ->
        path = "#{source_direcotry}#{file}"

        %Csv2sql.File{
          name: String.slice(file, 0..-5),
          path: path,
          status: :pending
        }
      end)

    # TODO: Init observer with files list

    [files_map] =
      files_list
      |> Flow.from_enumerable()
      |> Flow.map(fn file ->
        file = %Csv2sql.File{file | status: :analyze}
        # TODO: Update Obersver with file status :pending -> :analyze
        get_file_stats(file)
      end)
      |> Flow.reduce(fn -> %{} end, fn file, files_map -> Map.put(files_map, file.path, file) end)
      |> Flow.departition(fn -> %{} end, &Map.merge/2, & &1)
      |> Enum.to_list()

    # TODO: Send files to genstage for insertion

    files_map
  end

  defp get_file_stats(~M{%Csv2sql.File path} = file) do
    ~M{size} = File.stat!(path)
    {row_count, column_types} = TypeDeducer.get_count_and_types(path)

    ~M{%Csv2sql.File file | size, row_count, column_types}
  end

  defp is_csv?(filepath) do
    filepath
    |> String.trim()
    |> String.slice(-4..-1)
    |> String.downcase() == ".csv"
  end
end

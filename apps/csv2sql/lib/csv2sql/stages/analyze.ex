defmodule Csv2sql.Stages.Analyze do
  use Csv2sql.Types
  alias Csv2sql.{TypeDeducer, Database, Helpers}
  import ShorterMaps

  @spec analyze_files :: :ok
  def analyze_files do
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

    Database.start_repo()
    Csv2sql.Loader.ConsumerSupervisor.start_link()

    files_list
    |> Flow.from_enumerable()
    |> Flow.map(fn file ->
      file = %Csv2sql.File{file | status: :analyze}
      # TODO: Update Obersver with file status :pending -> :analyze
      file = get_file_stats(file)

      file.path
      |> Database.get_create_table_ddl(Database.get_db_name(), file.column_types)
      |> Database.run_query!()

      # file = %Csv2sql.File{file | status: :loading}
      # TODO: Update Obersver with file status :analyze -> :loading

      # Start a producer for the file
      {:ok, pid} = Csv2sql.Loader.Producer.start_link(file)

      GenStage.sync_subscribe(Csv2sql.Loader.ConsumerSupervisor,
        cancel: :temporary,
        max_demand: System.schedulers_online(),
        to: pid
        # selector: fn %{key: key} -> String.starts_with?(key, "foo-") end TODO: Might be usefull for order later
      )
    end)
    |> Flow.run()
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

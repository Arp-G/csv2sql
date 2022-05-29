defmodule Csv2sql.Stages.Analyze do
  use Csv2sql.Types
  alias Csv2sql.{TypeDeducer, Database, DbLoader, ProgressTracker, Helpers}
  import ShorterMaps

  @spec analyze_files :: :ok
  def analyze_files do
    IO.inspect "#{DateTime.utc_now} analyzing files"
    # Prepare file structs for all csvs in the source directory
    files_list = get_csv_files()

    # Init progress tracker with files list
    ProgressTracker.init_files(files_list)

    # Start Repository
    Database.start_repo()

    # Start Consumer Supervisor
    DbLoader.ConsumerSupervisor.start_link()

    files_list
    |> Flow.from_enumerable(
      max_demand: 1,
      # Number of files processed at once
      stages: Helpers.get_config(:worker_count)
    )
    |> Flow.map(&process_file/1)
    |> Flow.run()
  end

  defp get_csv_files do
    source_directory = Helpers.get_config(:source_directory)

    source_directory
    |> File.ls!()
    |> Enum.filter(&is_csv?/1)
    |> Enum.map(fn file ->
      path = "#{source_directory}#{file}"

      %Csv2sql.File{
        name: String.slice(file, 0..-5),
        path: path,
        status: :pending
      }
    end)
  end

  defp process_file(%Csv2sql.File{} = file) do
    file = %Csv2sql.File{file | status: :analyze}

    # Inform progress tracker, file is being processed
    ProgressTracker.update_file(file)

    # Obtain file schema, row_count and other file stats
    file = get_file_stats(file)

    # Update progress tracker with file data
    ProgressTracker.update_file(file)

    file.path
    |> Database.get_create_table_ddl(Database.get_db_name(), file.column_types)
    |> Database.run_query!()

    # Start a producer for the file
    {:ok, pid} = DbLoader.Producer.start_link(file)

    # Subscribe consumers to the producer
    GenStage.sync_subscribe(
      DbLoader.ConsumerSupervisor,
      cancel: :temporary,
      min_demand: 0,
      # Number of consumers loading data in database
      max_demand: Helpers.get_config(:db_worker_count),
      to: pid
    )
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

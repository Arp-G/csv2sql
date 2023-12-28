defmodule Csv2sql.Stages.Analyze do
  use Csv2sql.Types
  alias Csv2sql.{TypeDeducer, Database, DbLoader, ProgressTracker, Helpers}
  import ShorterMaps

  @spec analyze_files :: :ok
  def analyze_files do
    try do
      IO.inspect("#{DateTime.utc_now()} analyzing files")
      # Prepare file structs for all csvs in the source directory
      files_list = get_csv_files()

      # Init progress tracker with files list
      ProgressTracker.init_files(files_list)

      # Start Repository
      if Helpers.db_access_required(), do: Database.start_repo()

      # Start Consumer Supervisor
      if Helpers.get_config(:insert_data), do: DbLoader.ConsumerSupervisor.start_link()

      # Remove existing schema file if present
      get_schema_path() |> File.rm()

      files_list
      |> Flow.from_enumerable(
        max_demand: 1,
        # Number of files processed at once
        stages: Helpers.get_config(:worker_count)
      )
      |> Flow.map(&process_file/1)
      |> Flow.run()
    catch
      _, reason ->
        Csv2sql.ProgressTracker.report_error(reason)
        throw(reason)
    end
  end

  defp get_csv_files do
    source_directory = Helpers.get_config(:source_directory)

    source_directory
    |> File.ls!()
    |> Enum.filter(&is_csv?/1)
    |> Enum.map(fn file ->
      path = "#{source_directory}#{file}"

      %Csv2sql.File{
        name: String.slice(file, 0..-5//1),
        path: path,
        status: :pending
      }
    end)
  end

  defp process_file(%Csv2sql.File{} = file) do
    try do
      file = %Csv2sql.File{file | status: :analyze}

      # Inform progress tracker, file is being processed
      ProgressTracker.update_file(file)

      # Obtain file schema, row_count and other file stats
      file = get_file_stats(file)

      # Update progress tracker with file data
      ProgressTracker.update_file(file)

      if Helpers.get_config(:insert_schema) do
        drop_query =
          if Helpers.get_config(:drop_existing_tables) do
            ddl_query = Database.get_drop_table_ddl(file.path, Database.get_db_name())

            Database.run_query!(ddl_query)

            ddl_query
          end

        ddl_query =
          Database.get_create_table_ddl(file.path, Database.get_db_name(), file.column_types)

        Database.run_query!(ddl_query)

        query =
          ["\n", drop_query, ddl_query]
          |> Enum.reject(&is_nil/1)
          |> Enum.join("\n")

        File.write(get_schema_path(), query, [:append])

        if Helpers.get_config(:insert_data) do
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
      end
    catch
      _, reason ->
        Csv2sql.ProgressTracker.report_error(reason)
        throw(reason)
    end
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

  defp get_schema_path(), do: "#{Helpers.get_config(:source_directory)}/schema.sql"
end

defmodule Csv2sql.DataTransfer do
  alias NimbleCSV.RFC4180, as: CSV

  def process_file(file) do
    Csv2sql.Helpers.print_msg("Begin data tranfer for file: " <> Path.basename(file))

    insertion_chunk_size = Application.get_env(:csv2sql, Csv2sql.Repo)[:insertion_chunk_size]

    file
    |> File.stream!()
    |> CSV.parse_stream()
    |> Stream.chunk_every(insertion_chunk_size)
    |> Enum.each(fn data_chunk ->
      check_job_queue(file, data_chunk)
    end)

    wait_for_file_transfer(file)
  end

  defp wait_for_file_transfer(file) do
    if Csv2sql.JobQueueServer.job_for_file_present(file) do
      wait_for_file_transfer(file)
    else
      imported_csv_directory =
        Application.get_env(:csv2sql, Csv2sql.MainServer)[:imported_csv_directory]

      # wait for the last chunk in queue to get inserted
      :timer.sleep(300)
      File.rename!(file, "#{imported_csv_directory}/#{Path.basename(file)}")
      Csv2sql.Helpers.print_msg("Finished processing file: " <> Path.basename(file), :green)
    end
  end

  defp check_job_queue(file, data_chunk) do
    job_count_limit = Application.get_env(:csv2sql, Csv2sql.Repo)[:job_count_limit]
    job_count = Csv2sql.JobQueueServer.get_job_count()

    if job_count > job_count_limit do
      check_job_queue(file, data_chunk)
    else
      Csv2sql.JobQueueServer.add_data_chunk(file, data_chunk)
    end
  end
end

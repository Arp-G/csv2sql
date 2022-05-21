# defmodule Csv2sql.DataTransfer do
#   alias NimbleCSV.RFC4180, as: CSV
#   alias Csv2sql.{JobQueueServer, Helpers}

#   @doc """
#   Divides a csv file in chunks and place them in a job queue.
#   Whenever a DB worker is free it will pick up a chunk from the queue
#   and insert it in the database.
#   """
#   def process_file(file) do
#     Helpers.print_msg("Begin data tranfer for file: " <> Path.basename(file))

#     insertion_chunk_size =
#       Application.get_env(:csv2sql, Csv2sql.get_repo())[:insertion_chunk_size]

#     file
#     |> File.stream!()
#     |> CSV.parse_stream()
#     |> Stream.chunk_every(insertion_chunk_size)
#     |> Enum.each(fn data_chunk ->
#       check_job_queue(file, data_chunk)
#     end)

#     wait_for_file_transfer(file)
#   end

#   # Wait until all chunks for the current file in the job queue has been processed
#   # `:timer.sleep(300)` waits for the last chunk in queue to get inserted that is
#   # if no, chunks were present on the job queue this means a DB worker has picked
#   # up the chunk for insertion, so we wait for 300ms for the chunk to get inserted.
#   defp wait_for_file_transfer(file) do
#     if Csv2sql.JobQueueServer.job_for_file_present(file) do
#       wait_for_file_transfer(file)
#     else
#       imported_csv_directory =
#         Application.get_env(:csv2sql, Csv2sql.MainServer)[:imported_csv_directory]

#       :timer.sleep(300)
#       File.rename(file, "#{imported_csv_directory}/#{Path.basename(file)}")
#       Helpers.print_msg("Finished processing file: " <> Path.basename(file), :green)
#     end
#   end

#   # Wait until job queue has space for the next chunk
#   # by recursively calling itself.
#   defp check_job_queue(file, data_chunk) do
#     job_count_limit = Application.get_env(:csv2sql, Csv2sql.get_repo())[:job_count_limit]
#     job_count = JobQueueServer.get_job_count()

#     if job_count > job_count_limit do
#       check_job_queue(file, data_chunk)
#     else
#       JobQueueServer.add_data_chunk(file, data_chunk)
#     end
#   end
# end

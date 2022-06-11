defmodule Csv2sql.DbLoader.Consumer do
  def start_link({file, data_chunk}) do
    Task.start_link(fn ->
      try do
        Process.put(:file, file.path)
        Csv2sql.Database.insert_data_chunk(file, data_chunk)
      rescue
        exception ->
          Csv2sql.ProgressTracker.report_error(exception)
          reraise exception, __STACKTRACE__
          # catch
          #   _, reason ->
          #     Csv2sql.ProgressTracker.report_error(reason)
      end
    end)
  end
end

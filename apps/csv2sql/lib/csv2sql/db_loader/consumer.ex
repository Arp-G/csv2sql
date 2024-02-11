defmodule Csv2sql.DbLoader.Consumer do
  def start_link({file, data_chunk}) do
    IO.inspect "#{DateTime.utc_now()} Start consumer for #{inspect(file.path)}"
    Task.start_link(fn ->
      try do
        Process.put(:file, file.path)
        Csv2sql.Database.insert_data_chunk(file, data_chunk)
      catch
        _, reason ->
          Csv2sql.ProgressTracker.report_error(reason)
          throw(reason)
      end
    end)
  end
end

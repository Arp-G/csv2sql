defmodule Csv2sql.FileServer do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :no_args, name: __MODULE__)
  end

  def next_file() do
    GenServer.call(__MODULE__, :next_file)
  end

  def init(_) do
    source_csv_directory =
      Application.get_env(:csv2sql, Csv2sql.MainServer)[:source_csv_directory]

    DirWalker.start_link(source_csv_directory)
  end

  def handle_call(:next_file, _from, dir_walker_pid) do
    path = get_next_file(dir_walker_pid)

    {:reply, path, dir_walker_pid}
  end

  defp get_next_file(dir_walker_pid) do
    case DirWalker.next(dir_walker_pid) do
      [path] ->
        extension = path |> String.slice(-4..-1) |> String.downcase()

        if extension == ".csv", do: path, else: get_next_file(dir_walker_pid)

      # Retuns nil when ther are no fore files to return
      other ->
        other
    end
  end
end

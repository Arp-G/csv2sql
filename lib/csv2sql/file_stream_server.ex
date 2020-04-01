defmodule Csv2sql.FileStreamServer do
  use GenServer
  alias NimbleCSV.RFC4180, as: CSV

  @insertion_chunk_size Application.get_env(:csv2sql, Csv2sql.Repo)[:insertion_chunk_size]

  def start_link(_) do
    GenServer.start_link(__MODULE__, :no_args, name: __MODULE__)
  end

  def init(_) do
    {:ok, %{}}
  end

  def add_file_stream(file) do
    stream =
      file
      |> File.stream!()
      |> CSV.parse_stream()

    GenServer.cast(__MODULE__, {:add_new_file_stream, file, stream})
  end

  def get_work() do
    GenServer.call(__MODULE__, :get_work)
  end

  def handle_cast({:add_new_file_stream, file, stream}, file_stream_map) do
    new_state = Map.put(file_stream_map, file, stream)
    {:noreply, new_state}
  end

  def handle_call(:get_work, _from, file_stream_map) do
    file_stream_map
    |> Enum.take(1)
    |> case do
      [{file, stream}] ->
        StreamSplit.take_and_drop(stream, @insertion_chunk_size)
        |> case do
          {[], []} ->
            {:reply, :stream_expired, Map.delete(file_stream_map, file)}

          {data, new_stream} ->
            is_last_chunk = new_stream |> StreamSplit.take_and_drop(1) == {[], []}

            new_file_stream_map = Map.put(file_stream_map, file, new_stream)

            {:reply, {file, data, is_last_chunk}, new_file_stream_map}
        end

      [] ->
        {:reply, :no_work, file_stream_map}
    end
  end
end

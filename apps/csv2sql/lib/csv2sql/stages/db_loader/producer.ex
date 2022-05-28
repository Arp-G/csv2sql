defmodule Csv2sql.DbLoader.Producer do
  @moduledoc """
    TODO: Write a nice doc explaining this module
  """

  use GenStage
  import ShorterMaps
  alias NimbleCSV.RFC4180, as: CSV
  alias Csv2sql.Helpers

  # Read ahead 10,000 lines when reading csv files
  @csv_read_ahead 10_000
  @preload_count 5

  def start_link(file) do
    IO.inspect("Start producer for #{inspect(file.path)}")

    GenStage.start_link(
      __MODULE__,
      ~M{file, preloaded_data: []},
      name: {:via, Registry, {Csv2sql.Loader.ProducerRegistry, file.path}}
    )
  end

  def init(~M{file} = state) do
    csv_stream =
      file.path
      |> File.stream!(read_ahead: @csv_read_ahead)
      |> CSV.parse_stream()
      |> with_index()
      |> Stream.chunk_every(Helpers.get_config(:insertion_chunk_size))

    {:producer, Map.put(state, :csv_stream, csv_stream)}
  end

  def handle_demand(demand, ~M{file, csv_stream, preloaded_data} = state) do
    {to_dispatch, new_state} =
      if length(preloaded_data) >= demand do
        {to_dispatch, remaining} = Enum.split(preloaded_data, demand)
        {to_dispatch, %{state | preloaded_data: remaining}}
      else
        {csv_chunks, remainder_stream} = StreamSplit.take_and_drop(csv_stream, demand)
        {csv_chunks, %{state | csv_stream: remainder_stream}}
      end

    Process.send(self(), :preload_more, [])

    # TODO: try to get rid of this
    to_dispatch = Enum.map(to_dispatch, fn chunk -> {file, chunk} end)
    {:noreply, to_dispatch, new_state}
  end

  def handle_info(:preload_more, ~M{csv_stream, preloaded_data} = state) do
    {new_preloads, csv_stream} =
      if length(preloaded_data) < @preload_count do
        deficit = @preload_count - length(preloaded_data)
        StreamSplit.take_and_drop(csv_stream, deficit)
      else
        {[], csv_stream}
      end

    preloaded_data = preloaded_data ++ new_preloads

    {:noreply, [], ~M{state | csv_stream, preloaded_data}}
  end

  defp with_index(stream),
    do: if(Helpers.get_config(:validate_import), do: stream |> Stream.with_index(1), else: stream)
end

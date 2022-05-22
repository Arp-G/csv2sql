defmodule Csv2sql.Loader.Producer do
  @moduledoc """
    TODO: Write a nice doc explaining this module
  """

  use GenStage
  import ShorterMaps
  alias NimbleCSV.RFC4180, as: CSV

  # Read ahead 10,000 lines when reading csv files
  @csv_read_ahead 10_000
  @preload_count 5

  def start_link(filePath) do
    GenStage.start_link(__MODULE__, ~m{file_path, preloaded_data: []}, name: __MODULE__)
  end

  def init(~m{file_path} = state) do
    csv_stream =
      file_path
      |> File.stream!(read_ahead: @csv_read_ahead)
      |> CSV.parse_stream()
      |> Stream.chunk_every(Helpers.get_config(:insertion_chunk_size))

    {:producer, Map.put(state, :csv_stream, csv_stream)}
  end

  #   handle_demand(demand :: pos_integer(), state :: term()) ::
  #   {:noreply, [event], new_state}
  #   | {:noreply, [event], new_state, :hibernate}
  #   | {:stop, reason, new_state}
  # when new_state: term(), reason: term(), event: term()

  # This is invoked when a consumer requires new events but the producer does not have any in its buffer
  # so demand for new events need to be handled, here fetch new events and return them.
  # def handle_demand(1, ~m{csv_stream} = state) do
  #   {csv_chunks, remainder_stream} = SplitStream.take_and_drop(csv_stream, 1)

  #   {:noreply, [csv_chunks], Map.put(state, :csvStream, remainder_stream)}
  # end

  def handle_demand(demand, ~m{csv_stream, preloaded_data} = state) do
    {to_dispatch, state} =
      if length(preloaded_data) >= demand do
        {to_dispatch, remaining} = Enum.split(preloaded_data, demand)
        {to_dispatch, %{state | preloaded_data: remaining}}
      else
        {csv_chunks, remainder_stream} = SplitStream.take_and_drop(csv_stream, demand)
        {csv_chunks, Map.put(state, :csvStream, remainder_stream)}
      end

    Process.send(self(), :preload_more)

    {:noreply, to_dispatch, state}
  end

  def handle_info(:preload_more, ~m{csv_stream, preloaded_data} = state) do
    {new_preloads, csv_stream} =
      if length(preloaded_data) < @preload_count do
        deficit = @preload_count - length(preloaded_data)
        {csv_chunks, remainder_stream} = SplitStream.take_and_drop(csv_stream, deficit)
      else
        {[], csv_stream}
      end

    preloaded_data = preloaded_data ++ new_preloads

    {:noreply, [], Map.merge(state, ~m{csv_stream, preloaded_data})}
  end
end

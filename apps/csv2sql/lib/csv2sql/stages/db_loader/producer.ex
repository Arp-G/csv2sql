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

  def start_link(file) do
    IO.inspect("#{DateTime.utc_now()} Start producer for #{inspect(file.path)}")

    GenStage.start_link(
      __MODULE__,
      ~M{file},
      name: {:via, Registry, {Csv2sql.Loader.ProducerRegistry, file.path}}
    )
  end

  def init(~M{file} = state) do
    csv_stream =
      file.path
      |> File.stream!([:trim_bom, read_ahead: @csv_read_ahead])
      |> CSV.parse_stream()
      |> with_index()
      |> Stream.chunk_every(Helpers.get_config(:insertion_chunk_size))

    {:producer, Map.put(state, :csv_stream, csv_stream)}
  end

  def handle_demand(demand, ~M{file, csv_stream} = state) do
    {csv_chunks, remainder_stream} = StreamSplit.take_and_drop(csv_stream, demand)
    new_state = %{state | csv_stream: remainder_stream}

    if csv_chunks == [] do
      IO.inspect("#{DateTime.utc_now()} FINISH producer for #{inspect(file.path)}")
      {:stop, :normal, new_state}
    else
      to_dispatch = Enum.map(csv_chunks, fn chunk -> {file, chunk} end)
      {:noreply, to_dispatch, new_state}
    end
  end

  defp with_index(stream),
    do: if(Helpers.get_config(:ordered), do: stream |> Stream.with_index(1), else: stream)
end

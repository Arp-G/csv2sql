defmodule Csv2sql.StatsKeeper do
  use GenServer

  @status_list [:pending, :infer_schema, :insert_schema, :insert_data, :finish]

  def get_stats do
    GenServer.call(__MODULE__, :get_stats)
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, :no_args, name: __MODULE__)
  end

  def update_file_status(file, new_status) do
    GenServer.cast(__MODULE__, {:update_status, file, new_status})
  end

  def init(_) do
    {:ok, get_file_list()}
  end

  def handle_call(:get_stats, _from, stats) do
    IO.inspect(stats)
    {:reply, stats, stats}
  end

  def handle_cast(
        {:update_status, file, status},
        state
      )
      when status in @status_list do
    # IO.inspect("Updating state of file #{file} from #{state[file]} to #{status}")
    # Task.start(fn -> Csv2sql.StatsKeeper.get_stats() end)
    {:noreply, Map.put(state, file, status)}
  end

  defp get_file_list() do
    source_dir = Application.get_env(:csv2sql, Csv2sql.MainServer)[:source_csv_directory]

    source_dir
    |> File.ls!()
    |> Enum.reject(fn file ->
      extension =
        file
        |> String.slice(-4..-1)
        |> String.downcase()

      extension != ".csv"
    end)
    |> Enum.reduce(%{}, fn file, acc ->
      acc |> Map.put("#{source_dir}/#{file}", :pending)
    end)
  end
end

defmodule Csv2sql.ProgressTracker do
  use GenServer
  use Csv2sql.Types
  alias Csv2sql.ProgressTracker.State
  require Logger

  import ShorterMaps

  # Sets the files list
  @spec init_files(list(Csv2sql.File.t())) :: files_map()
  def init_files(files), do: GenServer.call(__MODULE__, {:init_files, files})

  # Get observer state
  @spec get_state() :: State.t() | nil
  def get_state() do
    if Process.whereis(__MODULE__),
      # Timeout is infinity here makes the caller wait until the genserver responds
      do: GenServer.call(__MODULE__, :get_state, :infinity),
      else: nil
  end

  # Update file
  @spec update_file(Csv2sql.File.t()) :: :ok
  def update_file(file),
    do: GenServer.cast(__MODULE__, {:update_file, file})

  @spec update_row_count(String.t(), non_neg_integer()) :: :ok
  def update_row_count(path, rows_inserted),
    do: GenServer.cast(__MODULE__, {:update_row_count, path, rows_inserted})

  # Start Observer
  @spec start_link(any()) :: {:ok, pid()}
  def start_link(_), do: GenServer.start_link(__MODULE__, nil, name: __MODULE__)

  # === Callbacks ===

  @spec init(any) :: {:ok, State.t()}
  def init(_),
    do: {:ok, %State{start_time: DateTime.utc_now()}}

  def handle_call(:get_state, _from, state), do: {:reply, state, state}

  def handle_call({:init_files, files}, _from, %State{} = state) do
    files = Enum.into(files, %{}, fn ~M{%Csv2sql.File path} = file -> {path, file} end)
    {:reply, files, ~M{%State state | files}}
  end

  def handle_cast({:update_file, ~M{%Csv2sql.File path} = file}, ~M{%State files} = state) do
    {_old_file, files} = Map.get_and_update!(files, path, fn old_file -> {old_file, file} end)

    {:noreply, ~M{%State state | files}}
  end

  def handle_cast({:update_row_count, path, rows_inserted}, ~M{%State files} = state) do
    {_current_value, files} =
      Map.get_and_update!(files, path, fn ~M{%Csv2sql.File row_count, rows_processed} = file ->
        rows_processed = rows_processed + rows_inserted
        status = if rows_processed == row_count, do: :done, else: :loading

        {file, ~M{%Csv2sql.File file | rows_processed, status}}
      end)

    end_time = Enum.all?(files, fn {_path, ~M{%Csv2sql.File status}} -> status == :done end)
    {:noreply, ~M{%State state | files, end_time}}
  end
end

defmodule Csv2sql.ProgressTracker do
  @moduledoc """
    This module is responsible for tracking the progress of the operations on different csv files.
    The various processes working on the csv files can update the progress tracker with the status of the file.
    The progress tracker then notifies its subscribers about the progress through Phoenix.PubSub.
  """

  use GenServer
  use Csv2sql.Types
  alias Csv2sql.ProgressTracker.State

  # Sets the files list
  @spec init_files(list(Csv2sql.File.t())) :: files_map()
  def init_files(files), do: GenServer.call(__MODULE__, {:init_files, files})

  @spec subscribe :: :ok | {:error, term()}
  def subscribe do
    Phoenix.PubSub.subscribe(Csv2sql.PubSub, "progress")
  end

  # Get current progress state
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

  @spec report_error(any()) :: :ok
  def report_error(error),
    do: GenServer.call(__MODULE__, {:report_error, error})

  # Start Observer
  @spec start_link(any()) :: {:ok, pid()}
  def start_link(_), do: GenServer.start_link(__MODULE__, nil, name: __MODULE__)

  # === Callbacks ===

  @impl true
  def init(_) do
    {:ok, %State{start_time: DateTime.utc_now()}}
  end

  @impl true
  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call({:init_files, files}, _from, %State{} = state) do
    updated_state =
      if files == [] do
        %State{state | status: :finish, end_time: DateTime.utc_now()}
      else
        files = Enum.into(files, %{}, &{&1.path, &1})
        %State{state | files: files, status: :working}
      end

    notify_subscribers(updated_state)

    {:reply, files, updated_state}
  end

  @impl true
  def handle_call({:report_error, _error}, _from, %State{status: :error} = state) do
    {:reply, :already_errored, state}
  end

  @impl true
  def handle_call({:report_error, error}, _from, state) do
    updated_state = %State{state | status: {:error, error}}
    notify_subscribers(updated_state)
    {:reply, :ok, updated_state}
  end

  @impl true
  def handle_cast({:update_file, _file}, %State{status: :error} = state) do
    {:noreply, state}
  end

  @impl true
  def handle_cast({:update_file, file}, state) do
    {_old_file, files} = Map.get_and_update!(state.files, file.path, &{&1, file})
    updated_state = %State{state | files: files}
    notify_subscribers(updated_state)
    {:noreply, updated_state}
  end

  @impl true
  def handle_cast({:update_row_count, _path, _rows_inserted}, %State{status: :error} = state) do
    {:noreply, state}
  end

  @impl true
  def handle_cast({:update_row_count, path, rows_inserted}, state) do
    {_current_value, files} =
      Map.get_and_update!(state.files, path, fn file ->
        rows_processed = file.rows_processed + rows_inserted
        status = if rows_processed == file.row_count, do: :done, else: :loading

        {file, %Csv2sql.File{file | rows_processed: rows_processed, status: status}}
      end)

    finish? = Enum.all?(files, fn {_path, %Csv2sql.File{status: status}} -> status == :done end)
    end_time = DateTime.utc_now()

    state =
      if finish?,
        do: %State{state | status: :finish, files: files, end_time: end_time},
        else: %State{state | files: files}

    notify_subscribers(state)

    {:noreply, state}
  end

  defp notify_subscribers(state) do
    Phoenix.PubSub.local_broadcast(
      Csv2sql.PubSub,
      "progress",
      {:progress_tracker_update, state}
    )
  end
end

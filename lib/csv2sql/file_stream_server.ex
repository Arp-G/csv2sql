defmodule Csv2sql.JobQueueServer do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :no_args, name: __MODULE__)
  end

  def init(_) do
    {:ok, []}
  end

  def add_data_chunk(file, data_chunk) do
    GenServer.cast(__MODULE__, {:add_new_data_chunk, file, data_chunk})
  end

  def get_work() do
    GenServer.call(__MODULE__, :get_work)
  end

  def get_job_count() do
    GenServer.call(__MODULE__, :get_job_count)
  end

  def job_for_file_present(file) do
    GenServer.call(__MODULE__, {:job_for_file_present, file})
  end

  def handle_cast({:add_new_data_chunk, file, data_chunk}, state) do
    new_state = state ++ [{file, data_chunk}]
    {:noreply, new_state}
  end

  def handle_call(:get_work, _from, state) do
    state
    |> case do
      [data | new_state] ->
        {:reply, data, new_state}

      [] ->
        {:reply, :no_work, state}

      nil ->
        {:reply, :no_work, state}
    end
  end

  def handle_call(:get_job_count, _from, state) do
    {:reply, Enum.count(state), state}
  end

  def handle_call({:job_for_file_present, file}, _from, state) do
    file_present? =
      Enum.any?(state, fn {file_job, _data_chunk} ->
        file == file_job
      end)

    {:reply, file_present?, state}
  end
end

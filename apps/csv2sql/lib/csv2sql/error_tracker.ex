defmodule Csv2sql.ErrorTracker do
  use GenServer

  def register_supervisor(sup_pid) do
    GenServer.cast(:error_tracker, {:register_supervisor, sup_pid})
  end

  def add_error(error) do
    """
    AN ERROR OCCURED AND FURTHER PROCESSING WAS STOPPED:

    #{inspect(error)}
    """
    |> Csv2sql.Helpers.print_msg(:red)

    Csv2sql.Observer.change_stage(:error)

    # Call genserver not cast since, we need the wait synchronously untill supervisor is stopped
    GenServer.call(:error_tracker, {:add_error, error})
  end

  def get_errors() do
    GenServer.call(:error_tracker, :get_errors)
  end

  def reset_errors() do
    GenServer.cast(:error_tracker, :reset_state)
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, :no_args, name: :error_tracker)
  end

  def init(_) do
    {:ok, %{errors: [], sup_pid: nil}}
  end

  def handle_call({:add_error, error}, _from, %{errors: errors, sup_pid: sup_pid}) do
    sup_pid && Supervisor.stop(sup_pid)
    {:reply, nil, %{errors: errors ++ [error], sup_pid: nil}}
  end

  def handle_cast({:register_supervisor, sup_pid}, state) do
    {:noreply, Map.put(state, :sup_pid, sup_pid)}
  end

  def handle_cast(:reset_state, _state) do
    {:noreply, %{errors: [], sup_pid: nil}}
  end

  def handle_call(:get_errors, _from, %{errors: errors} = state) do
    {:reply, errors, state}
  end
end

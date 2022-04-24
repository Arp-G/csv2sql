defmodule Csv2sql.Database.ConnectionTest do
  use GenServer
  import ShorterMaps

  def check_connection do
    # Get test args
    Csv2sql.Config.Parser.test()
    args = Application.get_env(:csv2sql, :config)

    if GenServer.whereis(Csv2sql.Database.ConnectionSupervisor) do
      {:ok, :already_running}
    else
      # Launch Task supervisor
      {:ok, sup_pid} = Task.Supervisor.start_link(name: Csv2sql.Database.ConnectionSupervisor)

      # Launch Genserver
      {:ok, pid} = GenServer.start_link(__MODULE__, self(), name: __MODULE__)

      # Call Genserver
      GenServer.cast(__MODULE__, {:start_task, args})

      reply =
        receive do
          {^pid, :connected, _db_conn} -> {:ok, :connected}
          {^pid, :error, e} -> {:error, e}
        after
          5000 ->
            {:error, :timeout}
        end

      # Stop Task Supervisor
      GenServer.stop(sup_pid, :normal)

      reply
    end
  end

  def init(caller) do
    {:ok, %{caller: caller, ref: nil}}
  end

  # If there is a task already running, return its reference
  def handle_cast({:start_task, _args}, %{ref: ref} = state) when is_reference(ref),
    do: {:reply, :ref, state}

  # The task is not running yet, so let's start it.
  def handle_cast({:start_task, ~M{db_url, db_type}}, %{ref: nil} = state) do
    task =
      Task.Supervisor.async_nolink(
        Csv2sql.Database.ConnectionSupervisor,
        __MODULE__,
        :attempt_connection,
        [~M{db_url, db_type, parent: self()}]
      )

    {:noreply, %{state | ref: task.ref}}
  end

  # If there is a task already running, return its reference
  def handle_cast({:start_task, _args}, %{caller: caller}) do
    reason = "Database configuration not found"
    Process.send(caller, {self(), :error, reason}, [])
    {:stop, :normal, %{}}
  end

  # The task completed successfully
  def handle_info({:connected, db_conn}, %{ref: ref, caller: caller}) when is_reference(ref) do
    Process.send(caller, {self(), :connected, db_conn}, [])

    # We don't care about the DOWN message now, so let's demonitor and flush it
    Process.demonitor(ref, [:flush])

    {:stop, :normal, %{}}
  end

  # The task failed
  def handle_info({:error, e}, %{ref: ref, caller: caller}) when is_reference(ref) do
    # We don't care about the DOWN message now, so let's demonitor and flush it
    Process.demonitor(ref, [:flush])
    IO.inspect("ERROR RECIEVED #{inspect(e)}")
    handle_error(caller, e)
  end

  # The task crashed
  def handle_info({:DOWN, ref, :process, _pid, reason}, %{caller: caller})
      when is_reference(ref) do
    IO.inspect("DOWN RECIEVED #{inspect(reason)}")
    handle_error(caller, reason)
  end

  defp handle_error(caller, message) do
    reason = "Database connection failed with error: #{inspect(message)}"
    Process.send(caller, {self(), :error, reason}, [])
    {:stop, :normal, %{}}
  end

  def attempt_connection(~M{db_url, db_type, parent}) do
    repo = get_repo(db_type)

    {:ok, conn} =
      repo.start_link(
        url: db_url,
        pool_size: 1,
        # Show helpful debug information
        show_sensitive_data_on_connection_error: true,
        # Don't try to backoff and reconnect
        backoff_type: :stop,
        # Don't try to restart if connection failed
        max_restarts: 0
      )

    try do
      Ecto.Adapters.SQL.query!(repo, "SELECT 1")
      Process.send(parent, {:connected, conn}, [])
    rescue
      e in DBConnection.ConnectionError -> Process.send(parent, {:error, e}, [])
    end
  end

  # TODO: Need to move these to some helper module
  def get_repo(:mysql), do: Csv2sql.MySQLRepo
  def get_repo(:postgres), do: Csv2sql.PostgreSQLRepo
end

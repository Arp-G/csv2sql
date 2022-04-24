defmodule Csv2sql.Database.ConnectionTest do
  @moduledoc """
    Tests the connection to the database
  """

  use GenServer
  import ShorterMaps
  alias Csv2sql.Database

  @type connect_args() :: %{
          :db_type => :mysql | :postgres,
          :db_url => String.t(),
          :caller => pid()
        }

  # Public API
  @spec(check_db_connection(pid()) :: :ok, {:error, :on_going | String.t()})
  def check_db_connection(caller) do
    args = Application.get_env(:csv2sql, :config)
    test_connection(caller, args)
  end

  @spec check_db_connection(pid(), map()) :: {:error, :on_going | String.t()}
  def check_db_connection(caller, args), do: test_connection(caller, args)

  @spec attempt_connection(connect_args()) :: :noconnect | :nosuspend | :ok
  def attempt_connection(~M{db_url, db_type, caller}) do
    repo = Database.get_repo(db_type)

    {:ok, conn} =
      repo.start_link(
        url: db_url,
        pool_size: 1,
        # Show helpful debug information
        show_sensitive_data_on_connection_error: true,
        # Disable backoff
        backoff_type: :stop,
        # Don't try to restart if connection failed
        max_restarts: 0
      )

    try do
      # Ping DB
      Ecto.Adapters.SQL.query!(repo, "SELECT 1")
      Process.send(caller, {:connected, conn}, [])
    rescue
      e in DBConnection.ConnectionError -> Process.send(caller, {:error, e}, [])
    end
  end

  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(_args) do
    GenServer.start_link(__MODULE__, :no_args, name: __MODULE__)
  end

  # GenServer Callbacks
  @impl GenServer
  def init(_) do
    {:ok, init_state()}
  end

  @impl GenServer
  def handle_call({:check_db_connection, _args}, _from, ~M{ref} = state)
      when is_reference(ref),
      do: {:reply, {:error, :on_going}, state}

  @impl GenServer
  def handle_call({:check_db_connection, ~M{db_url, db_type, caller}}, _from, %{ref: nil} = state) do
    task =
      Task.Supervisor.async_nolink(
        Csv2sql.Database.ConnectionSupervisor,
        __MODULE__,
        :attempt_connection,
        [~M{db_url, db_type, caller: self()}]
      )

    {:reply, :ok, ~M{state | ref: task.ref, caller}}
  end

  @impl GenServer
  def handle_call({:check_db_connection, _args}, _from, _state),
    do: {:reply, {:error, "Database configuration not found"}, init_state()}

  # The task completed successfully
  @impl GenServer
  def handle_info({:connected, db_conn}, %{ref: ref, caller: caller}) when is_reference(ref) do
    Process.send(caller, {:connected, db_conn}, [])

    # We don't care about the DOWN message now, so let's demonitor and flush it
    Process.demonitor(ref, [:flush])

    {:noreply, init_state()}
  end

  # The task failed
  @impl GenServer
  def handle_info({:error, e}, %{ref: ref, caller: caller}) when is_reference(ref) do
    # We don't care about the DOWN message now, so demonitor and flush it
    Process.demonitor(ref, [:flush])
    handle_error(caller, e)
  end

  # The task shutdown
  @impl GenServer
  def handle_info({:DOWN, ref, :process, _pid, reason}, %{caller: caller})
      when is_reference(ref) do
    handle_error(caller, reason)
  end

  # Private helpers
  defp test_connection(caller, args),
    do: GenServer.call(__MODULE__, {:check_db_connection, Map.put(args, :caller, caller)})

  defp handle_error(caller, message) do
    reason = "Database connection failed with error: #{inspect(message)}"
    Process.send(caller, {:error, reason}, [])
    {:noreply, init_state()}
  end

  defp init_state, do: %{ref: nil, caller: nil}
end

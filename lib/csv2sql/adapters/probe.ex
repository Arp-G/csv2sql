defmodule Csv2sql.Adapters.Probe do
  @moduledoc """
  Runs connection-probing functions isolated from the caller.

  Driver pools are always linked to their starter, and a pool whose
  connection dies (`backoff_type: :stop`) takes its starter down with it —
  so probes (ensure_database, the UI's connection test) execute inside a
  supervised, unlinked task. A crash or hang becomes a value, never an
  exit signal in the caller.
  """

  @timeout :timer.seconds(15)

  @doc """
  Runs `fun` in an unlinked task under `Csv2sql.ProbeSupervisor`.

  Returns the function's result, or `{:error, {:probe_exit, reason}}`
  when it crashed or timed out.
  """
  @spec isolated((-> result)) :: result | {:error, {:probe_exit, term()}} when result: term()
  def isolated(fun) when is_function(fun, 0) do
    task = Task.Supervisor.async_nolink(Csv2sql.ProbeSupervisor, fun)

    case Task.yield(task, @timeout) do
      {:ok, result} ->
        result

      {:exit, reason} ->
        {:error, {:probe_exit, reason}}

      nil ->
        Task.Supervisor.terminate_child(Csv2sql.ProbeSupervisor, task.pid)
        {:error, {:probe_exit, :timeout}}
    end
  end

  @doc "Stops a probe connection, tolerating an already-dead pool."
  @spec safe_stop(pid()) :: :ok
  def safe_stop(conn) do
    GenServer.stop(conn)
    :ok
  catch
    :exit, _reason -> :ok
  end
end

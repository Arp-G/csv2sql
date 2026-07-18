defmodule Csv2sqlWeb.UiHelpers do
  @moduledoc """
  Helpers for LiveView tests: polling assertions for event-driven UI
  updates (the engine pushes events; renders converge, not instantly).
  """

  import ExUnit.Assertions

  @doc "Polls `fun` until truthy (default ~5s), else flunks."
  @spec assert_eventually((-> boolean()), pos_integer(), pos_integer()) :: :ok
  def assert_eventually(fun, attempts \\ 100, sleep_ms \\ 50) do
    cond do
      fun.() ->
        :ok

      attempts == 0 ->
        flunk("condition not met in time")

      true ->
        Process.sleep(sleep_ms)
        assert_eventually(fun, attempts - 1, sleep_ms)
    end
  end
end

defmodule Csv2sql.EventsTest do
  use ExUnit.Case, async: true

  alias Csv2sql.Events

  test "emit broadcasts a fully-populated event struct to subscribers" do
    run_id = "test_run_#{System.unique_integer([:positive])}"
    :ok = Events.subscribe(run_id)

    Events.emit(run_id, Events.RunStarted, file_count: 3)

    assert_receive %Events.RunStarted{run_id: ^run_id, file_count: 3, at: %DateTime{}}
  end

  test "unsubscribed processes receive nothing" do
    run_id = "test_run_#{System.unique_integer([:positive])}"
    :ok = Events.subscribe(run_id)
    :ok = Events.unsubscribe(run_id)

    Events.emit(run_id, Events.RunCancelled)

    refute_receive %Events.RunCancelled{}, 50
  end

  test "terminal?/1 marks exactly the terminal events" do
    now = DateTime.utc_now()

    assert Events.terminal?(%Events.RunCompleted{run_id: "r", at: now, summary: nil})
    assert Events.terminal?(%Events.RunFailed{run_id: "r", at: now, error: nil})
    assert Events.terminal?(%Events.RunCancelled{run_id: "r", at: now})
    refute Events.terminal?(%Events.RunStarted{run_id: "r", at: now, file_count: 1})

    refute Events.terminal?(%Events.LoadProgress{
             run_id: "r",
             at: now,
             path: "x",
             rows_inserted: 0,
             rows_rejected: 0
           })
  end
end

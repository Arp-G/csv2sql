defmodule Csv2sql.Load.InserterTest do
  # Unit tests of the retry/isolation engine against the scriptable
  # FakeAdapter — no database involved.
  use ExUnit.Case, async: true

  alias Csv2sql.Config
  alias Csv2sql.Config.ErrorPolicy
  alias Csv2sql.Error
  alias Csv2sql.Events
  alias Csv2sql.FakeAdapter
  alias Csv2sql.File, as: CsvFile
  alias Csv2sql.Load.Inserter
  alias Csv2sql.Schema.ColumnSpec
  alias Csv2sql.Validate.Ledger

  defp build_ctx(script, config_overrides \\ %{}) do
    {:ok, agent} = FakeAdapter.start_script(script)
    run_id = "fake_#{System.unique_integer([:positive])}"
    :ok = Events.subscribe(run_id)

    policy = struct!(ErrorPolicy, %{backoff_ms: 1, max_retries: 3})
    config = struct!(%Config{error_policy: policy}, config_overrides)

    %{
      run_id: run_id,
      config: config,
      adapter: FakeAdapter,
      conn: agent,
      parsers: %{date: [], datetime: []}
    }
  end

  defp int_file do
    %CsvFile{
      path: "f.csv",
      name: "f.csv",
      table_name: "t",
      columns: [%ColumnSpec{position: 0, name: "id", type: :integer}]
    }
  end

  defp numbered_rows(values),
    do: values |> Enum.with_index(1) |> Enum.map(fn {v, n} -> {[v], n} end)

  test "happy path: all rows insert, ledger balances" do
    ctx = build_ctx([])

    assert {:ok, %{ledger: ledger, rejected: []}} =
             Inserter.insert_chunk(numbered_rows(~w(1 2 3 4 5)), int_file(), ctx)

    assert %Ledger{rows_read: 5, rows_inserted: 5, rows_rejected: 0, chunks_ok: 1} = ledger
    assert Ledger.balanced?(ledger)
  end

  test "cast failures reject rows before the database" do
    ctx = build_ctx([])

    assert {:ok, %{ledger: ledger, rejected: [rejected]}} =
             Inserter.insert_chunk(numbered_rows(~w(1 nope 3)), int_file(), ctx)

    assert %Ledger{rows_read: 3, rows_inserted: 2, rows_rejected: 1} = ledger
    assert rejected.row_number == 2
    assert rejected.row == ["nope"]
    assert rejected.reason =~ "id: cannot cast"

    # Only the good rows reached the adapter.
    assert [[[1], [3]]] = FakeAdapter.calls(ctx.conn)
  end

  test "transient errors retry with events, then succeed" do
    script = [{:error, :transient, "deadlock"}, {:error, :transient, "deadlock"}, {:ok, :all}]
    ctx = build_ctx(script)
    run_id = ctx.run_id

    assert {:ok, %{ledger: %Ledger{rows_inserted: 3, retries: 2}}} =
             Inserter.insert_chunk(numbered_rows(~w(1 2 3)), int_file(), ctx)

    assert_received %Events.ChunkRetried{run_id: ^run_id, attempt: 1, reason: "deadlock"}
    assert_received %Events.ChunkRetried{run_id: ^run_id, attempt: 2}
    refute_received %Events.ChunkRetried{}
  end

  test "exhausted transient errors fail the file" do
    script = List.duplicate({:error, :transient, "lock timeout"}, 4)
    ctx = build_ctx(script)

    assert {:file_error, %Error{class: :file, reason: "retries_exhausted"} = error} =
             Inserter.insert_chunk(numbered_rows(~w(1)), int_file(), ctx)

    assert error.message =~ "3 retries"
  end

  test "exhausted connection errors abort the run" do
    script = List.duplicate({:error, :connection, "refused"}, 4)
    ctx = build_ctx(script)

    assert {:run_abort, %Error{class: :run, reason: "database_unreachable"}} =
             Inserter.insert_chunk(numbered_rows(~w(1)), int_file(), ctx)
  end

  test "fatal errors fail the file immediately, no retries" do
    ctx = build_ctx([{:error, :fatal, "syntax error"}])

    assert {:file_error, %Error{class: :file}} =
             Inserter.insert_chunk(numbered_rows(~w(1)), int_file(), ctx)

    refute_received %Events.ChunkRetried{}
    assert length(FakeAdapter.calls(ctx.conn)) == 1
  end

  test "row_data errors isolate the chunk row by row" do
    # Chunk fails; then per-row: ok, bad, ok (script exhausts → ok).
    script = [
      {:error, :row_data, "some row is bad"},
      {:ok, :all},
      {:error, :row_data, "bad value"}
    ]

    ctx = build_ctx(script)

    assert {:ok, %{ledger: ledger, rejected: [rejected]}} =
             Inserter.insert_chunk(numbered_rows(~w(1 2 3)), int_file(), ctx)

    assert %Ledger{rows_read: 3, rows_inserted: 2, rows_rejected: 1, chunks_isolated: 1} = ledger
    assert Ledger.balanced?(ledger)
    assert rejected.row_number == 2
    assert rejected.reason == "bad value"

    # One chunk attempt + three single-row attempts.
    assert [_chunk, [[1]], [[2]], [[3]]] = FakeAdapter.calls(ctx.conn)
  end

  test "ordered mode prepends the row number as a bigint column" do
    ctx = build_ctx([], %{ordered: true})

    file = %CsvFile{
      path: "f.csv",
      name: "f.csv",
      table_name: "t",
      columns: [
        %ColumnSpec{position: 0, name: "csv_ordering_id", type: :bigint},
        %ColumnSpec{position: 1, name: "id", type: :integer}
      ]
    }

    assert {:ok, %{ledger: %Ledger{rows_inserted: 2}}} =
             Inserter.insert_chunk(numbered_rows(~w(7 9)), file, ctx)

    assert [[[1, 7], [2, 9]]] = FakeAdapter.calls(ctx.conn)
  end
end

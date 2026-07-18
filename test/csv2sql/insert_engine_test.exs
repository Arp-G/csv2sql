defmodule Csv2sql.InsertEngineTest do
  # Stage-2 acceptance: the chunker must honor the adapter's positional
  # parameter cap and the byte budget (upstream issue #21), verified by
  # the exact chunk counts the ledger records.
  use Csv2sql.EngineCase, async: true, parameterize: Csv2sql.EngineCase.db_parameters()

  @moduletag :db

  test "wide files respect the parameter cap", %{tmp_dir: dir} = ctx do
    table = unique_name("wide")
    header = for i <- 1..200, do: "c#{i}"
    row = for i <- 1..200, do: Integer.to_string(i)
    rows = List.duplicate(row, 1000)

    csv!(dir, table <> ".csv", [header | rows])

    %{run: run} = run_import(dir, ctx)

    assert run.status == :completed
    [file] = Run.files_in_order(run)

    # 65_535 params / 200 columns = 327 rows per chunk → ceil(1000/327) = 4.
    assert file.ledger.chunks_ok == 4
    assert file.ledger.rows_inserted == 1000
    assert count!(ctx, table) == 1000
  end

  test "the byte budget splits chunks before they exceed it", %{tmp_dir: dir} = ctx do
    table = unique_name("chunky")
    payload = String.duplicate("x", 50_000)

    csv!(dir, table <> ".csv", [
      ~w(id payload),
      ["1", payload],
      ["2", payload],
      ["3", payload]
    ])

    # Budget below two payloads → one row per chunk.
    %{run: run} = run_import(dir, ctx, %{insert_chunk_bytes: 65_536})

    assert run.status == :completed
    [file] = Run.files_in_order(run)

    assert file.ledger.chunks_ok == 3
    assert file.ledger.rows_inserted == 3
    assert [%{type: :integer}, %{type: :text}] = file.columns

    assert select!(ctx, table, ~w(id), "id") == [[1], [2], [3]]
  end

  # Regression: the fold must post its ledger to Run.Server per chunk —
  # snapshots (and the throttled FileUpdated events feeding the UI) used
  # to freeze at zero until the loading→done jump.
  test "run_state exposes live ledger progress during the load", %{tmp_dir: dir} = ctx do
    table = unique_name("live_progress")
    rows = for i <- 1..60_000, do: [Integer.to_string(i)]
    csv!(dir, table <> ".csv", [~w(id) | rows])

    config = build_config(dir, ctx, %{insert_workers: 1, insert_chunk_rows: 300})
    {:ok, run_id} = Csv2sql.start_run(config)

    partial = poll_partial_insert(run_id, 60_000, 5_000)

    {:ok, run} = Csv2sql.await(run_id)
    register_table_cleanup(run)
    assert run.status == :completed

    assert partial, "never observed a mid-load ledger (0 < rows_inserted < 60000)"
  end

  defp poll_partial_insert(_run_id, _total, tries) when tries <= 0, do: nil

  defp poll_partial_insert(run_id, total, tries) do
    with {:ok, run} <- Csv2sql.run_state(run_id),
         [file] <- Map.values(run.files),
         %{rows_inserted: inserted} when inserted > 0 and inserted < total <-
           file.ledger || %{rows_inserted: 0} do
      inserted
    else
      _not_yet ->
        Process.sleep(2)
        poll_partial_insert(run_id, total, tries - 1)
    end
  end
end

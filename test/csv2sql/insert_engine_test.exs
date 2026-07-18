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
end

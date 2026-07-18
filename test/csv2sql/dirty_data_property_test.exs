defmodule Csv2sql.DirtyDataPropertyTest do
  # The stage-4 property: whatever poison lands in a CSV, a run never
  # crashes, the ledger always balances, and the rejected count equals
  # exactly the number of poisoned rows.
  use Csv2sql.EngineCase, async: true, parameterize: Csv2sql.EngineCase.db_parameters()
  use ExUnitProperties

  alias Csv2sql.Validate.Ledger

  @moduletag :db
  @moduletag timeout: 120_000

  property "poisoned rows are exactly isolated; clean rows always land", ctx do
    check all(
            row_count <- StreamData.integer(10..40),
            poison_count <- StreamData.integer(0..4),
            poison_rows <-
              StreamData.uniq_list_of(StreamData.integer(1..10), length: min(poison_count, 10)),
            max_runs: 8
          ) do
      # A fresh subdirectory per iteration — discovery must not pick up
      # earlier iterations' files.
      dir = Path.join(ctx.tmp_dir, "iter_#{System.unique_integer([:positive])}")
      File.mkdir_p!(dir)
      table = unique_name("dirty")

      poisoned = poison_rows |> Enum.map(&min(&1, row_count)) |> Enum.uniq()

      rows =
        for i <- 1..row_count do
          name = if i in poisoned, do: <<0xFF, 0xFE>>, else: "clean_#{i}"
          [Integer.to_string(i), name]
        end

      csv!(dir, table <> ".csv", [~w(id name) | rows])

      %{run: run} = run_import(dir, ctx)

      assert run.status == :completed
      [file] = Run.files_in_order(run)
      assert file.status == :done
      assert Ledger.balanced?(file.ledger)
      assert file.ledger.rows_read == row_count
      assert file.ledger.rows_rejected == length(poisoned)
      assert file.ledger.rows_inserted == row_count - length(poisoned)
      assert count!(ctx, table) == row_count - length(poisoned)
    end
  end
end

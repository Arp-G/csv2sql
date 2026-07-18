defmodule Csv2sql.ErrorModelTest do
  # Stage-4 acceptance, end-to-end: row isolation at the database level,
  # errors.csv contents, the per-file circuit breaker, and strict mode.
  use Csv2sql.EngineCase, async: true, parameterize: Csv2sql.EngineCase.db_parameters()

  alias NimbleCSV.RFC4180, as: CSV

  @moduletag :db

  # NOTE: cast-time rejections cannot occur naturally — inference sees
  # every value, so dirty data *widens the type* instead ("not_a_number"
  # in an id column makes it varchar). They become reachable with user
  # type-overrides (stage 7) and are unit-tested in InserterTest. E2E
  # poison therefore uses database-level rejection (invalid UTF-8).
  test "one poison row among 5000 is isolated (acceptance: 5000 = 4999 + 1)",
       %{tmp_dir: dir} = ctx do
    table = unique_name("poison")

    rows =
      for i <- 1..5000 do
        name = if i == 2500, do: <<0xFF, 0xFE>>, else: "name_#{i}"
        [Integer.to_string(i), name]
      end

    csv!(dir, table <> ".csv", [~w(id name) | rows])

    %{run: run, events: events} = run_import(dir, ctx)

    assert run.status == :completed
    [file] = Run.files_in_order(run)
    assert file.status == :done
    assert file.ledger.rows_read == 5000
    assert file.ledger.rows_inserted == 4999
    assert file.ledger.rows_rejected == 1
    assert file.ledger.chunks_isolated == 1

    assert_event(events, %Events.RowsRejected{count: 1})

    assert [["row_number", "reason", "id", "name"], ["2500", reason, "2500", _bad]] =
             file.errors_csv |> File.read!() |> CSV.parse_string(skip_headers: false)

    assert reason != ""
    assert count!(ctx, table) == 4999
    assert db_query!(ctx, missing_row_sql(ctx, table)) == []
  end

  defp missing_row_sql(%{db_adapter: :postgres}, table),
    do: ~s{SELECT 1 FROM "#{table}" WHERE "id" = 2500}

  defp missing_row_sql(%{db_adapter: :mysql}, table),
    do: "SELECT 1 FROM `#{table}` WHERE `id` = 2500"

  test "database-level poison rows are isolated row by row", %{tmp_dir: dir} = ctx do
    table = unique_name("db_poison")

    # Invalid UTF-8 passes casting (it's "just a string") but the server
    # rejects it — the chunk splits and only the poison row is rejected.
    rows = [
      ["1", "alice"],
      ["2", "bob"],
      ["3", <<0xFF, 0xFE>>],
      ["4", "dora"],
      ["5", "eve"]
    ]

    csv!(dir, table <> ".csv", [~w(id name) | rows])

    %{run: run, events: events} = run_import(dir, ctx)

    assert run.status == :completed
    [file] = Run.files_in_order(run)
    assert file.status == :done
    assert file.ledger.rows_read == 5
    assert file.ledger.rows_inserted == 4
    assert file.ledger.rows_rejected == 1
    assert file.ledger.chunks_isolated == 1

    assert_event(events, %Events.RowsRejected{count: 1})

    assert [["row_number", "reason", "id", "name"], ["3", reason, "3", _bad]] =
             file.errors_csv |> File.read!() |> CSV.parse_string(skip_headers: false)

    assert reason != ""
    assert count!(ctx, table) == 4
    assert select!(ctx, table, ~w(id), "id") == [[1], [2], [4], [5]]
  end

  test "the circuit breaker fails a mostly-broken file; siblings continue",
       %{tmp_dir: dir} = ctx do
    bad_table = unique_name("mostly_bad")
    good_table = unique_name("still_good")

    bad_rows =
      for i <- 1..1000 do
        name = if rem(i, 10) < 6, do: <<0xFF, 0xFE>>, else: "name_#{i}"
        [Integer.to_string(i), name]
      end

    csv!(dir, bad_table <> ".csv", [~w(id name) | bad_rows])
    csv!(dir, good_table <> ".csv", [~w(id name), ["101", "x"], ["102", "y"]])

    %{run: run} = run_import(dir, ctx)

    assert run.status == :completed_with_errors
    files = Run.files_in_order(run)

    bad_file = Enum.find(files, &(&1.table_name == bad_table))
    good_file = Enum.find(files, &(&1.table_name == good_table))

    assert bad_file.status == :failed
    assert [%{reason: "rejection_threshold_exceeded"} = error] = bad_file.errors
    assert error.message =~ "threshold 5.0%"
    assert bad_file.errors_csv != nil

    assert good_file.status == :done
    assert count!(ctx, good_table) == 2
  end

  test "strict mode halts the whole run on the first file failure", %{tmp_dir: dir} = ctx do
    bad = unique_name("aa_bad")
    good = unique_name("zz_good")

    File.write!(Path.join(dir, bad <> ".csv"), ~s(id\n"unclosed\n))
    rows = for i <- 1..20_000, do: [Integer.to_string(i)]
    csv!(dir, good <> ".csv", [~w(id) | rows])

    %{run: run, events: events} = run_import(dir, ctx, %{error_policy: %{strict: true}})

    assert run.status == :failed
    assert run.error.reason == "strict_file_failure"
    assert_event(events, %Events.RunFailed{})
  end
end

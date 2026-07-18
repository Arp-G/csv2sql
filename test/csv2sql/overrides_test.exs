defmodule Csv2sql.OverridesTest do
  # User overrides (the schema-editor payload): table rename, column
  # rename/re-type/resize, column exclusion, file selection — and the
  # encode-reject path they finally make reachable.
  use Csv2sql.EngineCase, async: true, parameterize: Csv2sql.EngineCase.db_parameters()

  alias NimbleCSV.RFC4180, as: CSV

  @moduletag :db

  test "table rename, column rename, and type overrides apply", %{tmp_dir: dir} = ctx do
    file = unique_name("src")
    target = unique_name("renamed_target")

    csv!(dir, file <> ".csv", [
      ~w(id price note),
      ["7", "1.5", "alpha"],
      ["9", "2.25", "beta"]
    ])

    overrides = [
      %{
        file: file <> ".csv",
        table_name: target,
        columns: [
          %{position: 0, type: "bigint"},
          %{position: 2, name: "comment", type: "text"}
        ]
      }
    ]

    %{run: run} = run_import(dir, ctx, %{overrides: overrides})

    assert run.status == :completed
    [imported] = Run.files_in_order(run)
    assert imported.table_name == target

    assert [
             %{name: "id", type: :bigint, source_position: 0},
             %{name: "price", type: :float, source_position: 1},
             %{name: "comment", type: :text, source_position: 2}
           ] = imported.columns

    assert column_types!(ctx, target) == [:bigint, :float, :text]
    assert select!(ctx, target, ~w(comment), "id") == [["alpha"], ["beta"]]
  end

  test "excluded columns are dropped; sibling values stay aligned", %{tmp_dir: dir} = ctx do
    table = unique_name("gappy")

    csv!(dir, table <> ".csv", [
      ~w(id secret note),
      ["1", "classified", "keep_a"],
      ["2", "hidden", "keep_b"]
    ])

    overrides = [%{file: table <> ".csv", columns: [%{position: 1, include: false}]}]

    %{run: run} = run_import(dir, ctx, %{overrides: overrides})

    assert run.status == :completed
    [file] = Run.files_in_order(run)
    assert Enum.map(file.columns, & &1.name) == ["id", "note"]

    # Values from around the gap land in the right columns.
    assert column_types!(ctx, table) == [:integer, :varchar]
    assert select!(ctx, table, ~w(note), "id") == [["keep_a"], ["keep_b"]]

    # The sample rows still show the full source file for the editor.
    assert file.source_headers == ~w(id secret note)
    assert [["1", "classified", "keep_a"] | _rest] = file.sample_rows
  end

  test "exclusion composes with ordered mode", %{tmp_dir: dir} = ctx do
    table = unique_name("ordered_gap")

    csv!(dir, table <> ".csv", [
      ~w(drop_me name),
      ["x", "charlie"],
      ["y", "alpha"]
    ])

    overrides = [%{file: table <> ".csv", columns: [%{position: 0, include: false}]}]

    %{run: run} = run_import(dir, ctx, %{ordered: true, overrides: overrides})

    assert run.status == :completed
    [file] = Run.files_in_order(run)
    assert Enum.map(file.columns, & &1.name) == ["csv_ordering_id", "name"]

    assert select!(ctx, table, ~w(csv_ordering_id name), "csv_ordering_id") ==
             [[1, "charlie"], [2, "alpha"]]
  end

  test "deselected files are left out of the run entirely", %{tmp_dir: dir} = ctx do
    wanted = unique_name("wanted")
    unwanted = unique_name("unwanted")
    csv!(dir, wanted <> ".csv", [~w(id), ["1"]])
    csv!(dir, unwanted <> ".csv", [~w(id), ["1"]])

    overrides = [%{file: unwanted <> ".csv", include: false}]

    %{run: run} = run_import(dir, ctx, %{overrides: overrides})

    assert run.status == :completed
    assert [%{table_name: ^wanted}] = Run.files_in_order(run)
    refute table_exists?(ctx, unwanted)
  end

  test "a forced narrower type rejects rows at encode time", %{tmp_dir: dir} = ctx do
    table = unique_name("forced")

    csv!(dir, table <> ".csv", [
      ~w(id note),
      ["1", "alpha"],
      ["2", "beta"],
      ["3", "gamma"]
    ])

    overrides = [%{file: table <> ".csv", columns: [%{position: 1, type: "integer"}]}]

    %{run: run, events: events} = run_import(dir, ctx, %{overrides: overrides})

    # Below the arming floor the breaker stays quiet: the file completes
    # with every row rejected and accounted for.
    assert run.status == :completed
    [file] = Run.files_in_order(run)
    assert file.status == :done
    assert file.ledger.rows_read == 3
    assert file.ledger.rows_inserted == 0
    assert file.ledger.rows_rejected == 3

    assert_event(events, %Events.RowsRejected{count: 3})
    assert count!(ctx, table) == 0

    assert [["row_number", "reason", "id", "note"], ["1", reason, "1", "alpha"] | _rest] =
             file.errors_csv |> File.read!() |> CSV.parse_string(skip_headers: false)

    assert reason =~ "note: cannot cast"
    assert reason =~ "to integer"
  end
end

defmodule Csv2sql.TypeSystemTest do
  # Stage-3 acceptance: the full type system end-to-end — booleans, dates,
  # datetimes (with custom patterns), zero-dates → NULL, integer tiers,
  # string sizing tiers, ordered mode, and the per-run schema.sql.
  use Csv2sql.EngineCase, async: true, parameterize: Csv2sql.EngineCase.db_parameters()

  alias Csv2sql.Run.Artifacts

  @moduletag :db

  test "booleans, dates, datetimes, and tiers infer and round-trip", %{tmp_dir: dir} = ctx do
    table = unique_name("typed")

    csv!(dir, table <> ".csv", [
      ~w(flag mixed_bool born seen big small note),
      ["true", "1", "2023-07-18", "2023-07-18 14:30:00", "3000000000", "2", "hi"],
      ["FALSE", "0", "1999-12-31", "2024-01-01T08:15:59", "-3000000000", "1", "there"]
    ])

    %{run: run} = run_import(dir, ctx)

    assert run.status == :completed
    [file] = Run.files_in_order(run)

    assert [
             %{name: "flag", type: :boolean},
             %{name: "mixed_bool", type: :boolean},
             %{name: "born", type: :date},
             %{name: "seen", type: :datetime},
             %{name: "big", type: :bigint},
             # "2"/"1" is NOT boolean — only strict 0/1/true/false columns are.
             %{name: "small", type: :integer},
             %{name: "note", type: :varchar, length: 5}
           ] = file.columns

    assert column_types!(ctx, table) ==
             [:boolean, :boolean, :date, :datetime, :bigint, :integer, :varchar]

    # Booleans read back per the adapter's storage: Postgres BOOLEAN gives
    # true/false; MySQL TINYINT(1) gives 0/1 (by design — it aggregates).
    {falsy, truthy} =
      case ctx.db_adapter do
        :postgres -> {false, true}
        :mysql -> {0, 1}
      end

    assert select!(ctx, table, ~w(flag born seen big), "big") == [
             [falsy, ~D[1999-12-31], ~N[2024-01-01 08:15:59], -3_000_000_000],
             [truthy, ~D[2023-07-18], ~N[2023-07-18 14:30:00], 3_000_000_000]
           ]
  end

  test "zero-dates keep the column a date and load as NULL", %{tmp_dir: dir} = ctx do
    table = unique_name("zero_dates")

    csv!(dir, table <> ".csv", [
      ~w(id day stamp),
      ["7", "2023-01-02", "2023-01-02 03:04:05"],
      ["8", "0000-00-00", "0000-00-00 00:00:00"]
    ])

    %{run: run} = run_import(dir, ctx)

    assert run.status == :completed
    [file] = Run.files_in_order(run)
    assert [%{type: :integer}, %{type: :date}, %{type: :datetime}] = file.columns
    assert file.ledger.rows_inserted == 2

    assert select!(ctx, table, ~w(day stamp), "id") == [
             [~D[2023-01-02], ~N[2023-01-02 03:04:05]],
             [nil, nil]
           ]
  end

  test "garbage dates never raise and fall back to strings (issue #24)", %{tmp_dir: dir} = ctx do
    table = unique_name("garbage_dates")

    # Invalid *encodings* are a Reader concern (stage 4) — this fixture is
    # about malformed date *content* that used to crash Timex.
    csv!(dir, table <> ".csv", [
      ~w(id when),
      ["7", "77-88-99"],
      ["8", "07/26/2019x"],
      ["9", "2023-01-99"]
    ])

    %{run: run} = run_import(dir, ctx)

    assert run.status == :completed
    [file] = Run.files_in_order(run)
    assert [%{type: :integer}, %{type: :varchar}] = file.columns
    assert file.ledger.rows_inserted == 3
  end

  test "custom date patterns extend inference", %{tmp_dir: dir} = ctx do
    table = unique_name("custom_dates")

    csv!(dir, table <> ".csv", [
      ~w(id day),
      ["7", "26/07/2019"],
      ["8", "5/1/2020"]
    ])

    overrides = %{date_patterns: ["{YYYY}-{0M}-{0D}", "{D}/{M}/{YYYY}"]}
    %{run: run} = run_import(dir, ctx, overrides)

    assert run.status == :completed
    [file] = Run.files_in_order(run)
    assert [%{type: :integer}, %{type: :date}] = file.columns
    assert select!(ctx, table, ~w(day), "id") == [[~D[2019-07-26]], [~D[2020-01-05]]]
  end

  test "huge fields land in longtext; long strings in text", %{tmp_dir: dir} = ctx do
    table = unique_name("sized")
    huge = String.duplicate("h", 70_000)
    long = String.duplicate("l", 500)

    csv!(dir, table <> ".csv", [
      ~w(huge long small),
      [huge, long, "tiny"]
    ])

    %{run: run} = run_import(dir, ctx)

    assert run.status == :completed
    [file] = Run.files_in_order(run)

    assert [
             %{name: "huge", type: :longtext},
             %{name: "long", type: :text},
             %{name: "small", type: :varchar, length: 4}
           ] = file.columns

    length_sql =
      case ctx.db_adapter do
        :postgres -> ~s{SELECT OCTET_LENGTH("huge"), OCTET_LENGTH("long") FROM "#{table}"}
        :mysql -> "SELECT LENGTH(`huge`), LENGTH(`long`) FROM `#{table}`"
      end

    assert db_query!(ctx, length_sql) == [[70_000, 500]]
    assert count!(ctx, table) == 1
  end

  test "ordered mode prepends a row-order column", %{tmp_dir: dir} = ctx do
    table = unique_name("ordered")

    csv!(dir, table <> ".csv", [
      ~w(name),
      ["charlie"],
      ["alpha"],
      ["bravo"]
    ])

    %{run: run} = run_import(dir, ctx, %{ordered: true})

    assert run.status == :completed
    [file] = Run.files_in_order(run)
    assert [%{name: "csv_ordering_id", type: :bigint}, %{name: "name"}] = file.columns

    # CSV order is reconstructible regardless of storage order.
    assert select!(ctx, table, ~w(csv_ordering_id name), "csv_ordering_id") == [
             [1, "charlie"],
             [2, "alpha"],
             [3, "bravo"]
           ]
  end

  test "schema.sql is written per run — analyze included — and matches golden DDL",
       %{tmp_dir: dir} = ctx do
    table = unique_name("golden")

    csv!(dir, table <> ".csv", [
      ~w(id flag day note),
      ["9000000000", "1", "2024-02-29", "hello"]
    ])

    %{run: run, run_id: run_id} = run_import(dir, ctx, %{mode: :analyze})
    assert run.status == :completed

    schema_sql =
      run.config
      |> Artifacts.dir(run_id)
      |> Artifacts.schema_path()
      |> File.read!()

    assert schema_sql == golden_schema(ctx.db_adapter, table)
  end

  defp golden_schema(:postgres, table) do
    Enum.join(
      [
        "-- #{table}.csv",
        ~s{DROP TABLE IF EXISTS "#{table}";},
        ~s{CREATE TABLE IF NOT EXISTS "#{table}" } <>
          ~s{("id" BIGINT NULL DEFAULT NULL, "flag" BOOLEAN NULL DEFAULT NULL, } <>
          ~s{"day" DATE NULL DEFAULT NULL, "note" VARCHAR(5) NULL DEFAULT NULL);},
        "",
        ""
      ],
      "\n"
    )
  end

  defp golden_schema(:mysql, table) do
    Enum.join(
      [
        "-- #{table}.csv",
        "DROP TABLE IF EXISTS `#{table}`;",
        "CREATE TABLE IF NOT EXISTS `#{table}` " <>
          "(`id` BIGINT NULL DEFAULT NULL, `flag` TINYINT(1) NULL DEFAULT NULL, " <>
          "`day` DATE NULL DEFAULT NULL, `note` VARCHAR(5) NULL DEFAULT NULL) " <>
          "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;",
        "",
        ""
      ],
      "\n"
    )
  end
end

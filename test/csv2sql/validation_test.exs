defmodule Csv2sql.ValidationTest do
  # Stage-5 acceptance: the validation ladder end-to-end, fingerprint
  # mismatch detection on a corrupted table, append-aware counts,
  # preflight, and the run report.
  use Csv2sql.EngineCase, async: true, parameterize: Csv2sql.EngineCase.db_parameters()

  alias Csv2sql.Adapters.MySql
  alias Csv2sql.Adapters.Postgres
  alias Csv2sql.Config.Db
  alias Csv2sql.Run.Report
  alias Csv2sql.Validate.Runner

  @moduletag :db

  defp typed_csv!(dir, table) do
    csv!(dir, table <> ".csv", [
      ~w(id score flag day seen note),
      ["1", "1.5", "true", "2023-07-18", "2023-07-18 14:30:00", "alpha"],
      ["2", "-2.25", "false", "1999-12-31", "2024-01-01T08:15:59", "Zoé"],
      ["3", "", "1", "0000-00-00", "", "gamma"]
    ])
  end

  test "a clean typed import passes every validation layer", %{tmp_dir: dir} = ctx do
    table = unique_name("valid")
    typed_csv!(dir, table)

    %{run: run, events: events} = run_import(dir, ctx)

    assert run.status == :completed
    [file] = Run.files_in_order(run)
    assert file.status == :done

    assert [
             %{layer: :ledger, status: :passed},
             %{layer: :counts, status: :passed, detail: %{"expected" => 3, "actual" => 3}},
             %{layer: :fingerprints, status: :passed}
           ] = file.validation

    assert_event(events, %Events.ValidationResult{layer: :fingerprints, status: :passed})

    # Fingerprints are kept on the file for later re-validation.
    assert length(file.fingerprints) == length(file.columns)
  end

  # SQL aggregates return NULL over zero non-NULL values; the
  # accumulators must mirror that instead of false-failing 0 vs NULL
  # (found in the wild: header-only exports and all-NULL columns).
  test "header-only files and all-NULL columns fingerprint clean", %{tmp_dir: dir} = ctx do
    empty = unique_name("fp_headers_only")
    sparse = unique_name("fp_all_null")

    csv!(dir, empty <> ".csv", [~w(user_id upload_id inserted_at note flag)])

    csv!(dir, sparse <> ".csv", [
      ~w(id gone_text gone_bool gone_num),
      ["1", "", "", ""],
      ["2", "", "", ""]
    ])

    # All-NULL columns infer as varchar — force the bool/int kinds so
    # every fingerprint family sees the zero-non-NULL case.
    overrides = [
      %{
        file: sparse <> ".csv",
        columns: [%{position: 2, type: "boolean"}, %{position: 3, type: "integer"}]
      }
    ]

    %{run: run} = run_import(dir, ctx, %{overrides: overrides})

    assert run.status == :completed

    for file <- Run.files_in_order(run) do
      assert %{layer: :fingerprints, status: :passed, detail: detail} =
               Enum.find(file.validation, &(&1.layer == :fingerprints)),
             "#{file.name}: #{inspect(file.validation)}"

      assert Enum.all?(detail["columns"], & &1["ok"]), inspect(detail, pretty: true)
    end

    assert count!(ctx, empty) == 0
    assert count!(ctx, sparse) == 2
  end

  test "corrupting the table afterwards is caught by re-validation", %{tmp_dir: dir} = ctx do
    table = unique_name("corrupt")
    typed_csv!(dir, table)

    %{run: run} = run_import(dir, ctx)
    assert run.status == :completed
    [file] = Run.files_in_order(run)

    assert [%{layer: :fingerprints, status: :passed}] =
             Enum.filter(file.validation, &(&1.layer == :fingerprints))

    # Corrupt one numeric value behind the engine's back.
    corrupt_sql =
      case ctx.db_adapter do
        :postgres -> ~s{UPDATE "#{table}" SET "score" = 999.0 WHERE "id" = 1}
        :mysql -> "UPDATE `#{table}` SET `score` = 999.0 WHERE `id` = 1"
      end

    db_query!(ctx, corrupt_sql)

    {adapter, db} = adapter_and_db(ctx)

    {:ok, false, results} =
      with_conn(db, fn conn ->
        Runner.check_fingerprints(adapter, conn, table, file.columns, file.fingerprints)
      end)

    score = Enum.find(results, &(&1.column == "score"))
    refute score.ok
    assert score.checks[:sum]["ok"] == false
    assert score.checks[:max]["ok"] == false
    assert score.checks[:null_count]["ok"] == true

    # Untouched columns still match.
    assert Enum.find(results, &(&1.column == "note")).ok
  end

  test "append mode: counts are baseline-aware; fingerprints are skipped",
       %{tmp_dir: dir} = ctx do
    table = unique_name("appendable")
    typed_csv!(dir, table)

    %{run: first} = run_import(dir, ctx)
    assert first.status == :completed

    %{run: second} = run_import(dir, ctx, %{table_mode: :append})
    assert second.status == :completed
    [file] = Run.files_in_order(second)

    assert [
             %{layer: :ledger, status: :passed},
             %{
               layer: :counts,
               status: :passed,
               detail: %{"baseline" => 3, "expected" => 6, "actual" => 6}
             },
             %{layer: :fingerprints, status: :skipped}
           ] = file.validation

    assert count!(ctx, table) == 6
  end

  test "the run report captures preflight, summary, files, and validation",
       %{tmp_dir: dir} = ctx do
    table = unique_name("reported")
    typed_csv!(dir, table)

    %{run: run} = run_import(dir, ctx)
    assert run.status == :completed

    report = run |> Report.path() |> File.read!() |> JSON.decode!()

    assert report["run"]["id"] == run.id
    assert report["run"]["status"] == "completed"
    assert report["run"]["adapter"] == Atom.to_string(ctx.db_adapter)

    assert Enum.map(report["preflight"], & &1["id"]) ==
             ~w(source_dir artifacts_dir database permissions)

    assert Enum.all?(report["preflight"], &(&1["status"] in ~w(passed skipped warning)))

    assert report["summary"]["files_total"] == 1
    assert report["summary"]["rows_inserted"] == 3

    assert [file_entry] = report["files"]
    assert file_entry["table"] == table
    assert file_entry["status"] == "done"
    assert file_entry["encoding"] == "utf8"
    assert file_entry["delimiter"] == "comma"
    assert file_entry["ledger"]["rows_inserted"] == 3
    assert Enum.map(file_entry["validation"], & &1["layer"]) == ~w(ledger counts fingerprints)
  end

  test "a failing preflight blocks the run with a clear error", %{tmp_dir: dir} = ctx do
    csv!(dir, unique_name("never") <> ".csv", [~w(id), ["1"]])

    missing_db_url =
      case ctx.db_adapter do
        :postgres -> String.replace(ctx.db_url, ~r{/[^/?]+(\?|$)}, "/csv2sql_no_such_db\\1")
        # MySQL auto-creates databases — force failure via bad credentials.
        :mysql -> String.replace(ctx.db_url, "root:mysql@", "nobody:wrongpass@")
      end

    %{run: run, events: events} = run_import(dir, ctx, %{db: %{url: missing_db_url}})

    assert run.status == :failed
    assert run.error.reason == "preflight_failed"
    assert Enum.any?(run.preflight, &(&1.id == :database and &1.status == :failed))
    assert_event(events, %Events.RunFailed{})
    assert_event(events, %Events.PreflightCheck{check: %{id: :database, status: :failed}})

    # The report still exists for the failed run.
    report = run |> Report.path() |> File.read!() |> JSON.decode!()
    assert report["run"]["status"] == "failed"
  end

  defp adapter_and_db(ctx) do
    db = %Db{adapter: ctx.db_adapter, url: ctx.db_url}
    adapter = if ctx.db_adapter == :postgres, do: Postgres, else: MySql
    {adapter, db}
  end

  defp with_conn(%Db{} = db, fun) do
    opts = Db.conn_opts(db) ++ [pool_size: 1]

    {:ok, conn} =
      case db.adapter do
        :postgres -> Postgrex.start_link(opts)
        :mysql -> MyXQL.start_link(opts)
      end

    try do
      fun.(conn)
    after
      GenServer.stop(conn)
    end
  end
end

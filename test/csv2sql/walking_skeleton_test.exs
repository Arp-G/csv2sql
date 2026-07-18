defmodule Csv2sql.WalkingSkeletonTest do
  use Csv2sql.EngineCase, async: true, parameterize: Csv2sql.EngineCase.db_parameters()

  alias Csv2sql.Validate.Ledger

  @moduletag :db

  describe "full import" do
    test "imports multiple CSVs with inferred types, balanced ledgers, and ordered events",
         %{tmp_dir: dir} = ctx do
      users = unique_name("users")
      orders = unique_name("orders")

      csv!(dir, users <> ".csv", [
        ~w(id name age),
        ["1", "Alice", "34"],
        ["2", "Bob", ""],
        ["3", "Zoé", "29"]
      ])

      csv!(dir, orders <> ".csv", [
        ~w(id total note),
        ["10", "9.99", "first order"],
        ["11", "120.5", "big, quoted\norder"]
      ])

      %{run: run, events: events} = run_import(dir, ctx)

      assert run.status == :completed
      assert run.summary.files_total == 2
      assert run.summary.files_failed == 0
      assert run.summary.rows_read == 5
      assert run.summary.rows_inserted == 5
      assert run.summary.rows_rejected == 0

      files = Run.files_in_order(run)
      assert Enum.all?(files, &(&1.status == :done))
      assert Enum.all?(files, &Ledger.balanced?(&1.ledger))

      users_file = Enum.find(files, &(&1.table_name == users))
      assert users_file.row_count == 3

      assert [
               %{name: "id", type: :integer},
               %{name: "name", type: :varchar},
               %{name: "age", type: :integer}
             ] = users_file.columns

      orders_file = Enum.find(files, &(&1.table_name == orders))
      assert [%{type: :integer}, %{type: :float}, %{type: :varchar}] = orders_file.columns

      # Events: lifecycle order + per-file completeness.
      assert %Events.RunStarted{file_count: 2} = hd(events)
      assert %Events.RunCompleted{} = List.last(events)
      assert_event(events, %Events.AnalyzeStarted{path: path} when path == users_file.path)
      assert_event(events, %Events.AnalyzeCompleted{row_count: 3})
      assert_event(events, %Events.SchemaCreated{table: table} when table == users)
      assert_event(events, %Events.LoadProgress{rows_inserted: n} when n > 0)
      assert_event(events, %Events.FileCompleted{path: path} when path == orders_file.path)

      # Database truth: counts, types, and values.
      assert db_query!(ctx, ~s{SELECT COUNT(*) FROM "#{users}"}) == [[3]]

      assert db_query!(
               ctx,
               "SELECT data_type FROM information_schema.columns " <>
                 "WHERE table_name = $1 ORDER BY ordinal_position",
               [users]
             ) == [["integer"], ["character varying"], ["integer"]]

      assert db_query!(ctx, ~s(SELECT name, age FROM "#{users}" ORDER BY id)) ==
               [["Alice", 34], ["Bob", nil], ["Zoé", 29]]

      assert db_query!(ctx, ~s(SELECT total FROM "#{orders}" ORDER BY id)) == [[9.99], [120.5]]
    end

    test "header-only and unicode files import cleanly", %{tmp_dir: dir} = ctx do
      empty_table = unique_name("header_only")
      csv!(dir, empty_table <> ".csv", [~w(a b c)])

      %{run: run} = run_import(dir, ctx)

      assert run.status == :completed
      [file] = Run.files_in_order(run)
      assert file.status == :done
      assert file.row_count == 0
      assert file.ledger.rows_read == 0
      assert db_query!(ctx, ~s{SELECT COUNT(*) FROM "#{empty_table}"}) == [[0]]
    end
  end

  describe "isolation and failure" do
    test "a malformed file fails alone; siblings import", %{tmp_dir: dir} = ctx do
      good = unique_name("good")
      bad = unique_name("bad")

      csv!(dir, good <> ".csv", [~w(id), ["1"], ["2"]])
      File.write!(Path.join(dir, bad <> ".csv"), ~s(id,name\n"unclosed,1\n2,ok\n))

      %{run: run, events: events} = run_import(dir, ctx)

      assert run.status == :completed_with_errors
      files = Run.files_in_order(run)

      good_file = Enum.find(files, &(&1.table_name == good))
      bad_file = Enum.find(files, &(&1.table_name == bad))

      assert good_file.status == :done
      assert bad_file.status == :failed
      assert [%{stage: :parse, class: :file}] = bad_file.errors

      assert_event(events, %Events.FileFailed{path: path} when path == bad_file.path)
      assert db_query!(ctx, ~s{SELECT COUNT(*) FROM "#{good}"}) == [[2]]
    end

    test "an empty (zero-byte) file fails with a clear reason", %{tmp_dir: dir} = ctx do
      File.write!(Path.join(dir, unique_name("empty") <> ".csv"), "")

      %{run: run} = run_import(dir, ctx)

      assert run.status == :completed_with_errors
      [file] = Run.files_in_order(run)
      assert file.status == :failed
      assert [%{reason: "empty_file"}] = file.errors
    end
  end

  describe "analyze mode (dry run)" do
    test "infers schemas without touching the database", %{tmp_dir: dir} = ctx do
      table = unique_name("dry")
      csv!(dir, table <> ".csv", [~w(id note), ["1", "x"]])

      %{run: run, events: events} = run_import(dir, ctx, %{mode: :analyze})

      assert run.status == :completed
      [file] = Run.files_in_order(run)
      assert file.status == :done
      assert file.row_count == 1
      assert [%{type: :integer}, %{type: :varchar}] = file.columns

      refute Enum.any?(events, &match?(%Events.SchemaCreated{}, &1))

      assert db_query!(
               ctx,
               "SELECT COUNT(*) FROM information_schema.tables WHERE table_name = $1",
               [table]
             ) == [[0]]
    end
  end

  describe "concurrency" do
    test "two runs execute concurrently and independently", %{tmp_dir: dir} = ctx do
      dir_a = Path.join(dir, "a")
      dir_b = Path.join(dir, "b")
      File.mkdir_p!(dir_a)
      File.mkdir_p!(dir_b)

      table_a = unique_name("run_a")
      table_b = unique_name("run_b")
      csv!(dir_a, table_a <> ".csv", [~w(id), ["1"], ["2"]])
      csv!(dir_b, table_b <> ".csv", [~w(id), ["1"], ["2"], ["3"]])

      {:ok, run_a} = Csv2sql.start_run(build_config(dir_a, ctx))
      {:ok, run_b} = Csv2sql.start_run(build_config(dir_b, ctx))

      assert {:ok, %Run{status: :completed} = state_a} = Csv2sql.await(run_a)
      assert {:ok, %Run{status: :completed} = state_b} = Csv2sql.await(run_b)

      register_table_cleanup(state_a)
      register_table_cleanup(state_b)

      assert db_query!(ctx, ~s{SELECT COUNT(*) FROM "#{table_a}"}) == [[2]]
      assert db_query!(ctx, ~s{SELECT COUNT(*) FROM "#{table_b}"}) == [[3]]
    end

    @tag timeout: 120_000
    test "cancellation stops a run mid-load and tears the tree down", %{tmp_dir: dir} = ctx do
      table = unique_name("cancel_me")

      rows = for i <- 1..150_000, do: [Integer.to_string(i), "payload_#{i}"]
      csv!(dir, table <> ".csv", [~w(id payload) | rows])

      config = build_config(dir, ctx, %{insert_workers: 1, insert_chunk_rows: 500})
      {:ok, run_id} = Csv2sql.start_run(config, subscribe: true)

      # Wait until data is actually flowing, then cancel.
      assert_receive %Events.LoadProgress{run_id: ^run_id}, 30_000
      assert :ok = Csv2sql.cancel_run(run_id)

      assert_receive %Events.RunCancelled{run_id: ^run_id}, 5_000
      {:ok, run} = Csv2sql.run_state(run_id)
      assert run.status == :cancelled

      # The core (pool + tasks + pipeline) must be gone shortly after.
      wait_until(fn -> Run.whereis(Run.core_name(run_id)) == nil end)

      on_exit(fn ->
        db_query!(ctx, ~s(DROP TABLE IF EXISTS "#{table}"))
      end)
    end
  end

  defp wait_until(fun, attempts \\ 50) do
    cond do
      fun.() ->
        :ok

      attempts == 0 ->
        flunk("condition not met in time")

      true ->
        Process.sleep(20)
        wait_until(fun, attempts - 1)
    end
  end
end

defmodule Csv2sqlWeb.RunLiveTest do
  use Csv2sqlWeb.ConnCase, async: true

  import Csv2sql.EngineCase,
    only: [csv!: 3, unique_name: 1, test_db_url: 1, register_table_cleanup: 1]

  import Csv2sqlWeb.UiHelpers
  import Phoenix.LiveViewTest

  alias Csv2sql.Config

  @moduletag :db
  @moduletag :tmp_dir
  @moduletag timeout: 120_000

  defp start_run!(dir, rows, overrides) do
    table = unique_name("ui_run")
    data = for i <- 1..rows, do: [Integer.to_string(i), "payload_#{i}"]
    csv!(dir, table <> ".csv", [~w(id payload) | data])

    params =
      Map.merge(
        %{
          source_dir: dir,
          db: %{adapter: :postgres, url: test_db_url(:postgres), pool_size: 2}
        },
        overrides
      )

    {:ok, config} = Config.new(params)
    {:ok, run_id} = Csv2sql.start_run(config)
    {run_id, table}
  end

  test "attaches mid-run; the run outlives the view; re-attach shows the result",
       %{conn: conn, tmp_dir: dir} do
    {run_id, table} = start_run!(dir, 40_000, %{insert_workers: 1, insert_chunk_rows: 400})

    {:ok, view, _html} = live(conn, ~p"/runs/#{run_id}")
    assert_eventually(fn -> render(view) =~ table end)
    assert has_element?(view, "[data-role=run-status]")

    # Kill the LiveView entirely — the run must not care.
    GenServer.stop(view.pid)

    {:ok, run} = Csv2sql.await(run_id)
    assert run.status == :completed
    register_table_cleanup(run)

    # Fresh attach after completion: snapshot renders the final state.
    {:ok, view2, _html} = live(conn, ~p"/runs/#{run_id}")
    assert_eventually(fn -> render(view2) =~ "completed" end)

    assert has_element?(view2, "[data-role=run-status][data-status=completed]")
    assert has_element?(view2, "[data-role=summary]")

    assert has_element?(
             view2,
             "[data-role=validation-pill][data-layer=fingerprints][data-status=passed]"
           )

    assert has_element?(view2, "[data-role=report-link]")

    assert has_element?(
             view2,
             "[data-role=preflight-check][data-check=database][data-status=passed]"
           )

    # Expanding a file surfaces the per-layer validation detail.
    view2 |> element("[data-role=expand-file]") |> render_click()
    assert has_element?(view2, "[data-role=validation-detail]")
    assert render(view2) =~ "column(s) match"
  end

  test "cancel stops the run from the UI", %{conn: conn, tmp_dir: dir} do
    {run_id, _table} = start_run!(dir, 150_000, %{insert_workers: 1, insert_chunk_rows: 300})

    {:ok, view, _html} = live(conn, ~p"/runs/#{run_id}")
    assert_eventually(fn -> has_element?(view, "[data-role=cancel]") end)

    view |> element("[data-role=cancel]") |> render_click()

    assert_eventually(fn -> render(view) =~ "cancelled" end)
    {:ok, run} = Csv2sql.run_state(run_id)
    assert run.status == :cancelled
    register_table_cleanup(run)
  end

  test "search and status filters narrow the file table", %{conn: conn, tmp_dir: dir} do
    good = unique_name("aa_clean")
    bad = unique_name("zz_broken")
    csv!(dir, good <> ".csv", [~w(id), ["1"], ["2"]])
    File.write!(Path.join(dir, bad <> ".csv"), ~s(id\n"unclosed\n))

    {:ok, config} =
      Config.new(%{
        source_dir: dir,
        db: %{adapter: :postgres, url: test_db_url(:postgres), pool_size: 2}
      })

    {:ok, run_id} = Csv2sql.start_run(config)
    {:ok, run} = Csv2sql.await(run_id)
    assert run.status == :completed_with_errors
    register_table_cleanup(run)

    {:ok, view, _html} = live(conn, ~p"/runs/#{run_id}")
    assert_eventually(fn -> render(view) =~ good end)

    filtered =
      view
      |> element("form[phx-change=filter]")
      |> render_change(%{q: "zz_", status: "all", sort: "name"})

    assert filtered =~ bad
    refute filtered =~ good <> ".csv"

    by_status =
      view
      |> element("form[phx-change=filter]")
      |> render_change(%{q: "", status: "failed", sort: "name"})

    assert by_status =~ bad
    refute by_status =~ good <> ".csv"
  end

  test "a vanished run redirects home with an explanation", %{conn: conn} do
    assert {:error, {:live_redirect, %{to: "/"}}} = live(conn, ~p"/runs/nope123")
  end

  test "the file table windows huge directories", %{conn: conn, tmp_dir: dir} do
    for i <- 1..205 do
      name = "bulk_" <> String.pad_leading(Integer.to_string(i), 3, "0")
      csv!(dir, name <> ".csv", [~w(id), ["1"]])
    end

    # Analyze mode needs no database — inference only, so 205 files stay fast.
    {:ok, config} = Config.new(%{mode: :analyze, source_dir: dir})
    {:ok, run_id} = Csv2sql.start_run(config)
    {:ok, run} = Csv2sql.await(run_id)
    assert run.status == :completed

    {:ok, view, _html} = live(conn, ~p"/runs/#{run_id}")
    assert_eventually(fn -> render(view) =~ "bulk_001" end)

    assert count_file_rows(render(view)) == 200
    assert render(element(view, "[data-role=files-window-notice]")) =~ "200 of 205"

    # Narrowing below the cap shows everything and drops the notice.
    narrowed =
      view
      |> element("form[phx-change=filter]")
      |> render_change(%{q: "bulk_20", status: "all", sort: "name"})

    assert count_file_rows(narrowed) == 6
    refute narrowed =~ "files-window-notice"
  end

  defp count_file_rows(html) do
    length(String.split(html, ~s(data-role="file-row"))) - 1
  end

  test "analyze → edit schema → import with overrides", %{conn: conn, tmp_dir: dir} do
    file = unique_name("editable")
    target = unique_name("edited_target")

    csv!(dir, file <> ".csv", [
      ~w(id secret age),
      ["1", "classified", "34"],
      ["2", "hidden", "29"]
    ])

    {:ok, config} =
      Config.new(%{
        mode: :analyze,
        source_dir: dir,
        db: %{adapter: :postgres, url: test_db_url(:postgres), pool_size: 2}
      })

    {:ok, analyze_id} = Csv2sql.start_run(config)
    {:ok, analyze_run} = Csv2sql.await(analyze_id)
    assert analyze_run.status == :completed

    {:ok, view, _html} = live(conn, ~p"/runs/#{analyze_id}")

    # Open the editor: sample rows + inferred schema appear.
    view |> element("[data-role=expand-file]", file) |> render_click()
    assert has_element?(view, "[data-role=editor-card]")
    assert has_element?(view, "[data-role=sample-table]")
    assert render(view) =~ "classified"

    # Rename the table, drop the "secret" column, widen age to bigint.
    view
    |> element("#override-form")
    |> render_change(%{
      "override" => %{
        "include" => "true",
        "table_name" => target,
        "columns" => %{
          "0" => %{"include" => "true", "name" => "id", "type" => "integer", "length" => ""},
          "1" => %{"include" => "false", "name" => "secret", "type" => "varchar", "length" => ""},
          "2" => %{"include" => "true", "name" => "age", "type" => "bigint", "length" => ""}
        }
      }
    })

    {:error, {:live_redirect, %{to: to}}} =
      view |> element("[data-role=reimport]") |> render_click()

    assert "/runs/" <> import_id = to
    {:ok, import_run} = Csv2sql.await(import_id)
    assert import_run.status == :completed
    register_table_cleanup(import_run)

    [imported] = Csv2sql.Run.files_in_order(import_run)
    assert imported.table_name == target
    assert Enum.map(imported.columns, &{&1.name, &1.type}) == [{"id", :integer}, {"age", :bigint}]

    ctx = %{db_adapter: :postgres, db_url: test_db_url(:postgres)}
    assert Csv2sql.EngineCase.column_types!(ctx, target) == [:integer, :bigint]
    assert Csv2sql.EngineCase.select!(ctx, target, ~w(age), "id") == [[34], [29]]
  end
end

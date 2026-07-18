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

  defp start_run!(dir, rows, overrides \\ %{}) do
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
end

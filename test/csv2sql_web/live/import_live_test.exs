defmodule Csv2sqlWeb.ImportLiveTest do
  use Csv2sqlWeb.ConnCase, async: true

  import Csv2sql.EngineCase,
    only: [csv!: 3, unique_name: 1, test_db_url: 1, register_table_cleanup: 1]

  import Phoenix.LiveViewTest

  @moduletag :db
  @moduletag :tmp_dir

  test "renders the workspace and validates config live", %{conn: conn} do
    {:ok, view, html} = live(conn, ~p"/")

    assert html =~ "New import"
    assert has_element?(view, "[data-role=setup-card]")

    invalid =
      view
      |> form("#config-form",
        config: %{source_dir: "/definitely/not/here", db: %{url: "foo://x/y"}}
      )
      |> render_change()

    assert invalid =~ "is not an existing directory"
    assert invalid =~ "must start with postgres:// or mysql://"
  end

  # The drawer is server-driven: a native <details> loses its client-side
  # open state on every form-change patch (it collapsed while typing).
  test "advanced drawer stays open across form changes", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/")

    assert has_element?(view, "[data-role=advanced-settings].hidden")

    view |> element("[data-role=advanced-toggle]") |> render_click()
    refute has_element?(view, "[data-role=advanced-settings].hidden")

    view
    |> form("#config-form", config: %{varchar_limit: "150"})
    |> render_change()

    refute has_element?(view, "[data-role=advanced-settings].hidden")
  end

  # Clicked with no payload on purpose: a browser button click carries no
  # form data, so the handler must probe from the tracked params.
  test "test connection probes the database from the current form", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/")

    # Empty URL: instant validation error, no async work.
    assert view |> element("[data-role=probe-button]") |> render_click() =~
             "fix the database URL first"

    view
    |> form("#config-form", config: %{db: %{url: test_db_url(:postgres)}})
    |> render_change()

    view |> element("[data-role=probe-button]") |> render_click()
    assert render_async(view, 15_000) =~ "Connection OK"
    assert has_element?(view, "[data-role=probe-ok]")
  end

  test "starting an import navigates to a detached run that completes",
       %{conn: conn, tmp_dir: dir} do
    table = unique_name("ui_users")
    csv!(dir, table <> ".csv", [~w(id name), ["1", "alice"], ["2", "bob"]])

    {:ok, view, _html} = live(conn, ~p"/")

    form =
      form(view, "#config-form", config: %{source_dir: dir, db: %{url: test_db_url(:postgres)}})

    {:error, {:live_redirect, %{to: to}}} = render_submit(form, %{config: %{mode: "import"}})
    assert "/runs/" <> run_id = to

    # The run belongs to the engine, not the LiveView that started it.
    {:ok, run} = Csv2sql.await(run_id)
    assert run.status == :completed
    register_table_cleanup(run)

    {:ok, _view, html} = live(conn, to)
    assert html =~ table
    assert html =~ "completed"
  end

  test "analyze mode dry-runs from the same form", %{conn: conn, tmp_dir: dir} do
    table = unique_name("ui_dry")
    csv!(dir, table <> ".csv", [~w(id), ["7"]])

    {:ok, view, _html} = live(conn, ~p"/")

    form =
      form(view, "#config-form", config: %{source_dir: dir, db: %{url: test_db_url(:postgres)}})

    {:error, {:live_redirect, %{to: to}}} = render_submit(form, %{config: %{mode: "analyze"}})
    assert "/runs/" <> run_id = to

    {:ok, run} = Csv2sql.await(run_id)
    assert run.status == :completed
    assert run.config.mode == :analyze
  end

  test "the runs list shows started runs with their status", %{conn: conn, tmp_dir: dir} do
    table = unique_name("ui_listed")
    csv!(dir, table <> ".csv", [~w(id), ["1"]])

    {:ok, config} =
      Csv2sql.Config.new(%{
        source_dir: dir,
        db: %{adapter: :postgres, url: test_db_url(:postgres), pool_size: 2}
      })

    {:ok, run_id} = Csv2sql.start_run(config)
    {:ok, run} = Csv2sql.await(run_id)
    register_table_cleanup(run)

    {:ok, view, _html} = live(conn, ~p"/")
    assert has_element?(view, "[data-role=runs-list]")
    assert has_element?(view, "[data-role=run-link]", run_id)
  end
end

defmodule Csv2sqlWeb.SettingsTest do
  # Persistence writes a shared (test-isolated) store file — not async.
  use Csv2sqlWeb.ConnCase, async: false

  import Phoenix.LiveViewTest

  alias Csv2sql.Config.Store

  setup do
    File.rm(Store.path())
    # Saved defaults leak into any later test that consults Sources
    # (e.g. the CLI's "missing db exits 3") — leave the store empty.
    on_exit(fn -> File.rm(Store.path()) end)
    :ok
  end

  test "advanced settings validate live", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/")

    html =
      view
      |> form("#config-form", config: %{varchar_limit: "0", date_patterns: ["{NOPE}"]})
      |> render_change()

    assert html =~ "must be greater than 0"
    assert html =~ "invalid pattern {NOPE}"
  end

  test "pattern editor adds/removes rows and tests samples live", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/")

    # Config defaults render as the initial rows.
    assert has_element?(view, "[data-role=date_patterns-input][value='{YYYY}-{0M}-{0D}']")

    # Sole row has no remove button; adding a second row enables it.
    refute has_element?(view, "[data-role=remove-date_patterns]")
    view |> element("[data-role=add-date_patterns]") |> render_click()
    assert has_element?(view, "[data-role=remove-date_patterns]")

    # Fill the new row and try a sample that only it can parse. The
    # trial input rides along in the same form payload, like a browser.
    html =
      view
      |> form("#config-form", %{
        config: %{date_patterns: ["{YYYY}-{0M}-{0D}", "{D}/{M}/{YYYY}"]},
        pattern_trial: "31/12/2023"
      })
      |> render_change()

    assert html =~ "matches date pattern #2"
    assert html =~ "2023-12-31"

    assert has_element?(
             view,
             "[data-role=date_patterns-input].input-success[value='{D}/{M}/{YYYY}']"
           )

    # A sample nothing parses says so.
    html =
      view
      |> form("#config-form", %{pattern_trial: "not a date"})
      |> render_change()

    assert html =~ "no pattern matches"

    # Removing the extra row leaves the default alone.
    view
    |> element("[data-role=remove-date_patterns][phx-value-index='1']")
    |> render_click()

    refute has_element?(view, "[data-role=date_patterns-input][value='{D}/{M}/{YYYY}']")
  end

  test "save as default persists (without the DB password) and reloads", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/")

    view
    |> form("#config-form",
      config: %{
        source_dir: "/data/csvs",
        varchar_limit: "150",
        db: %{url: "postgres://alice:supersecret@dbhost:5432/warehouse"}
      }
    )
    |> render_change()

    assert view |> element("[data-role=save-defaults]") |> render_click() =~ "Saved as defaults"

    stored = Store.load()
    assert stored["source_dir"] == "/data/csvs"
    assert stored["varchar_limit"] == "150"
    assert stored["db"]["url"] == "postgres://alice@dbhost:5432/warehouse"
    refute Store.path() |> File.read!() =~ "supersecret"

    # A fresh mount is prefilled from the persisted defaults.
    {:ok, _view, html} = live(conn, ~p"/")
    assert html =~ "/data/csvs"
    assert html =~ "postgres://alice@dbhost:5432/warehouse"
  end
end

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
      |> form("#config-form", config: %{varchar_limit: "0", date_patterns: "{NOPE}"})
      |> render_change()

    assert html =~ "must be greater than 0"
    assert html =~ "invalid pattern {NOPE}"
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

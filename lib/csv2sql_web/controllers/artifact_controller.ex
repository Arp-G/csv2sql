defmodule Csv2sqlWeb.ArtifactController do
  @moduledoc """
  Downloads a run's artifacts (report, schema.sql) while its state is
  still in memory. After teardown the files remain under
  `<source>/csv2sql_runs/<run_id>/` on disk.
  """

  use Csv2sqlWeb, :controller

  alias Csv2sql.Run.Artifacts
  alias Csv2sql.Run.Report

  def download(conn, %{"id" => run_id, "kind" => kind}) when kind in ["report", "schema"] do
    with {:ok, run} <- Csv2sql.run_state(run_id),
         path = artifact_path(run, kind),
         true <- File.exists?(path) do
      send_download(conn, {:file, path})
    else
      _not_available ->
        conn
        |> put_status(:not_found)
        |> text("artifact not available (run may have been cleaned up — check csv2sql_runs/)")
    end
  end

  def download(conn, _params) do
    conn |> put_status(:not_found) |> text("unknown artifact")
  end

  defp artifact_path(run, "report"), do: Report.path(run)

  defp artifact_path(run, "schema"),
    do: run.config |> Artifacts.dir(run.id) |> Artifacts.schema_path()
end

defmodule Csv2sql.Run.Report do
  @moduledoc """
  The machine-readable run report: `<artifacts>/run_report.json`.

  Written on every terminal transition (completed, failed, cancelled) —
  a cancelled or failed run still leaves an honest record of what
  happened. The UI's report view and the CLI's `--report` render from
  the same data.
  """

  alias Csv2sql.Run
  alias Csv2sql.Run.Artifacts

  @doc "The report path for a run."
  @spec path(Run.t()) :: Path.t()
  def path(%Run{} = run), do: run.config |> Artifacts.dir(run.id) |> Path.join("run_report.json")

  @doc "Builds the JSON-safe report map."
  @spec build(Run.t()) :: map()
  def build(%Run{} = run) do
    %{
      "run" => %{
        "id" => run.id,
        "status" => Atom.to_string(run.status),
        "mode" => Atom.to_string(run.config.mode),
        "adapter" => run.config.db && Atom.to_string(run.config.db.adapter),
        "source_dir" => run.config.source_dir,
        "started_at" => run.started_at && DateTime.to_iso8601(run.started_at),
        "finished_at" => run.finished_at && DateTime.to_iso8601(run.finished_at),
        "error" => run.error && error_map(run.error)
      },
      "preflight" =>
        Enum.map(run.preflight, fn check ->
          %{
            "id" => Atom.to_string(check.id),
            "status" => Atom.to_string(check.status),
            "detail" => check.detail
          }
        end),
      "summary" => summary_map(run.summary),
      "files" => run |> Run.files_in_order() |> Enum.map(&file_map/1)
    }
  end

  @doc "Writes the report (best-effort — reporting must never crash a run)."
  @spec write(Run.t()) :: :ok
  def write(%Run{} = run) do
    file = path(run)
    File.mkdir_p!(Path.dirname(file))
    File.write!(file, JSON.encode_to_iodata!(build(run)))
    :ok
  rescue
    _exception -> :ok
  end

  defp summary_map(nil), do: nil

  defp summary_map(summary) do
    %{
      "files_total" => summary.files_total,
      "files_ok" => summary.files_ok,
      "files_failed" => summary.files_failed,
      "rows_read" => summary.rows_read,
      "rows_inserted" => summary.rows_inserted,
      "rows_rejected" => summary.rows_rejected,
      "duration_ms" => summary.duration_ms
    }
  end

  defp file_map(file) do
    %{
      "name" => file.name,
      "table" => file.table_name,
      "status" => Atom.to_string(file.status),
      "size" => file.size,
      "row_count" => file.row_count,
      "encoding" => file.encoding && Atom.to_string(file.encoding),
      "delimiter" => file.delimiter && Atom.to_string(file.delimiter),
      "timings" => Map.new(file.timings, fn {key, value} -> {Atom.to_string(key), value} end),
      "ledger" => file.ledger && ledger_map(file.ledger),
      "errors_csv" => file.errors_csv,
      "validation" =>
        Enum.map(file.validation, fn outcome ->
          %{
            "layer" => Atom.to_string(outcome.layer),
            "status" => Atom.to_string(outcome.status),
            "detail" => outcome.detail
          }
        end),
      "errors" => Enum.map(file.errors, &error_map/1)
    }
  end

  defp ledger_map(ledger) do
    %{
      "rows_read" => ledger.rows_read,
      "rows_inserted" => ledger.rows_inserted,
      "rows_rejected" => ledger.rows_rejected,
      "chunks_ok" => ledger.chunks_ok,
      "chunks_isolated" => ledger.chunks_isolated,
      "retries" => ledger.retries
    }
  end

  defp error_map(error) do
    %{
      "stage" => error.stage && Atom.to_string(error.stage),
      "class" => error.class && Atom.to_string(error.class),
      "file" => error.file,
      "reason" => error.reason,
      "message" => error.message
    }
  end
end

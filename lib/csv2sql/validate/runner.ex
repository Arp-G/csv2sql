defmodule Csv2sql.Validate.Runner do
  @moduledoc """
  Runs the enabled validation layers for one file after its load.

  All layers are **report-only** — outcomes are recorded and broadcast,
  never failing the file:

    * `:ledger` — the in-run accounting invariant (always checked)
    * `:counts` — `COUNT(*)` vs baseline + inserted (append-aware)
    * `:fingerprints` — per-column aggregates vs one query per table;
      skipped in `:append` mode (pre-existing rows would pollute the
      database side)

  """

  alias Csv2sql.Config
  alias Csv2sql.File, as: CsvFile
  alias Csv2sql.Validate.Fingerprint
  alias Csv2sql.Validate.Ledger
  alias Csv2sql.Validate.Outcome

  @doc "Runs all enabled layers; returns outcomes in ladder order."
  @spec run(CsvFile.t(), [Fingerprint.acc()], non_neg_integer(), map()) :: [Outcome.t()]
  def run(%CsvFile{} = file, fingerprints, baseline, ctx) do
    validations = ctx.config.validations

    [ledger_outcome(file.ledger)] ++
      counts_outcome(file, baseline, validations, ctx) ++
      fingerprints_outcome(file, fingerprints, validations, ctx)
  end

  @doc """
  Compares stored fingerprints against the table's current aggregates —
  one query. Public so a completed import can be re-validated later.
  """
  @spec check_fingerprints(module(), term(), String.t(), [map()], [Fingerprint.acc()]) ::
          {:ok, boolean(), [map()]} | {:error, term()}
  def check_fingerprints(adapter, conn, table, columns, fingerprints) do
    exprs =
      columns
      |> Enum.flat_map(&Fingerprint.exprs(adapter, &1))
      |> Enum.map(fn {_key, sql} -> sql end)

    sql =
      IO.iodata_to_binary([
        "SELECT ",
        Enum.join(exprs, ", "),
        " FROM ",
        adapter.quote_ident(table)
      ])

    case adapter.query(conn, sql, []) do
      {:ok, %{rows: [values]}} ->
        {ok, results} = Fingerprint.compare(columns, fingerprints, values)
        {:ok, ok, results}

      {:error, error} ->
        {:error, error}
    end
  end

  defp ledger_outcome(%Ledger{} = ledger) do
    status = if Ledger.balanced?(ledger), do: :passed, else: :failed

    %Outcome{
      layer: :ledger,
      status: status,
      detail: %{
        "rows_read" => ledger.rows_read,
        "rows_inserted" => ledger.rows_inserted,
        "rows_rejected" => ledger.rows_rejected
      }
    }
  end

  defp counts_outcome(_file, _baseline, %{counts: false}, _ctx), do: []

  defp counts_outcome(file, baseline, _validations, ctx) do
    expected = baseline + file.ledger.rows_inserted

    case ctx.adapter.exact_count(ctx.conn, file.table_name) do
      {:ok, actual} ->
        status = if actual == expected, do: :passed, else: :failed

        [
          %Outcome{
            layer: :counts,
            status: status,
            detail: %{"expected" => expected, "actual" => actual, "baseline" => baseline}
          }
        ]

      {:error, error} ->
        [
          %Outcome{
            layer: :counts,
            status: :failed,
            detail: %{"error" => Exception.message(error)}
          }
        ]
    end
  end

  defp fingerprints_outcome(_file, _fps, %{fingerprints: false}, _ctx), do: []

  defp fingerprints_outcome(_file, _fps, _validations, %{config: %Config{table_mode: :append}}) do
    [
      %Outcome{
        layer: :fingerprints,
        status: :skipped,
        detail: %{"reason" => "append mode: pre-existing rows would pollute the aggregates"}
      }
    ]
  end

  defp fingerprints_outcome(file, fingerprints, _validations, ctx) do
    case check_fingerprints(ctx.adapter, ctx.conn, file.table_name, file.columns, fingerprints) do
      {:ok, ok, results} ->
        status = if ok, do: :passed, else: :failed

        [
          %Outcome{
            layer: :fingerprints,
            status: status,
            detail: %{"columns" => results_json(results)}
          }
        ]

      {:error, error} ->
        [
          %Outcome{
            layer: :fingerprints,
            status: :failed,
            detail: %{"error" => Exception.message(error)}
          }
        ]
    end
  end

  defp results_json(results) do
    Enum.map(results, fn %{column: column, ok: ok, checks: checks} ->
      %{"column" => column, "ok" => ok, "checks" => stringify_keys(checks)}
    end)
  end

  defp stringify_keys(checks) do
    Map.new(checks, fn {key, value} -> {Atom.to_string(key), value} end)
  end
end

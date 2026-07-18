defmodule Csv2sql.Cli.Reporter do
  @moduledoc """
  Line-based terminal rendering of a run — one more subscriber of the
  same event bus the UI uses. Consumes events until the terminal one,
  prints the summary (and, for analyze mode, the inferred schemas), and
  returns the exit code.
  """

  alias Csv2sql.Cli.SchemaTable
  alias Csv2sql.Events
  alias Csv2sql.Run
  alias Csv2sql.Run.Report

  @doc "Consumes a subscribed run's events; returns the exit code."
  @spec consume(String.t(), :import | :analyze) :: non_neg_integer()
  def consume(run_id, mode) do
    loop(run_id)

    case Csv2sql.run_state(run_id) do
      {:ok, run} ->
        if mode == :analyze, do: SchemaTable.print(run)
        print_summary(run)
        exit_code(run)

      {:error, :not_found} ->
        IO.puts(:stderr, "run state unavailable")
        2
    end
  end

  defp loop(run_id) do
    receive do
      %{run_id: ^run_id} = event ->
        render(event)
        if is_struct(event) and Events.terminal?(event), do: :done, else: loop(run_id)
    after
      :timer.hours(24) -> :timeout
    end
  end

  defp render(%Events.PreflightCheck{check: check}) do
    icon =
      case check.status do
        :passed -> "•"
        :skipped -> "-"
        :warning -> "!"
        :failed -> "✗"
      end

    IO.puts("#{icon} preflight #{check.id}: #{check.status} #{check.detail}")
  end

  defp render(%Events.RunStarted{file_count: count}), do: IO.puts("#{count} file(s) discovered")

  defp render(%Events.FileCompleted{} = event) do
    ledger = event.ledger

    rejected =
      if ledger.rows_rejected > 0, do: " (#{ledger.rows_rejected} rejected)", else: ""

    IO.puts("✓ #{Path.basename(event.path)} — #{ledger.rows_inserted} rows#{rejected}")
  end

  defp render(%Events.FileFailed{} = event) do
    IO.puts(:stderr, "✗ #{Path.basename(event.path)} — #{event.error.message}")
  end

  defp render(%Events.RowsRejected{} = event) do
    sample = List.first(event.sample_reasons) || ""
    IO.puts("! #{Path.basename(event.path)}: #{event.count} row(s) rejected — #{sample}")
  end

  defp render(%Events.RunFailed{error: error}),
    do: IO.puts(:stderr, "run failed: #{error.message}")

  defp render(_other), do: :ok

  defp print_summary(%Run{summary: nil}), do: :ok

  defp print_summary(%Run{summary: summary} = run) do
    IO.puts("""

    #{run.status} in #{summary.duration_ms} ms — \
    #{summary.files_ok}/#{summary.files_total} file(s), \
    #{summary.rows_inserted} row(s) inserted, #{summary.rows_rejected} rejected\
    """)

    IO.puts("report: #{Report.path(run)}")
  end

  defp exit_code(%Run{status: :completed} = run) do
    if run.summary && run.summary.rows_rejected > 0, do: 1, else: 0
  end

  defp exit_code(%Run{status: :completed_with_errors}), do: 1
  defp exit_code(%Run{}), do: 2
end

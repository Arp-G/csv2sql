defmodule Csv2sql.Run.Summary do
  @moduledoc """
  Aggregated outcome of a run — the payload of the `RunCompleted` event
  and the head of `run_report.json`.
  """

  use Ecto.Schema

  alias Csv2sql.Validate.Ledger

  @primary_key false
  embedded_schema do
    field(:files_total, :integer, default: 0)
    field(:files_ok, :integer, default: 0)
    field(:files_failed, :integer, default: 0)
    field(:rows_read, :integer, default: 0)
    field(:rows_inserted, :integer, default: 0)
    field(:rows_rejected, :integer, default: 0)
    field(:duration_ms, :integer, default: 0)
  end

  @type t :: %__MODULE__{
          files_total: non_neg_integer(),
          files_ok: non_neg_integer(),
          files_failed: non_neg_integer(),
          rows_read: non_neg_integer(),
          rows_inserted: non_neg_integer(),
          rows_rejected: non_neg_integer(),
          duration_ms: non_neg_integer()
        }

  @doc "Builds a summary from final per-file states."
  @spec build([Csv2sql.File.t()], non_neg_integer()) :: t()
  def build(files, duration_ms) when is_list(files) do
    ledger =
      files
      |> Enum.map(&(&1.ledger || Ledger.new()))
      |> Enum.reduce(Ledger.new(), &Ledger.merge/2)

    %__MODULE__{
      files_total: length(files),
      files_ok: Enum.count(files, &(&1.status == :done)),
      files_failed: Enum.count(files, &(&1.status == :failed)),
      rows_read: ledger.rows_read,
      rows_inserted: ledger.rows_inserted,
      rows_rejected: ledger.rows_rejected,
      duration_ms: duration_ms
    }
  end
end

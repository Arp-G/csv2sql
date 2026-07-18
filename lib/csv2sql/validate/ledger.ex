defmodule Csv2sql.Validate.Ledger do
  @moduledoc """
  The always-on validation layer: double-entry row accounting.

  Every chunk contributes `rows_read = rows_inserted + rows_rejected`,
  with the inserted count taken from the database driver's result —
  never assumed. A ledger that doesn't balance pinpoints loss the moment
  it happens, without any post-hoc queries.
  """

  use Ecto.Schema

  @primary_key false
  embedded_schema do
    field(:rows_read, :integer, default: 0)
    field(:rows_inserted, :integer, default: 0)
    field(:rows_rejected, :integer, default: 0)
    field(:chunks_ok, :integer, default: 0)
    field(:chunks_isolated, :integer, default: 0)
    field(:retries, :integer, default: 0)
  end

  @type t :: %__MODULE__{
          rows_read: non_neg_integer(),
          rows_inserted: non_neg_integer(),
          rows_rejected: non_neg_integer(),
          chunks_ok: non_neg_integer(),
          chunks_isolated: non_neg_integer(),
          retries: non_neg_integer()
        }

  @spec new() :: t()
  def new, do: %__MODULE__{}

  @doc """
  Merges two ledgers by summing every counter.

  Merging is associative and commutative, so per-chunk deltas can be
  folded in any completion order.

  ## Examples

      iex> alias Csv2sql.Validate.Ledger
      iex> Ledger.merge(
      ...>   %Ledger{rows_read: 10, rows_inserted: 9, rows_rejected: 1, chunks_ok: 1},
      ...>   %Ledger{rows_read: 5, rows_inserted: 5, chunks_ok: 1}
      ...> )
      %Ledger{rows_read: 15, rows_inserted: 14, rows_rejected: 1, chunks_ok: 2}

  """
  @spec merge(t(), t()) :: t()
  def merge(%__MODULE__{} = a, %__MODULE__{} = b) do
    %__MODULE__{
      rows_read: a.rows_read + b.rows_read,
      rows_inserted: a.rows_inserted + b.rows_inserted,
      rows_rejected: a.rows_rejected + b.rows_rejected,
      chunks_ok: a.chunks_ok + b.chunks_ok,
      chunks_isolated: a.chunks_isolated + b.chunks_isolated,
      retries: a.retries + b.retries
    }
  end

  @doc """
  Whether the ledger's core invariant holds.

  ## Examples

      iex> alias Csv2sql.Validate.Ledger
      iex> Ledger.balanced?(%Ledger{rows_read: 10, rows_inserted: 9, rows_rejected: 1})
      true
      iex> Ledger.balanced?(%Ledger{rows_read: 10, rows_inserted: 8, rows_rejected: 1})
      false

  """
  @spec balanced?(t()) :: boolean()
  def balanced?(%__MODULE__{} = ledger) do
    ledger.rows_read == ledger.rows_inserted + ledger.rows_rejected
  end
end

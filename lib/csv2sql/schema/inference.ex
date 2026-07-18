defmodule Csv2sql.Schema.Inference do
  @moduledoc """
  Single-pass, chunked, parallel type inference.

  Each chunk of rows is folded into a small per-column accumulator; chunk
  accumulators merge with an **associative** function (AND the type flags,
  max the lengths, min/max the integer bounds), so chunks can be processed
  in any order in parallel and the whole file never sits in memory.

  Tracked per column: empty / boolean / integer / float / date / datetime
  flags, max character length, max byte length, and integer bounds.
  Date/datetime checks use the run's compiled patterns
  (`Csv2sql.TimeParse`) and are skipped as soon as the flag is falsified —
  the expensive checks run only while a column still qualifies.
  """

  alias Csv2sql.Schema.TypeCheck
  alias Csv2sql.TimeParse

  @typedoc "Compiled date/datetime patterns used for the flag checks."
  @type checkers :: %{date: [TimeParse.compiled()], datetime: [TimeParse.compiled()]}

  @typedoc "Per-column inference accumulator."
  @type column_acc :: %{
          empty: boolean(),
          boolean: boolean(),
          integer: boolean(),
          float: boolean(),
          date: boolean(),
          datetime: boolean(),
          max_length: non_neg_integer(),
          max_bytes: non_neg_integer(),
          int_min: integer() | nil,
          int_max: integer() | nil
        }

  @type acc :: %{row_count: non_neg_integer(), columns: [column_acc()]}

  @no_checkers %{date: [], datetime: []}

  @doc "A fresh accumulator for `column_count` columns."
  @spec new(non_neg_integer()) :: acc()
  def new(column_count) do
    %{row_count: 0, columns: List.duplicate(new_column(), column_count)}
  end

  @doc "Folds a chunk of rows into a fresh accumulator."
  @spec chunk_stats([[String.t()]], non_neg_integer(), checkers()) :: acc()
  def chunk_stats(rows, column_count, checkers \\ @no_checkers) do
    Enum.reduce(rows, new(column_count), &add_row(&2, &1, checkers))
  end

  @doc "Adds one row to an accumulator."
  @spec add_row(acc(), [String.t()], checkers()) :: acc()
  def add_row(%{row_count: count, columns: columns} = acc, row, checkers \\ @no_checkers) do
    %{acc | row_count: count + 1, columns: add_values(columns, row, checkers)}
  end

  @doc """
  Merges two accumulators (associative and commutative).

  ## Examples

      iex> alias Csv2sql.Schema.Inference
      iex> a = Inference.chunk_stats([["1", "x"]], 2)
      iex> b = Inference.chunk_stats([["999", "hello"]], 2)
      iex> merged = Inference.merge(a, b)
      iex> merged.row_count
      2
      iex> [first, second] = merged.columns
      iex> {first.integer, first.int_max, second.integer, second.max_length}
      {true, 999, false, 5}

  """
  @spec merge(acc(), acc()) :: acc()
  def merge(%{columns: a_cols} = a, %{columns: b_cols} = b) do
    %{
      row_count: a.row_count + b.row_count,
      columns: Enum.zip_with(a_cols, b_cols, &merge_column/2)
    }
  end

  defp new_column do
    %{
      empty: true,
      boolean: true,
      integer: true,
      float: true,
      date: true,
      datetime: true,
      max_length: 0,
      max_bytes: 0,
      int_min: nil,
      int_max: nil
    }
  end

  defp add_values(columns, row, checkers) do
    values = pad_row(row, length(columns))
    Enum.zip_with(columns, values, &add_value(&1, &2, checkers))
  end

  # Rows shorter than the header are padded with empty cells; extra cells
  # beyond the header are dropped. (Ragged-row *rejection* is a load-stage
  # concern; inference stays total.)
  defp pad_row(row, column_count) do
    case length(row) do
      ^column_count -> row
      shorter when shorter < column_count -> row ++ List.duplicate("", column_count - shorter)
      _longer -> Enum.take(row, column_count)
    end
  end

  defp add_value(acc, value, checkers) do
    case String.trim(value) do
      "" ->
        acc

      trimmed ->
        {integer?, int_min, int_max} = check_integer(acc, trimmed)

        %{
          empty: false,
          boolean: acc.boolean and match?({:ok, _}, TypeCheck.boolean(trimmed)),
          integer: integer?,
          float: acc.float and match?({:ok, _}, TypeCheck.float(trimmed)),
          date: acc.date and date_like?(trimmed, checkers.date, &TimeParse.date/2),
          datetime:
            acc.datetime and date_like?(trimmed, checkers.datetime, &TimeParse.datetime/2),
          max_length: max(acc.max_length, String.length(trimmed)),
          max_bytes: max(acc.max_bytes, byte_size(trimmed)),
          int_min: int_min,
          int_max: int_max
        }
    end
  end

  # All-zero dates keep the flag alive (they load as NULL) without
  # confirming anything on their own.
  defp date_like?(value, patterns, parse) do
    case parse.(value, patterns) do
      {:ok, _parsed} -> true
      :zero -> true
      :error -> false
    end
  end

  defp check_integer(%{integer: false} = acc, _trimmed), do: {false, acc.int_min, acc.int_max}

  defp check_integer(acc, trimmed) do
    case TypeCheck.integer(trimmed) do
      {:ok, int} -> {true, min_or(acc.int_min, int), max_or(acc.int_max, int)}
      :error -> {false, acc.int_min, acc.int_max}
    end
  end

  defp merge_column(a, b) do
    %{
      empty: a.empty and b.empty,
      boolean: a.boolean and b.boolean,
      integer: a.integer and b.integer,
      float: a.float and b.float,
      date: a.date and b.date,
      datetime: a.datetime and b.datetime,
      max_length: max(a.max_length, b.max_length),
      max_bytes: max(a.max_bytes, b.max_bytes),
      int_min: min_or(a.int_min, b.int_min),
      int_max: max_or(a.int_max, b.int_max)
    }
  end

  defp min_or(nil, value), do: value
  defp min_or(value, nil), do: value
  defp min_or(a, b), do: min(a, b)

  defp max_or(nil, value), do: value
  defp max_or(value, nil), do: value
  defp max_or(a, b), do: max(a, b)
end

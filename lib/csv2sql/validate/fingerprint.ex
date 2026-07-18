defmodule Csv2sql.Validate.Fingerprint do
  @moduledoc """
  Per-column aggregate statistics over the **post-transform values sent
  to the database** (inserted rows only) — the content-validation layer.

  Because the CSV side is measured *after* our own cleaning/casting,
  intentional transformations (whitespace→NULL, zero-dates→NULL, date
  normalization) are inside the fingerprint by construction: a mismatch
  against the database's aggregates means genuine storage-side
  divergence, never our own processing.

  Accumulators are O(1) per column and merge associatively, so chunks
  fold in any completion order. The database side is **one aggregate
  query per table**, built from portable ANSI SQL (MySQL 5.7 /
  PostgreSQL 12 safe).
  """

  alias Csv2sql.Schema.ColumnSpec

  @typedoc "Per-column accumulator."
  @type acc :: %{
          kind: :int | :float | :bool | :date | :datetime | :string,
          null_count: non_neg_integer(),
          min: term() | nil,
          max: term() | nil,
          sum: number() | nil,
          true_count: non_neg_integer() | nil,
          max_length: non_neg_integer() | nil,
          total_bytes: non_neg_integer() | nil
        }

  @float_tolerance 1.0e-6

  @doc "The fingerprint kind of a column."
  @spec kind_for(ColumnSpec.t()) :: atom()
  def kind_for(%ColumnSpec{type: type}) when type in [:integer, :bigint], do: :int
  def kind_for(%ColumnSpec{type: :float}), do: :float
  def kind_for(%ColumnSpec{type: :boolean}), do: :bool
  def kind_for(%ColumnSpec{type: :date}), do: :date
  def kind_for(%ColumnSpec{type: :datetime}), do: :datetime
  def kind_for(%ColumnSpec{}), do: :string

  @doc "Fresh accumulators for the columns."
  @spec init([ColumnSpec.t()]) :: [acc()]
  def init(columns), do: Enum.map(columns, &new_acc(kind_for(&1)))

  @doc "Folds encoded (post-transform) rows into the accumulators."
  @spec add_rows([acc()], [[term()]]) :: [acc()]
  def add_rows(accs, rows) do
    Enum.reduce(rows, accs, fn row, accs -> Enum.zip_with(accs, row, &add_value/2) end)
  end

  @doc """
  Merges accumulators (associative and commutative).

  ## Examples

      iex> alias Csv2sql.Schema.ColumnSpec
      iex> alias Csv2sql.Validate.Fingerprint
      iex> columns = [%ColumnSpec{name: "n", type: :integer}]
      iex> a = Fingerprint.add_rows(Fingerprint.init(columns), [[1], [nil]])
      iex> b = Fingerprint.add_rows(Fingerprint.init(columns), [[41]])
      iex> [merged] = Fingerprint.merge(a, b)
      iex> {merged.null_count, merged.min, merged.max, merged.sum}
      {1, 1, 41, 42}

  """
  @spec merge([acc()], [acc()]) :: [acc()]
  def merge(a, b), do: Enum.zip_with(a, b, &merge_acc/2)

  @doc """
  The database-side aggregate expressions for one column, as
  `{check_key, sql}` pairs — in the SAME sorted-key order `compare/3`
  consumes (one source of truth: `check_keys/1`). Portable ANSI —
  adapters may override via the `fingerprint_exprs/1` callback for
  exotic dialects.
  """
  @spec exprs(module(), ColumnSpec.t()) :: [{atom(), iodata()}]
  def exprs(adapter, %ColumnSpec{} = column) do
    qi = IO.iodata_to_binary(adapter.quote_ident(column.name))

    column
    |> kind_for()
    |> check_keys()
    |> Enum.map(fn key -> {key, expr_for(key, qi)} end)
  end

  @doc "The check keys for a kind, in canonical (sorted) order."
  @spec check_keys(atom()) :: [atom()]
  def check_keys(kind) when kind in [:int, :float], do: [:max, :min, :null_count, :sum]
  def check_keys(:bool), do: [:null_count, :true_count]
  def check_keys(kind) when kind in [:date, :datetime], do: [:max, :min, :null_count]
  def check_keys(:string), do: [:max_length, :null_count, :total_bytes]

  defp expr_for(:null_count, qi), do: "COUNT(*) - COUNT(#{qi})"
  defp expr_for(:min, qi), do: "MIN(#{qi})"
  defp expr_for(:max, qi), do: "MAX(#{qi})"
  defp expr_for(:sum, qi), do: "SUM(#{qi})"
  defp expr_for(:true_count, qi), do: "SUM(CASE WHEN #{qi} = TRUE THEN 1 ELSE 0 END)"
  defp expr_for(:max_length, qi), do: "MAX(CHAR_LENGTH(#{qi}))"
  defp expr_for(:total_bytes, qi), do: "SUM(OCTET_LENGTH(#{qi}))"

  @doc """
  Compares accumulators against the database's aggregate values.

  `db_values` must align with the flattened `exprs/2` order. Returns
  per-column JSON-safe check maps and an overall pass flag.
  """
  @spec compare([ColumnSpec.t()], [acc()], [term()]) ::
          {boolean(), [%{column: String.t(), ok: boolean(), checks: map()}]}
  def compare(columns, accs, db_values) do
    {results, _rest} =
      columns
      |> Enum.zip(accs)
      |> Enum.map_reduce(db_values, fn {column, acc}, remaining ->
        expected = expected_checks(acc)
        keys = check_keys(acc.kind)
        {taken, rest} = Enum.split(remaining, length(keys))

        checks =
          keys
          |> Enum.map(fn key -> {key, Map.fetch!(expected, key)} end)
          |> Enum.zip(taken)
          |> Map.new(fn {{key, expected_value}, db_value} ->
            actual = normalize(db_value, acc.kind)
            ok = values_match?(key, acc.kind, expected_value, actual)

            {key,
             %{
               "expected" => json_safe(expected_value),
               "actual" => json_safe(actual),
               "ok" => ok
             }}
          end)

        ok = Enum.all?(checks, fn {_key, %{"ok" => ok}} -> ok end)
        {%{column: column.name, ok: ok, checks: checks}, rest}
      end)

    {Enum.all?(results, & &1.ok), results}
  end

  @doc "The flattened expected-checks (sorted by key) for query building."
  @spec expected_checks(acc()) :: %{atom() => term()}
  def expected_checks(%{kind: kind} = acc) when kind in [:int, :float],
    do: %{max: acc.max, min: acc.min, null_count: acc.null_count, sum: acc.sum}

  def expected_checks(%{kind: :bool} = acc),
    do: %{null_count: acc.null_count, true_count: acc.true_count}

  def expected_checks(%{kind: kind} = acc) when kind in [:date, :datetime],
    do: %{max: acc.max, min: acc.min, null_count: acc.null_count}

  def expected_checks(%{kind: :string} = acc),
    do: %{max_length: acc.max_length, null_count: acc.null_count, total_bytes: acc.total_bytes}

  # -- Accumulation ------------------------------------------------------------

  defp new_acc(kind) do
    %{
      kind: kind,
      null_count: 0,
      min: nil,
      max: nil,
      sum: nil,
      true_count: if(kind == :bool, do: 0),
      max_length: if(kind == :string, do: 0),
      total_bytes: if(kind == :string, do: 0)
    }
  end

  defp add_value(acc, nil), do: %{acc | null_count: acc.null_count + 1}

  defp add_value(%{kind: kind} = acc, value) when kind in [:int, :float] do
    %{
      acc
      | min: min_of(acc.kind, acc.min, value),
        max: max_of(acc.kind, acc.max, value),
        sum: (acc.sum || 0) + value
    }
  end

  defp add_value(%{kind: :bool} = acc, value) do
    %{acc | true_count: acc.true_count + if(value, do: 1, else: 0)}
  end

  defp add_value(%{kind: kind} = acc, value) when kind in [:date, :datetime] do
    %{acc | min: min_of(kind, acc.min, value), max: max_of(kind, acc.max, value)}
  end

  defp add_value(%{kind: :string} = acc, value) do
    %{
      acc
      | max_length: max(acc.max_length, String.length(value)),
        total_bytes: acc.total_bytes + byte_size(value)
    }
  end

  defp merge_acc(a, b) do
    %{
      kind: a.kind,
      null_count: a.null_count + b.null_count,
      min: merge_min(a.kind, a.min, b.min),
      max: merge_max(a.kind, a.max, b.max),
      sum: merge_sum(a.sum, b.sum),
      true_count: merge_sum(a.true_count, b.true_count),
      max_length: merge_max(:int, a.max_length, b.max_length),
      total_bytes: merge_sum(a.total_bytes, b.total_bytes)
    }
  end

  defp merge_sum(nil, b), do: b
  defp merge_sum(a, nil), do: a
  defp merge_sum(a, b), do: a + b

  defp merge_min(_kind, nil, b), do: b
  defp merge_min(_kind, a, nil), do: a
  defp merge_min(kind, a, b), do: min_of(kind, a, b)

  defp merge_max(_kind, nil, b), do: b
  defp merge_max(_kind, a, nil), do: a
  defp merge_max(kind, a, b), do: max_of(kind, a, b)

  defp min_of(_kind, nil, value), do: value
  defp min_of(:date, a, b), do: if(Date.compare(b, a) == :lt, do: b, else: a)
  defp min_of(:datetime, a, b), do: if(NaiveDateTime.compare(b, a) == :lt, do: b, else: a)
  defp min_of(_numeric, a, b), do: min(a, b)

  defp max_of(_kind, nil, value), do: value
  defp max_of(:date, a, b), do: if(Date.compare(b, a) == :gt, do: b, else: a)
  defp max_of(:datetime, a, b), do: if(NaiveDateTime.compare(b, a) == :gt, do: b, else: a)
  defp max_of(_numeric, a, b), do: max(a, b)

  # -- Comparison --------------------------------------------------------------

  defp normalize(%Decimal{} = decimal, :float), do: Decimal.to_float(decimal)

  defp normalize(%Decimal{} = decimal, _kind) do
    Decimal.to_integer(decimal)
  rescue
    _not_integral -> Decimal.to_float(decimal)
  end

  defp normalize(%NaiveDateTime{} = naive, _kind), do: NaiveDateTime.truncate(naive, :second)
  defp normalize(value, _kind), do: value

  defp values_match?(:sum, :float, expected, actual), do: floats_close?(expected, actual)

  defp values_match?(_key, _kind, expected, actual),
    do: normalize_eq(expected) == normalize_eq(actual)

  defp normalize_eq(%NaiveDateTime{} = naive), do: NaiveDateTime.truncate(naive, :second)
  defp normalize_eq(value), do: value

  defp floats_close?(nil, nil), do: true
  defp floats_close?(nil, _actual), do: false
  defp floats_close?(_expected, nil), do: false

  defp floats_close?(expected, actual) do
    abs(expected - actual) <=
      max(@float_tolerance, @float_tolerance * max(abs(expected), abs(actual)))
  end

  defp json_safe(%Date{} = date), do: Date.to_iso8601(date)
  defp json_safe(%NaiveDateTime{} = naive), do: NaiveDateTime.to_iso8601(naive)
  defp json_safe(value), do: value
end

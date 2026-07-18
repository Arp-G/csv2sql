defmodule Csv2sql.Load.Encoder do
  @moduledoc """
  Casts raw CSV strings into the terms handed to the database driver.

  Per-value casting is total: a cell that cannot be cast rejects the row
  with a reason instead of raising. Whitespace-only values become `NULL`;
  all-zero dates (`0000-00-00`) become `NULL` (they exist to be cleaned).
  Dates/datetimes are parsed with the run's compiled patterns; booleans
  accept `true/false/1/0` (drivers encode Elixir booleans natively for
  both `BOOLEAN` and `TINYINT(1)`).
  """

  alias Csv2sql.Schema.ColumnSpec
  alias Csv2sql.Schema.TypeCheck
  alias Csv2sql.TimeParse

  @type row :: [String.t()]
  @type encoded_row :: [term()]
  @type parsers :: %{date: [TimeParse.compiled()], datetime: [TimeParse.compiled()]}

  @no_parsers %{date: [], datetime: []}

  @doc """
  Encodes one row against the column specs.

  ## Examples

      iex> alias Csv2sql.Schema.ColumnSpec
      iex> columns = [
      ...>   %ColumnSpec{name: "id", type: :integer},
      ...>   %ColumnSpec{name: "name", type: :varchar, length: 10},
      ...>   %ColumnSpec{name: "score", type: :float}
      ...> ]
      iex> Csv2sql.Load.Encoder.encode_row(["7", "alice", "1.5"], columns)
      {:ok, [7, "alice", 1.5]}
      iex> Csv2sql.Load.Encoder.encode_row(["7", "  ", ""], columns)
      {:ok, [7, nil, nil]}
      iex> Csv2sql.Load.Encoder.encode_row(["x", "alice", "1.5"], columns)
      {:error, "id: cannot cast \\"x\\" to integer"}

  Dates use the compiled patterns; zero-dates load as `NULL`:

      iex> alias Csv2sql.Schema.ColumnSpec
      iex> {:ok, dates} = Csv2sql.TimeParse.compile_all(["{YYYY}-{0M}-{0D}"])
      iex> columns = [%ColumnSpec{name: "day", type: :date}, %ColumnSpec{name: "ok", type: :boolean}]
      iex> parsers = %{date: dates, datetime: []}
      iex> Csv2sql.Load.Encoder.encode_row(["2024-01-05", "1"], columns, parsers)
      {:ok, [~D[2024-01-05], true]}
      iex> Csv2sql.Load.Encoder.encode_row(["0000-00-00", "FALSE"], columns, parsers)
      {:ok, [nil, false]}

  """
  @spec encode_row(row(), [ColumnSpec.t()], parsers()) ::
          {:ok, encoded_row()} | {:error, String.t()}
  def encode_row(row, columns, parsers \\ @no_parsers) do
    padded = pad_row(row, length(columns))

    padded
    |> Enum.zip(columns)
    |> Enum.reduce_while([], fn {value, column}, acc ->
      case encode_value(value, column, parsers) do
        {:ok, term} -> {:cont, [term | acc]}
        {:error, reason} -> {:halt, {:error, reason}}
      end
    end)
    |> case do
      {:error, reason} -> {:error, reason}
      encoded -> {:ok, Enum.reverse(encoded)}
    end
  end

  defp pad_row(row, column_count) do
    case length(row) do
      ^column_count -> row
      shorter when shorter < column_count -> row ++ List.duplicate("", column_count - shorter)
      _longer -> Enum.take(row, column_count)
    end
  end

  defp encode_value(value, column, parsers) do
    case String.trim(value) do
      "" -> {:ok, nil}
      trimmed -> cast(trimmed, column, parsers)
    end
  end

  defp cast(value, %ColumnSpec{type: type} = column, _parsers)
       when type in [:integer, :bigint] do
    case TypeCheck.integer(value) do
      {:ok, int} -> {:ok, int}
      :error -> {:error, cast_error(column, value, "integer")}
    end
  end

  defp cast(value, %ColumnSpec{type: :float} = column, _parsers) do
    case TypeCheck.float(value) do
      {:ok, float} -> {:ok, float}
      :error -> {:error, cast_error(column, value, "float")}
    end
  end

  defp cast(value, %ColumnSpec{type: :boolean} = column, _parsers) do
    case TypeCheck.boolean(value) do
      {:ok, boolean} -> {:ok, boolean}
      :error -> {:error, cast_error(column, value, "boolean")}
    end
  end

  defp cast(value, %ColumnSpec{type: :date} = column, parsers) do
    case TimeParse.date(value, parsers.date) do
      {:ok, date} -> {:ok, date}
      :zero -> {:ok, nil}
      :error -> {:error, cast_error(column, value, "date")}
    end
  end

  defp cast(value, %ColumnSpec{type: :datetime} = column, parsers) do
    case TimeParse.datetime(value, parsers.datetime) do
      {:ok, datetime} -> {:ok, datetime}
      :zero -> {:ok, nil}
      :error -> {:error, cast_error(column, value, "datetime")}
    end
  end

  defp cast(value, %ColumnSpec{}, _parsers), do: {:ok, value}

  defp cast_error(column, value, type_name) do
    shown = if byte_size(value) > 64, do: "oversized value", else: inspect(value)
    "#{column.name}: cannot cast #{shown} to #{type_name}"
  end
end

defmodule Csv2sql.Load.Encoder do
  @moduledoc """
  Casts raw CSV strings into the terms handed to the database driver.

  Per-value casting is total: a cell that cannot be cast rejects the row
  with a reason instead of raising. Whitespace-only values become `NULL`.
  """

  alias Csv2sql.Schema.ColumnSpec
  alias Csv2sql.Schema.TypeCheck

  @type row :: [String.t()]
  @type encoded_row :: [term()]

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

  """
  @spec encode_row(row(), [ColumnSpec.t()]) :: {:ok, encoded_row()} | {:error, String.t()}
  def encode_row(row, columns) do
    padded = pad_row(row, length(columns))

    padded
    |> Enum.zip(columns)
    |> Enum.reduce_while([], fn {value, column}, acc ->
      case encode_value(value, column) do
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

  defp encode_value(value, column) do
    case String.trim(value) do
      "" -> {:ok, nil}
      trimmed -> cast(trimmed, column)
    end
  end

  defp cast(value, %ColumnSpec{type: type} = column) when type in [:integer, :bigint] do
    case TypeCheck.integer(value) do
      {:ok, int} -> {:ok, int}
      :error -> {:error, cast_error(column, value, "integer")}
    end
  end

  defp cast(value, %ColumnSpec{type: :float} = column) do
    case TypeCheck.float(value) do
      {:ok, float} -> {:ok, float}
      :error -> {:error, cast_error(column, value, "float")}
    end
  end

  defp cast(value, %ColumnSpec{}), do: {:ok, value}

  defp cast_error(column, value, type_name) do
    shown = if byte_size(value) > 64, do: "oversized value", else: inspect(value)
    "#{column.name}: cannot cast #{shown} to #{type_name}"
  end
end

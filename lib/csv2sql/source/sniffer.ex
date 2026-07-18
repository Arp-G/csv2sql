defmodule Csv2sql.Source.Sniffer do
  @moduledoc """
  Delimiter detection over a small sample of lines.

  For each candidate delimiter, counts occurrences per line *outside
  quoted regions*; a candidate wins when it appears a consistent, nonzero
  number of times on every sampled line. Ties break toward the highest
  count; no winner falls back to comma.
  """

  alias Csv2sql.Source.Parsers

  @doc """
  Picks the most plausible delimiter for the sampled lines.

  ## Examples

      iex> Csv2sql.Source.Sniffer.sniff(["a;b;c", "1;2;3"])
      :semicolon

      iex> Csv2sql.Source.Sniffer.sniff(["a\\tb", "1\\t2"])
      :tab

      iex> Csv2sql.Source.Sniffer.sniff(["a,b", "1,2"])
      :comma

      iex> Csv2sql.Source.Sniffer.sniff(["\\"x;y\\",z", "\\"a;b\\",c"])
      :comma

      iex> Csv2sql.Source.Sniffer.sniff(["single_column"])
      :comma

  """
  @spec sniff([String.t()]) :: Parsers.delimiter()
  def sniff([]), do: :comma

  def sniff(lines) do
    Parsers.all()
    |> Enum.map(fn delimiter -> {delimiter, consistent_count(lines, Parsers.char(delimiter))} end)
    |> Enum.filter(fn {_delimiter, count} -> count > 0 end)
    |> Enum.max_by(fn {_delimiter, count} -> count end, fn -> {:comma, 0} end)
    |> elem(0)
  end

  # The per-line count if identical across all lines, else 0.
  defp consistent_count(lines, char) do
    case lines |> Enum.map(&count_outside_quotes(&1, char)) |> Enum.uniq() do
      [count] -> count
      _inconsistent -> 0
    end
  end

  defp count_outside_quotes(line, char) do
    line
    |> String.graphemes()
    |> Enum.reduce({0, false}, fn
      "\"", {count, in_quotes} -> {count, not in_quotes}
      ^char, {count, false} -> {count + 1, false}
      _grapheme, acc -> acc
    end)
    |> elem(0)
  end
end

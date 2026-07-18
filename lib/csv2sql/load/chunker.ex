defmodule Csv2sql.Load.Chunker do
  @moduledoc """
  Splits a row stream into insert chunks that respect three limits at
  once (upstream issue #21 — "packet too large"):

    * `max_rows` — the configured rows-per-insert upper bound
    * the adapter's positional-parameter cap (`max_params / column_count`)
    * a byte budget (configured, and capped by the server's packet size)

  A chunk always contains at least one row, even when that single row
  exceeds the byte budget — otherwise a huge row could never be sent (it
  then fails at the server with a row-level error instead of hanging).
  """

  @typedoc "Per-run/per-file chunking limits."
  @type limits :: %{max_rows: pos_integer(), max_params: pos_integer(), max_bytes: pos_integer()}

  @doc """
  Computes the effective limits for a file.

  ## Examples

      iex> Csv2sql.Load.Chunker.limits(2000, 65_535, 4_000_000, 200)
      %{max_rows: 327, max_params: 65_535, max_bytes: 4_000_000}

      iex> Csv2sql.Load.Chunker.limits(2000, 65_535, 4_000_000, 3)
      %{max_rows: 2000, max_params: 65_535, max_bytes: 4_000_000}

  """
  @spec limits(pos_integer(), pos_integer(), pos_integer(), pos_integer()) :: limits()
  def limits(configured_rows, max_params, max_bytes, column_count) do
    param_cap = max(div(max_params, max(column_count, 1)), 1)

    %{
      max_rows: min(configured_rows, param_cap),
      max_params: max_params,
      max_bytes: max_bytes
    }
  end

  @doc """
  Lazily chunks `row_stream` under `limits`.

  ## Examples

      iex> rows = [["aa", "bb"], ["cc", "dd"], ["ee", "ff"]]
      iex> rows
      ...> |> Csv2sql.Load.Chunker.chunks(%{max_rows: 2, max_params: 100, max_bytes: 1_000})
      ...> |> Enum.to_list()
      [[["aa", "bb"], ["cc", "dd"]], [["ee", "ff"]]]

      iex> big = String.duplicate("x", 600)
      iex> [[big], [big], ["small"]]
      ...> |> Csv2sql.Load.Chunker.chunks(%{max_rows: 10, max_params: 100, max_bytes: 1_000})
      ...> |> Enum.map(&length/1)
      [1, 2]

  """
  @spec chunks(Enumerable.t(), limits()) :: Enumerable.t()
  def chunks(row_stream, %{max_rows: max_rows, max_bytes: max_bytes}) do
    Stream.chunk_while(
      row_stream,
      {[], 0, 0},
      fn row, {rows, count, bytes} ->
        row_bytes = row_size(row)

        cond do
          count == 0 ->
            {:cont, {[row], 1, row_bytes}}

          count >= max_rows or bytes + row_bytes > max_bytes ->
            {:cont, Enum.reverse(rows), {[row], 1, row_bytes}}

          true ->
            {:cont, {[row | rows], count + 1, bytes + row_bytes}}
        end
      end,
      fn
        {[], 0, 0} -> {:cont, {[], 0, 0}}
        {rows, _count, _bytes} -> {:cont, Enum.reverse(rows), {[], 0, 0}}
      end
    )
  end

  # Cell bytes plus a small per-cell overhead for the wire protocol.
  # Elements may be `{row, metadata}` tuples (e.g. numbered rows).
  defp row_size({row, _metadata}), do: row_size(row)

  defp row_size(row) when is_list(row) do
    Enum.reduce(row, 0, fn cell, acc -> acc + byte_size(cell) + 8 end)
  end
end

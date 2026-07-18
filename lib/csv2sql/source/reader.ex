defmodule Csv2sql.Source.Reader do
  @moduledoc """
  Streams CSV rows from disk.

  Walking-skeleton scope: UTF-8, comma-delimited (RFC 4180). Encoding
  detection/transcoding (BOM, UTF-16, Latin-1) and per-delimiter parsers
  land in a later stage behind this same interface.
  """

  alias NimbleCSV.RFC4180, as: CSV

  @read_ahead 262_144

  @doc "Reads the header row (the first CSV record) of a file."
  @spec headers!(Path.t()) :: [String.t()]
  def headers!(path) do
    path
    |> raw_stream()
    |> CSV.parse_stream(skip_headers: false)
    |> Enum.take(1)
    |> case do
      [headers] -> headers
      [] -> []
    end
  end

  @doc "Streams data rows (header excluded), each row a list of binaries."
  @spec data_stream(Path.t()) :: Enumerable.t()
  def data_stream(path) do
    path
    |> raw_stream()
    |> CSV.parse_stream(skip_headers: true)
  end

  defp raw_stream(path), do: File.stream!(path, [:trim_bom, read_ahead: @read_ahead])
end

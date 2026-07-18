defmodule Csv2sql.Source.Reader do
  @moduledoc """
  Encoding- and delimiter-aware CSV streaming.

  `detect/2` runs once per file: it sniffs the BOM (UTF-8 / UTF-16 LE/BE)
  and — when the config says `:auto` — the delimiter, from a small sample.
  `headers!/2` and `data_stream/2` then normalize the bytes to UTF-8
  (streaming transcode with carry for UTF-16; per-line transcode for
  Latin-1) before parsing.

  Invalid byte sequences in a declared encoding raise
  `Csv2sql.Source.EncodingError` — refusing a file beats silently
  corrupting it; the pipeline turns the raise into a file-level error.
  """

  alias Csv2sql.Config
  alias Csv2sql.Source.Parsers
  alias Csv2sql.Source.Sniffer

  defmodule EncodingError do
    @moduledoc false
    defexception [:message]
  end

  @read_ahead 262_144
  @chunk_bytes 65_536

  @type encoding :: :utf8 | :utf16le | :utf16be | :latin1
  @type source :: %{encoding: encoding(), delimiter: Parsers.delimiter()}

  @doc "Detects the file's encoding and delimiter (honoring explicit config)."
  @spec detect(Path.t(), Config.t()) :: source()
  def detect(path, %Config{} = config) do
    encoding = resolve_encoding(path, config.encoding)
    %{encoding: encoding, delimiter: resolve_delimiter(path, encoding, config.delimiter)}
  end

  @doc "Reads the header row (the first CSV record) of a file."
  @spec headers!(Path.t(), source()) :: [String.t()]
  def headers!(path, source) do
    path
    |> parsed_stream(source, false)
    |> Enum.take(1)
    |> case do
      [headers] -> headers
      [] -> []
    end
  end

  @doc "Streams data rows (header excluded), each row a list of binaries."
  @spec data_stream(Path.t(), source()) :: Enumerable.t()
  def data_stream(path, source) do
    parsed_stream(path, source, true)
  end

  defp parsed_stream(path, %{encoding: encoding, delimiter: delimiter}, skip_headers) do
    parser = Parsers.module(delimiter)

    path
    |> line_stream(encoding)
    |> parser.parse_stream(skip_headers: skip_headers)
  end

  # -- Encoding detection ------------------------------------------------------

  defp resolve_encoding(path, configured) do
    bom = path |> head_bytes(4) |> bom_encoding()

    case {configured, bom} do
      {:auto, nil} -> :utf8
      {:auto, detected} -> detected
      {:utf8, _bom} -> :utf8
      {:latin1, _bom} -> :latin1
      # Explicit UTF-16: the BOM picks the endianness, default LE.
      {:utf16, :utf16be} -> :utf16be
      {:utf16, _bom} -> :utf16le
    end
  end

  defp bom_encoding(<<0xFF, 0xFE, _rest::binary>>), do: :utf16le
  defp bom_encoding(<<0xFE, 0xFF, _rest::binary>>), do: :utf16be
  defp bom_encoding(_head), do: nil

  defp head_bytes(path, count) do
    {:ok, io} = :file.open(path, [:read, :binary, :raw])

    head =
      case :file.read(io, count) do
        {:ok, bytes} -> bytes
        _eof_or_error -> <<>>
      end

    :file.close(io)
    head
  end

  # -- Delimiter detection -----------------------------------------------------

  defp resolve_delimiter(_path, _encoding, explicit) when explicit != :auto, do: explicit

  defp resolve_delimiter(path, encoding, :auto) do
    path
    |> line_stream(encoding)
    |> Stream.take(5)
    |> Enum.map(&String.trim_trailing(&1, "\n"))
    |> Sniffer.sniff()
  rescue
    # Undecodable sample: let the real read report it properly.
    _error -> :comma
  end

  # -- Byte → UTF-8 line streams ----------------------------------------------

  defp line_stream(path, :utf8), do: File.stream!(path, [:trim_bom, read_ahead: @read_ahead])

  defp line_stream(path, :latin1) do
    # Latin-1 is single-byte, so line splitting is safe before transcoding.
    path
    |> File.stream!(read_ahead: @read_ahead)
    |> Stream.map(&:unicode.characters_to_binary(&1, :latin1, :utf8))
  end

  defp line_stream(path, utf16) when utf16 in [:utf16le, :utf16be] do
    endianness = if utf16 == :utf16le, do: :little, else: :big

    path
    |> File.stream!(@chunk_bytes)
    |> strip_bom(utf16)
    |> transcode_utf16(endianness, path)
    |> to_lines()
  end

  defp strip_bom(stream, utf16) do
    bom = if utf16 == :utf16le, do: <<0xFF, 0xFE>>, else: <<0xFE, 0xFF>>

    Stream.transform(stream, true, fn chunk, first? ->
      case {first?, chunk} do
        {true, <<^bom::binary-size(2), rest::binary>>} -> {[rest], false}
        {_not_first, chunk} -> {[chunk], false}
      end
    end)
  end

  # Streaming transcode with carry: chunk boundaries can split a
  # character; :unicode returns {:incomplete, converted, rest}.
  defp transcode_utf16(stream, endianness, path) do
    stream
    |> Stream.concat([:eof])
    |> Stream.transform(<<>>, fn
      :eof, <<>> ->
        {[], <<>>}

      :eof, _carry ->
        raise EncodingError, message: "#{path}: truncated UTF-16 sequence at end of file"

      chunk, carry ->
        case :unicode.characters_to_binary(carry <> chunk, {:utf16, endianness}, :utf8) do
          converted when is_binary(converted) ->
            {[converted], <<>>}

          {:incomplete, converted, rest} ->
            {[converted], rest}

          {:error, _converted, _rest} ->
            raise EncodingError, message: "#{path}: invalid UTF-16 byte sequence"
        end
    end)
  end

  # Reassembles transcoded chunks into newline-terminated lines (what the
  # CSV parsers expect), carrying partial tails across chunks.
  defp to_lines(stream) do
    stream
    |> Stream.concat([:eof])
    |> Stream.transform(<<>>, fn
      :eof, <<>> ->
        {[], <<>>}

      :eof, tail ->
        {[tail], <<>>}

      chunk, carry ->
        parts = String.split(carry <> chunk, "\n")
        {lines, [tail]} = Enum.split(parts, -1)
        {Enum.map(lines, &(&1 <> "\n")), tail}
    end)
  end
end

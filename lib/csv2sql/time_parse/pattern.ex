defmodule Csv2sql.TimeParse.Pattern do
  @moduledoc """
  Tokenizes `{YYYY}-{0M}-{0D}`-style patterns (the same syntax v3/v4
  accepted via Timex) into a token list for `Csv2sql.TimeParse`.

  Supported tokens:

  | token | meaning |
  |---|---|
  | `{YYYY}` | 4-digit year |
  | `{YY}` | 2-digit year (00–49 → 2000s, 50–99 → 1900s) |
  | `{0M}` / `{M}` | month, zero-padded / 1–2 digits |
  | `{0D}` / `{D}` | day, zero-padded / 1–2 digits |
  | `{0h24}` / `{h24}` | hour 00–23, padded / flexible |
  | `{0h12}` / `{h12}` | hour 01–12, padded / flexible |
  | `{0m}` / `{m}` | minute |
  | `{0s}` / `{s}` | second |
  | `{AM}` / `{am}` | meridiem (accepts AM/PM/am/pm) |

  Anything outside braces is a literal. Tokenization is total: unknown
  tokens or unclosed braces return `{:error, reason}`.
  """

  @type token ::
          {:field, atom(), :padded | :flex}
          | :meridiem
          | {:lit, String.t()}

  @fields %{
    "YYYY" => {:field, :year4, :padded},
    "YY" => {:field, :year2, :padded},
    "0M" => {:field, :month, :padded},
    "M" => {:field, :month, :flex},
    "0D" => {:field, :day, :padded},
    "D" => {:field, :day, :flex},
    "0h24" => {:field, :hour24, :padded},
    "h24" => {:field, :hour24, :flex},
    "0h12" => {:field, :hour12, :padded},
    "h12" => {:field, :hour12, :flex},
    "0m" => {:field, :minute, :padded},
    "m" => {:field, :minute, :flex},
    "0s" => {:field, :second, :padded},
    "s" => {:field, :second, :flex},
    "AM" => :meridiem,
    "am" => :meridiem
  }

  @doc """
  Tokenizes a pattern.

  ## Examples

      iex> Csv2sql.TimeParse.Pattern.tokenize("{YYYY}-{0M}-{0D}")
      {:ok, [{:field, :year4, :padded}, {:lit, "-"}, {:field, :month, :padded}, {:lit, "-"}, {:field, :day, :padded}]}

      iex> Csv2sql.TimeParse.Pattern.tokenize("{h12} {AM}")
      {:ok, [{:field, :hour12, :flex}, {:lit, " "}, :meridiem]}

      iex> Csv2sql.TimeParse.Pattern.tokenize("{WAT}")
      {:error, ~s(unknown token {WAT})}

      iex> Csv2sql.TimeParse.Pattern.tokenize("{YYYY")
      {:error, "unclosed { in pattern"}

  """
  @spec tokenize(String.t()) :: {:ok, [token()]} | {:error, String.t()}
  def tokenize(pattern) when is_binary(pattern) do
    do_tokenize(pattern, [])
  end

  defp do_tokenize(<<>>, acc), do: {:ok, Enum.reverse(acc)}

  defp do_tokenize(<<?{, rest::binary>>, acc) do
    case String.split(rest, "}", parts: 2) do
      [name, rest] ->
        case Map.fetch(@fields, name) do
          {:ok, token} -> do_tokenize(rest, [token | acc])
          :error -> {:error, "unknown token {#{name}}"}
        end

      [_no_close] ->
        {:error, "unclosed { in pattern"}
    end
  end

  defp do_tokenize(rest, acc) do
    {literal, remaining} = take_literal(rest, <<>>)
    do_tokenize(remaining, [{:lit, literal} | acc])
  end

  defp take_literal(<<?{, _rest::binary>> = remaining, acc), do: {acc, remaining}
  defp take_literal(<<>>, acc), do: {acc, <<>>}

  defp take_literal(<<char::utf8, rest::binary>>, acc),
    do: take_literal(rest, <<acc::binary, char::utf8>>)
end

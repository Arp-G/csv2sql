defmodule Csv2sql.TimeParse do
  @moduledoc """
  Total date/datetime parsing against compiled patterns.

  Replaces Timex (whose parser raises on malformed input — upstream
  issue #24): every function here returns a tagged result and **never
  raises**, no matter what bytes a CSV cell contains.

  Patterns are compiled once per run (`compile_all/1`) and matched with a
  small backtracking binary matcher. All-zero dates (`0000-00-00`, a
  common MySQL-dump placeholder) are recognized as `:zero` so inference
  can keep the column a date and the encoder can store `NULL`.
  """

  alias Csv2sql.TimeParse.Pattern

  @typedoc "A compiled pattern: the source string and its tokens."
  @type compiled :: {String.t(), [Pattern.token()]}

  @field_widths %{
    year4: 4,
    year2: 2,
    month: 2,
    day: 2,
    hour24: 2,
    hour12: 2,
    minute: 2,
    second: 2
  }

  @field_ranges %{
    year4: 0..9999,
    year2: 0..99,
    month: 0..12,
    day: 0..31,
    hour24: 0..23,
    hour12: 1..12,
    minute: 0..59,
    second: 0..59
  }

  @doc """
  Compiles a list of pattern strings; fails on the first invalid one.

  ## Examples

      iex> {:ok, [{"{YYYY}-{0M}-{0D}", tokens}]} = Csv2sql.TimeParse.compile_all(["{YYYY}-{0M}-{0D}"])
      iex> length(tokens)
      5

      iex> Csv2sql.TimeParse.compile_all(["{NOPE}"])
      {:error, "{NOPE}", "unknown token {NOPE}"}

  """
  @spec compile_all([String.t()]) :: {:ok, [compiled()]} | {:error, String.t(), String.t()}
  def compile_all(patterns) do
    patterns
    |> Enum.reduce_while([], fn pattern, acc ->
      case Pattern.tokenize(pattern) do
        {:ok, tokens} -> {:cont, [{pattern, tokens} | acc]}
        {:error, reason} -> {:halt, {:error, pattern, reason}}
      end
    end)
    |> case do
      {:error, pattern, reason} -> {:error, pattern, reason}
      compiled -> {:ok, Enum.reverse(compiled)}
    end
  end

  @doc """
  Parses a date against a list of compiled patterns.

  ## Examples

      iex> {:ok, patterns} = Csv2sql.TimeParse.compile_all(["{YYYY}-{0M}-{0D}", "{D}/{M}/{YYYY}"])
      iex> Csv2sql.TimeParse.date("2023-07-18", patterns)
      {:ok, ~D[2023-07-18]}
      iex> Csv2sql.TimeParse.date("5/7/2023", patterns)
      {:ok, ~D[2023-07-05]}
      iex> Csv2sql.TimeParse.date("0000-00-00", patterns)
      :zero
      iex> Csv2sql.TimeParse.date("2023-13-01", patterns)
      :error
      iex> Csv2sql.TimeParse.date("77-88-99", patterns)
      :error
      iex> Csv2sql.TimeParse.date("garbage�bytes", patterns)
      :error

  """
  @spec date(String.t(), [compiled()]) :: {:ok, Date.t()} | :zero | :error
  def date(value, patterns) when is_binary(value) do
    try_patterns(value, patterns, &build_date/1)
  end

  @doc """
  Parses a naive datetime against a list of compiled patterns.

  ## Examples

      iex> {:ok, patterns} =
      ...>   Csv2sql.TimeParse.compile_all([
      ...>     "{YYYY}-{0M}-{0D} {0h24}:{0m}:{0s}",
      ...>     "{D}/{M}/{YYYY} {h12}:{0m} {AM}"
      ...>   ])
      iex> Csv2sql.TimeParse.datetime("2023-07-18 14:30:00", patterns)
      {:ok, ~N[2023-07-18 14:30:00]}
      iex> Csv2sql.TimeParse.datetime("5/7/2023 2:30 PM", patterns)
      {:ok, ~N[2023-07-05 14:30:00]}
      iex> Csv2sql.TimeParse.datetime("5/7/2023 12:15 am", patterns)
      {:ok, ~N[2023-07-05 00:15:00]}
      iex> Csv2sql.TimeParse.datetime("0000-00-00 00:00:00", patterns)
      :zero
      iex> Csv2sql.TimeParse.datetime("2023-07-18 25:00:00", patterns)
      :error

  """
  @spec datetime(String.t(), [compiled()]) :: {:ok, NaiveDateTime.t()} | :zero | :error
  def datetime(value, patterns) when is_binary(value) do
    try_patterns(value, patterns, &build_datetime/1)
  end

  defp try_patterns(_value, [], _builder), do: :error

  defp try_patterns(value, [{_pattern, tokens} | rest], builder) do
    case match(value, tokens, %{}) do
      {:ok, fields} ->
        case builder.(fields) do
          :error -> try_patterns(value, rest, builder)
          result -> result
        end

      :error ->
        try_patterns(value, rest, builder)
    end
  end

  # -- Matcher ----------------------------------------------------------------

  defp match(<<>>, [], fields), do: {:ok, fields}
  defp match(_rest, [], _fields), do: :error

  defp match(rest, [{:lit, literal} | tokens], fields) do
    if String.starts_with?(rest, literal) do
      remaining = binary_slice(rest, byte_size(literal)..-1//1)
      match(remaining, tokens, fields)
    else
      :error
    end
  end

  defp match(rest, [{:field, key, :padded} | tokens], fields) do
    width = @field_widths[key]

    with {:ok, int, remaining} <- take_digits(rest, width),
         true <- int in @field_ranges[key] do
      match(remaining, tokens, Map.put(fields, key, int))
    else
      _no_match -> :error
    end
  end

  # Flexible fields try the longest digit run first, then backtrack.
  defp match(rest, [{:field, key, :flex} | tokens], fields) do
    max_width = @field_widths[key]

    Enum.find_value(max_width..1//-1, :error, fn width ->
      with {:ok, int, remaining} <- take_digits(rest, width),
           true <- int in @field_ranges[key],
           {:ok, _fields} = success <- match(remaining, tokens, Map.put(fields, key, int)) do
        success
      else
        _no_match -> nil
      end
    end)
  end

  defp match(rest, [:meridiem | tokens], fields) do
    case rest do
      <<m, rest::binary>> when m in [?a, ?A] -> meridiem_tail(rest, tokens, fields, :am)
      <<m, rest::binary>> when m in [?p, ?P] -> meridiem_tail(rest, tokens, fields, :pm)
      _no_match -> :error
    end
  end

  defp meridiem_tail(<<m, rest::binary>>, tokens, fields, meridiem) when m in [?m, ?M] do
    match(rest, tokens, Map.put(fields, :meridiem, meridiem))
  end

  defp meridiem_tail(_rest, _tokens, _fields, _meridiem), do: :error

  defp take_digits(binary, width) do
    case binary do
      <<digits::binary-size(^width), rest::binary>> ->
        if digits_only?(digits), do: {:ok, String.to_integer(digits), rest}, else: :error

      _too_short ->
        :error
    end
  end

  defp digits_only?(<<char, rest::binary>>) when char in ?0..?9, do: digits_only?(rest)
  defp digits_only?(<<>>), do: true
  defp digits_only?(_other), do: false

  # -- Builders ---------------------------------------------------------------

  defp build_date(fields) do
    with {:ok, year} <- year_of(fields),
         %{month: month, day: day} <- fields do
      if year == 0 and month == 0 and day == 0 do
        :zero
      else
        ok_or_error(Date.new(year, month, day))
      end
    else
      _missing -> :error
    end
  end

  defp build_datetime(fields) do
    case {hour_of(fields), build_date(fields)} do
      {{:ok, hour}, {:ok, date}} ->
        minute = Map.get(fields, :minute, 0)
        second = Map.get(fields, :second, 0)
        ok_or_error(NaiveDateTime.new(date.year, date.month, date.day, hour, minute, second))

      {{:ok, _hour}, :zero} ->
        :zero

      _missing_or_invalid ->
        :error
    end
  end

  defp year_of(%{year4: year}), do: {:ok, year}
  defp year_of(%{year2: year}) when year <= 49, do: {:ok, 2000 + year}
  defp year_of(%{year2: year}), do: {:ok, 1900 + year}
  defp year_of(_fields), do: :error

  defp hour_of(%{hour24: hour}), do: {:ok, hour}
  defp hour_of(%{hour12: 12, meridiem: :am}), do: {:ok, 0}
  defp hour_of(%{hour12: hour, meridiem: :am}), do: {:ok, hour}
  defp hour_of(%{hour12: 12, meridiem: :pm}), do: {:ok, 12}
  defp hour_of(%{hour12: hour, meridiem: :pm}), do: {:ok, hour + 12}
  defp hour_of(%{hour12: hour}), do: {:ok, hour}
  defp hour_of(_fields), do: :error

  defp ok_or_error({:ok, value}), do: {:ok, value}
  defp ok_or_error({:error, _reason}), do: :error
end

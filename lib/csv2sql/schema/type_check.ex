defmodule Csv2sql.Schema.TypeCheck do
  @moduledoc """
  Total, per-value type checks.

  Every function here returns a tagged result and **never raises** —
  malformed cell contents are data, not exceptions (upstream issue #24
  died on this distinction).
  """

  @int32_max 2_147_483_647
  @int32_min -2_147_483_648
  @int64_max 9_223_372_036_854_775_807
  @int64_min -9_223_372_036_854_775_808

  @doc """
  Parses a full-string integer.

  ## Examples

      iex> Csv2sql.Schema.TypeCheck.integer("42")
      {:ok, 42}

      iex> Csv2sql.Schema.TypeCheck.integer("-7")
      {:ok, -7}

      iex> Csv2sql.Schema.TypeCheck.integer("4.2")
      :error

      iex> Csv2sql.Schema.TypeCheck.integer("42x")
      :error

      iex> Csv2sql.Schema.TypeCheck.integer("")
      :error

  """
  @spec integer(String.t()) :: {:ok, integer()} | :error
  def integer(value) when is_binary(value) do
    case Integer.parse(value) do
      {int, ""} -> {:ok, int}
      _other -> :error
    end
  end

  @doc """
  Parses a full-string float (integers qualify too).

  ## Examples

      iex> Csv2sql.Schema.TypeCheck.float("4.2")
      {:ok, 4.2}

      iex> Csv2sql.Schema.TypeCheck.float("42")
      {:ok, 42.0}

      iex> Csv2sql.Schema.TypeCheck.float("-1.5e3")
      {:ok, -1500.0}

      iex> Csv2sql.Schema.TypeCheck.float("4.2.1")
      :error

      iex> Csv2sql.Schema.TypeCheck.float("")
      :error

  """
  @spec float(String.t()) :: {:ok, float()} | :error
  def float(value) when is_binary(value) do
    case Float.parse(value) do
      {float, ""} -> {:ok, float}
      _other -> :error
    end
  end

  @doc """
  Parses a boolean: `true`/`false` (any case) and `1`/`0`.

  A column containing only these values infers as boolean — including
  0/1-only columns (v3 semantics, documented; the priority order in
  `Csv2sql.Schema.Resolve` puts boolean above integer).

  ## Examples

      iex> Csv2sql.Schema.TypeCheck.boolean("true")
      {:ok, true}

      iex> Csv2sql.Schema.TypeCheck.boolean("FALSE")
      {:ok, false}

      iex> Csv2sql.Schema.TypeCheck.boolean("1")
      {:ok, true}

      iex> Csv2sql.Schema.TypeCheck.boolean("0")
      {:ok, false}

      iex> Csv2sql.Schema.TypeCheck.boolean("yes")
      :error

      iex> Csv2sql.Schema.TypeCheck.boolean("2")
      :error

  """
  @spec boolean(String.t()) :: {:ok, boolean()} | :error
  def boolean(value) when is_binary(value) do
    case String.downcase(value) do
      "true" -> {:ok, true}
      "1" -> {:ok, true}
      "false" -> {:ok, false}
      "0" -> {:ok, false}
      _other -> :error
    end
  end

  @doc """
  The integer tier an integer value fits into.

  ## Examples

      iex> Csv2sql.Schema.TypeCheck.integer_tier(100)
      :integer

      iex> Csv2sql.Schema.TypeCheck.integer_tier(3_000_000_000)
      :bigint

      iex> Csv2sql.Schema.TypeCheck.integer_tier(-3_000_000_000)
      :bigint

      iex> Csv2sql.Schema.TypeCheck.integer_tier(99_999_999_999_999_999_999)
      :too_big

  """
  @spec integer_tier(integer()) :: :integer | :bigint | :too_big
  def integer_tier(int) when int >= @int32_min and int <= @int32_max, do: :integer
  def integer_tier(int) when int >= @int64_min and int <= @int64_max, do: :bigint
  def integer_tier(_int), do: :too_big
end

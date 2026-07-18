defmodule Csv2sql.Schema.Resolve do
  @moduledoc """
  Turns inference accumulators + repaired headers into final `ColumnSpec`s.

  Resolution priority (walking-skeleton subset): all-empty → varchar,
  integer (int32 → int64 tier), float, then sized strings — `varchar(actual
  max length)` up to `varchar_limit`, `text` beyond it (dynamic sizing per
  upstream issues #12/#25).
  """

  alias Csv2sql.Schema.ColumnSpec
  alias Csv2sql.Schema.Inference
  alias Csv2sql.Schema.TypeCheck

  @doc "Builds final column specs from headers and the merged accumulator."
  @spec columns([String.t()], Inference.acc(), Csv2sql.Config.t()) :: [ColumnSpec.t()]
  def columns(headers, %{columns: column_accs}, config) do
    repaired = repair_headers(headers)

    repaired
    |> Enum.zip(column_accs)
    |> Enum.with_index()
    |> Enum.map(fn {{{name, original}, acc}, position} ->
      {type, length} = resolve_type(acc, config)

      %ColumnSpec{
        position: position,
        name: name,
        original_name: original,
        type: type,
        length: length,
        max_length: acc.max_length
      }
    end)
  end

  @doc """
  Repairs raw header names: trims whitespace, names blank headers, and
  de-duplicates repeats (upstream issues #13/#23).

  Returns `{repaired_name, original_name}` pairs.

  ## Examples

      iex> Csv2sql.Schema.Resolve.repair_headers(["id", " name ", "", "name"])
      [{"id", "id"}, {"name", " name "}, {"column_3", ""}, {"name_1", "name"}]

  """
  @spec repair_headers([String.t()]) :: [{String.t(), String.t()}]
  def repair_headers(headers) do
    headers
    |> Enum.with_index(1)
    |> Enum.map_reduce(%{}, fn {original, position}, seen ->
      base =
        case String.trim(original) do
          "" -> "column_#{position}"
          trimmed -> trimmed
        end

      {name, seen} = dedupe(base, seen)
      {{name, original}, seen}
    end)
    |> elem(0)
  end

  defp dedupe(base, seen) do
    case seen do
      %{^base => count} -> {"#{base}_#{count}", Map.put(seen, base, count + 1)}
      _new -> {base, Map.put(seen, base, 1)}
    end
  end

  defp resolve_type(%{empty: true}, config), do: {:varchar, config.varchar_limit}

  defp resolve_type(%{integer: true} = acc, config) do
    magnitude = max(abs(acc.int_min || 0), abs(acc.int_max || 0))

    case TypeCheck.integer_tier(sign_extend(acc, magnitude)) do
      :integer -> {:integer, nil}
      :bigint -> {:bigint, nil}
      :too_big -> string_type(acc, config)
    end
  end

  defp resolve_type(%{float: true}, _config), do: {:float, nil}
  defp resolve_type(acc, config), do: string_type(acc, config)

  # Tier by the most demanding bound (negative range is one wider).
  defp sign_extend(acc, magnitude) do
    if acc.int_min && acc.int_min < 0, do: -magnitude, else: magnitude
  end

  defp string_type(acc, config) do
    if acc.max_length > config.varchar_limit do
      {:text, nil}
    else
      {:varchar, max(acc.max_length, 1)}
    end
  end
end

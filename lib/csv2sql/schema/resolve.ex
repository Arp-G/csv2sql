defmodule Csv2sql.Schema.Resolve do
  @moduledoc """
  Turns inference accumulators + repaired headers into final `ColumnSpec`s.

  Resolution priority: all-empty → varchar(limit), **boolean** (incl.
  0/1-only columns — v3 semantics), integer (int32 → int64 tier, beyond →
  string), float, date, datetime, then sized strings — `varchar(actual
  max length)` up to `varchar_limit`, `text` beyond it, `longtext` when
  the bytes exceed MySQL's 64 KiB TEXT capacity (issues #12/#25).

  With `ordered: true` a leading `csv_ordering_id` BIGINT column is
  prepended, preserving CSV row order in the table.
  """

  alias Csv2sql.Config.FileOverride
  alias Csv2sql.Schema.ColumnSpec
  alias Csv2sql.Schema.Inference
  alias Csv2sql.Schema.TypeCheck

  @ordering_column "csv_ordering_id"
  @mysql_text_bytes 65_535

  @doc "The name of the prepended ordering column (`ordered: true`)."
  @spec ordering_column() :: String.t()
  def ordering_column, do: @ordering_column

  @doc """
  Builds final column specs from headers, the merged accumulator, and
  the file's user overrides (rename / re-type / resize / exclude).

  `position` indexes into the insert row (ordering column included,
  before exclusion filtering — excluded columns leave gaps, and the
  encoder picks values by position); `source_position` is the CSV index
  overrides match on.
  """
  @spec columns([String.t()], Inference.acc(), Csv2sql.Config.t(), FileOverride.t() | nil) ::
          [ColumnSpec.t()]
  def columns(headers, %{columns: column_accs}, config, override \\ nil) do
    headers
    |> repair_headers()
    |> Enum.zip(column_accs)
    |> Enum.with_index()
    |> Enum.map(fn {{{name, original}, acc}, source_position} ->
      {type, length} = resolve_type(acc, config)

      spec = %ColumnSpec{
        source_position: source_position,
        name: name,
        original_name: original,
        type: type,
        length: length,
        max_length: acc.max_length
      }

      apply_override(spec, FileOverride.column(override, source_position))
    end)
    |> maybe_prepend_ordering(config)
    |> Enum.with_index()
    |> Enum.flat_map(fn
      # Positions are assigned BEFORE exclusion filtering — excluded
      # columns leave gaps the encoder skips by picking positions.
      {{spec, true = _included?}, position} -> [%{spec | position: position}]
      {{_spec, false}, _position} -> []
    end)
  end

  defp apply_override(spec, nil), do: {spec, true}

  defp apply_override(spec, column_override) do
    spec =
      spec
      |> maybe_rename(column_override.name)
      |> maybe_retype(column_override.type, column_override.length)

    {spec, column_override.include}
  end

  defp maybe_rename(spec, nil), do: spec
  defp maybe_rename(spec, ""), do: spec
  defp maybe_rename(spec, name), do: %{spec | name: name}

  defp maybe_retype(spec, nil, _length), do: spec

  defp maybe_retype(spec, :varchar, length),
    do: %{spec | type: :varchar, length: length || max(spec.max_length, 1)}

  defp maybe_retype(spec, type, _length), do: %{spec | type: type, length: nil}

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

  defp maybe_prepend_ordering(specs, %{ordered: true}) do
    ordering = %ColumnSpec{
      name: @ordering_column,
      original_name: @ordering_column,
      type: :bigint
    }

    [{ordering, true} | specs]
  end

  defp maybe_prepend_ordering(specs, _config), do: specs

  defp dedupe(base, seen) do
    case seen do
      %{^base => count} -> {"#{base}_#{count}", Map.put(seen, base, count + 1)}
      _new -> {base, Map.put(seen, base, 1)}
    end
  end

  defp resolve_type(%{empty: true}, config), do: {:varchar, config.varchar_limit}
  defp resolve_type(%{boolean: true}, _config), do: {:boolean, nil}

  defp resolve_type(%{integer: true} = acc, config) do
    magnitude = max(abs(acc.int_min || 0), abs(acc.int_max || 0))

    case TypeCheck.integer_tier(sign_extend(acc, magnitude)) do
      :integer -> {:integer, nil}
      :bigint -> {:bigint, nil}
      :too_big -> string_type(acc, config)
    end
  end

  defp resolve_type(%{float: true}, _config), do: {:float, nil}
  defp resolve_type(%{date: true}, _config), do: {:date, nil}
  defp resolve_type(%{datetime: true}, _config), do: {:datetime, nil}
  defp resolve_type(acc, config), do: string_type(acc, config)

  # Tier by the most demanding bound (negative range is one wider).
  defp sign_extend(acc, magnitude) do
    if acc.int_min && acc.int_min < 0, do: -magnitude, else: magnitude
  end

  defp string_type(acc, config) do
    cond do
      acc.max_bytes > @mysql_text_bytes -> {:longtext, nil}
      acc.max_length > config.varchar_limit -> {:text, nil}
      true -> {:varchar, max(acc.max_length, 1)}
    end
  end
end

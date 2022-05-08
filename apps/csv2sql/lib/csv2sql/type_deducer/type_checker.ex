defmodule Csv2sql.TypeDeducer.TypeChecker do
  @moduledoc """
    Type checkers to infer data type of a database column
    using its preivous inferred type and current item type
  """
  use Csv2sql.Types
  alias Csv2sql.Helpers

  @spec check_type(String.t(), type_map()) :: type_map()
  # credo:disable-for-next-line Credo.Check.Refactor.CyclomaticComplexity
  def check_type(item, existing_type_map) do
    item = String.trim(item)

    if is_empty?(item) do
      Map.put(existing_type_map, :is_empty, existing_type_map.is_empty && true)
    else
      %{
        is_empty: existing_type_map.is_empty && is_empty?(item),
        is_date: existing_type_map.is_date && is_date?(item),
        is_datetime: existing_type_map.is_datetime && is_datetime?(item),
        is_boolean: existing_type_map.is_boolean && is_boolean?(item),
        is_integer: existing_type_map.is_integer && is_integer?(item),
        is_float: existing_type_map.is_float && is_float?(item),
        is_text: existing_type_map.is_text || is_text?(item)
      }
    end
  end

  defp is_empty?(""), do: true
  defp is_empty?(_), do: false

  defp is_date?(item) do
    Helpers.get_config(:date_patterns)
    |> Enum.any?(fn pattern -> parse_datetime_pattern(item, pattern) end)
  end

  defp is_datetime?(item) do
    Helpers.get_config(:datetime_patterns)
    |> Enum.any?(fn pattern -> parse_datetime_pattern(item, pattern) end)
  end

  defp is_boolean?(item) when item in ~w(true false), do: true

  defp is_boolean?(item) do
    item
    |> Integer.parse()
    |> case do
      {1, ""} -> true
      {0, ""} -> true
      _ -> false
    end
  end

  defp is_integer?(item) do
    case Integer.parse(item) do
      {item, ""} when item > -2_147_483_648 and item < 2_147_483_647 -> true
      _ -> false
    end
  end

  defp is_float?(item) do
    try do
      case Float.parse(item) do
        {_, ""} ->
          true

        _ ->
          false
      end
    rescue
      _e in ArgumentError -> false
    end
  end

  defp is_text?(item) do
    varchar_limit = Helpers.get_config(:varchar_limit)
    if String.length(item) > varchar_limit, do: true, else: false
  end

  defp parse_datetime_pattern(datetime_string, pattern) do
    case Timex.parse(datetime_string, pattern) do
      {:ok, _} -> true
      {:error, _} -> false
    end
  end
end

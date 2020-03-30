defmodule Csv2sql.SchemaMaker do
  def check_type(item, type) do
    is_empty = type.is_empty && is_empty?(item)
    is_date = type.is_date && is_date?(item)
    is_timestamp = type.is_timestamp && is_timestamp?(item)
    is_boolean = type.is_boolean && is_boolean?(item)
    is_text = is_text?(item)

    %{
      is_empty: is_empty,
      is_date: is_date,
      is_timestamp: is_timestamp,
      is_boolean: is_boolean,
      is_text: is_text
    }
  end

  defp is_empty?(item) do
    item
    |> String.trim()
    |> String.length() == 0
  end

  defp is_date?(item) do
    item = String.trim(item)
    String.length(item) == 10 && Regex.match?(~r/\d\d\d\d-\d\d-\d\d/, item)
  end

  defp is_timestamp?(item) do
    item = String.trim(item)
    String.length(item) == 19 && Regex.match?(~r/\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\d/, item)
  end

  defp is_boolean?(item) do
    item = String.trim(item)

    item
    |> Integer.parse()
    |> case do
      {1, ""} -> String.length(item) == 1 && true
      {0, ""} -> String.length(item) == 1 && true
      _ -> false
    end
  end

  defp is_text?(item) do
    limit = Application.get_env(:csv2sql, Csv2sql.SchemaMaker)[:varchar_limit]

    if String.length(item) > limit, do: true, else: false
  end
end

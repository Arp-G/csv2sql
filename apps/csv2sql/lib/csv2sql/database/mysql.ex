defmodule Csv2sql.Database.MySql do
  @moduledoc """
    MySQL specific functions
  """
  use Csv2sql.Types
  import Csv2sql.Database
  alias Csv2sql.Helpers
  @behaviour Csv2sql.Database

  @impl Csv2sql.Database
  @spec type_mapping(type_map()) :: String.t()
  def type_mapping(type_map) do
    cond do
      type_map[:is_empty] -> "VARCHAR(#{varchar_limit()})"
      type_map[:is_date] -> "DATE"
      type_map[:is_datetime] -> "DATETIME"
      type_map[:is_boolean] -> "BIT"
      type_map[:is_integer] -> "INT"
      type_map[:is_float] -> "DOUBLE"
      type_map[:is_text] -> "LONGTEXT"
      true -> "VARCHAR(#{varchar_limit()})"
    end
  end

  @impl Csv2sql.Database
  @spec db_name :: String.t()
  def db_name do
    %MyXQL.Result{rows: [[db_name]]} = run_query!("SELECT DATABASE();")

    if db_name == "" || is_nil(db_name), do: raise("Postgres database name not found")

    db_name
  end

  @impl Csv2sql.Database
  @spec column_name_delimiter :: <<_::8>>
  def column_name_delimiter, do: "`"

  @impl Csv2sql.Database
  @spec encode(String.t(), String.t()) :: supported_db_data_types()
  def encode(type, data) do
    case type do
      <<"VARCHAR"::binary, _offset::binary>> -> data
      "LONGTEXT" -> data
      "INT" -> String.to_integer(data)
      "BIT" -> if data == "0" || data == "false", do: 0, else: 1
      "DATE" -> Helpers.format_datetime(data, true) |> to_date_string()
      "DATETIME" -> Helpers.format_datetime(data, false) |> to_datetime_string()
      _ -> data
    end
  end

  @impl Csv2sql.Database
  @spec get_ordering_column_type :: String.t()
  def get_ordering_column_type(), do: "INT UNSIGNED"

  defp to_date_string(%DateTime{} = datetime),
    do: datetime |> DateTime.to_date() |> to_datetime_string()

  defp to_date_string(val), do: val

  defp to_datetime_string(%DateTime{} = datetime),
    do: datetime |> DateTime.to_string() |> String.trim_trailing("Z")

  defp to_datetime_string(val), do: val
end

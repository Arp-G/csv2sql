defmodule Csv2sql.Database.MySql do
  @moduledoc """
    MySQL specific functions
  """
  use Csv2sql.Types
  import Csv2sql.Database
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
      type_map[:is_text] -> "TEXT"
      true -> "VARCHAR(#{varchar_limit()})"
    end
  end

  @impl Csv2sql.Database
  @spec db_name :: String.t()
  def db_name do
    %MyXQL.Result{rows: [[db_name]]} = Database.run_query!("SELECT DATABASE();")

    if db_name == "" || is_nil(db_name), do: raise("Postgres database name not found")

    db_name
  end

  @impl Csv2sql.Database
  @spec column_name_delimiter :: <<_::8>>
  def column_name_delimiter, do: "`"
end

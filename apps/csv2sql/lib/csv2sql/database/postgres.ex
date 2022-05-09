defmodule Csv2sql.Database.Postgres do
  @moduledoc """
    Postgres specific functions
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
      type_map[:is_datetime] -> "TIMESTAMP"
      type_map[:is_boolean] -> "BOOLEAN"
      type_map[:is_integer] -> "INT"
      type_map[:is_float] -> "NUMERIC(1000, 100)"
      type_map[:is_text] -> "TEXT"
      true -> "VARCHAR(#{varchar_limit()})"
    end
  end

  @impl Csv2sql.Database
  @spec db_name :: String.t()
  def db_name do
    %Postgrex.Result{rows: [[db_name]]} =
      Ecto.Adapters.SQL.query!(get_repo(:postgres), "SELECT current_database();")

    if db_name == "" || is_nil(db_name), do: raise("Postgres database name not found")

    db_name
  end
end

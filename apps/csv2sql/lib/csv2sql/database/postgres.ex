defmodule Csv2sql.Database.Postgres do
  @moduledoc """
    Postgres specific functions
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
    %Postgrex.Result{rows: [[db_name]]} = run_query!("SELECT CURRENT_DATABASE();")

    if db_name == "" || is_nil(db_name), do: raise("Postgres database name not found")

    # TODO: Get schema name from user maybe?
    "#{db_name}.public"
  end

  @impl Csv2sql.Database
  @spec column_name_delimiter :: <<_::8>>
  def column_name_delimiter, do: "\""

  @impl Csv2sql.Database
  @spec encode(String.t(), String.t()) :: supported_db_data_types()
  def encode(type, data) do
    case type do
      <<"VARCHAR"::binary, _offset::binary>> ->
        data

      "TEXT" ->
        data

      "INT" ->
        String.to_integer(data)

      <<"NUMERIC"::binary, _offset::binary>> ->
        {data, ""} = Float.parse(data)
        data

      "BOOLEAN" ->
        if data == "0" || data == "false", do: false, else: true

      "DATE" ->
        Helpers.format_datetime(data, true)

      "TIMESTAMP" ->
        Helpers.format_datetime(data, false)

      _ ->
        data
    end
  end
end

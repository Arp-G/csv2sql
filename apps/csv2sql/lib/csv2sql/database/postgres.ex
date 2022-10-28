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
      true -> type_map[:max_data_length] |> string_column_type() |> get_string_column_type()
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
  @spec delimiter :: <<_::8>>
  def delimiter, do: "\""

  @impl Csv2sql.Database
  @spec encode(String.t(), String.t()) :: supported_db_data_types()
  def encode(type, data) do
    case type do
      <<"VARCHAR"::binary, _offset::binary>> ->
        encode_binary(data)

      "TEXT" ->
        encode_binary(data)

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

  @impl Csv2sql.Database
  @spec get_ordering_column_type :: String.t()
  def get_ordering_column_type(), do: "INT"

  # Private helpers
  defp get_string_column_type(:text), do: "TEXT"
  defp get_string_column_type({:varchar, 0}), do: "VARCHAR(#{varchar_limit()})"
  defp get_string_column_type({:varchar, size}), do: "VARCHAR(#{size})"
end

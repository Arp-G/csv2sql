defmodule Csv2sql.Database do
  @moduledoc """
    Database specific functions
  """
  use Csv2sql.Types
  alias Csv2sql.Helpers
  import ShorterMaps

  # Public functions
  def start_repo() do
    repo =
      Helpers.get_config(:db_type)
      |> get_repo()

    repo.start_link(
      url: Helpers.get_config(:db_url),
      pool_size: 15,
      log: Helpers.get_config(:log)
    )
  end

  @spec run_query!(String.t()) :: db_result_types()
  def run_query!(query) do
    Helpers.get_config(:db_type)
    |> get_repo()
    |> run_query!(query)
  end

  @spec run_query!(atom(), String.t()) :: db_result_types()
  def run_query!(repo, query) do
    Ecto.Adapters.SQL.query!(repo, query)
  end

  @spec get_repo(:mysql | :postgres) :: Csv2sql.MySQLRepo | Csv2sql.PostgresRepo
  def get_repo(:mysql), do: Csv2sql.MySQLRepo
  def get_repo(:postgres), do: Csv2sql.PostgreSQLRepo

  @spec varchar_limit :: pos_integer()
  def varchar_limit, do: Helpers.get_config(:varchar_limit)

  @spec get_db_type(type_map()) :: String.t()
  def get_db_type(type_map), do: get_db_module().type_mapping(type_map)

  @spec get_db_name() :: String.t()
  def get_db_name(), do: get_db_module().db_name()

  @spec get_create_table_ddl(String.t(), String.t(), csv_col_types_list()) :: String.t()
  def get_create_table_ddl(file_path, db_name, column_types) do
    table_name = get_table_name(file_path)
    qq = get_db_module().column_name_delimiter()

    column_defs =
      column_types
      |> Enum.map_join(", ", fn {column_name, column_type} ->
        "#{qq}#{column_name}#{qq} #{column_type}"
      end)

    "CREATE TABLE #{db_name}.#{table_name} (#{column_defs});"
  end

  @spec get_drop_table_ddl(String.t(), String.t()) :: String.t()
  def get_drop_table_ddl(file_path, db_name),
    do: "DROP TABLE IF EXISTS #{db_name}.#{get_table_name(file_path)};"

  def insert_data_chunk(~M{%Csv2sql.File name, column_types}, data_chunk) do
    encoded_data_chunk = encode_data_chunk(column_types, data_chunk)
    repo = Helpers.get_config(:db_type) |> get_repo()

    # Todo: Handle and log insertion errors gracefully
    repo.insert_all(name, encoded_data_chunk)
  end

  # Callbacks to implement
  @callback type_mapping(type_map()) :: String.t()

  @callback db_name() :: String.t()

  @callback encode(String.t(), String.t()) :: supported_db_data_types()

  @callback column_name_delimiter :: <<_::8>>

  # Private helpers
  defp get_db(:mysql), do: Csv2sql.Database.MySql
  defp get_db(:postgres), do: Csv2sql.Database.Postgres

  defp get_db_module(), do: get_db(Helpers.get_config(:db_type))

  defp get_table_name(file_path) do
    file_path
    |> Path.basename()
    |> String.downcase()
    |> String.trim_trailing()
    |> String.trim_trailing(".csv")
  end

  defp encode_data_chunk(column_types, data_chunk) do
    data_chunk
    |> Enum.map(fn row ->
      Enum.zip_with(
        column_types,
        row,
        fn {header, type}, data ->
          {header, encode(type, data)}
        end
      )
    end)
  end

  defp encode(<<"VARCHAR"::binary, _offset::binary>>, ""), do: ""
  defp encode("TEXT", ""), do: nil
  defp encode(_type, ""), do: nil
  defp encode(type, data), do: get_db_module().encode(type, data)
end

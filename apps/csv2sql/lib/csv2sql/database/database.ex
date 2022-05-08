defmodule Csv2sql.Database do
  @moduledoc """
    Database specific functions
  """
  use Csv2sql.Types
  alias Csv2sql.Helpers

  # Public functions
  @spec get_repo(:mysql | :postgres) :: Csv2sql.MySQLRepo | Csv2sql.PostgresRepo
  def get_repo(:mysql), do: Csv2sql.MySQLRepo
  def get_repo(:postgres), do: Csv2sql.PostgreSQLRepo

  @spec varchar_limit :: pos_integer()
  def varchar_limit, do: Helpers.get_config(:varchar_limit)

  @spec get_db_type(type_map()) :: String.t()
  def get_db_type(type_map), do: get_db_module().type_mapping(type_map)

  @spec get_db_name() :: String.t()
  def get_db_name(), do: get_db_module().db_name()

  # Callbacks to implement
  @callback(type_mapping(type_map()) :: String.t())

  @callback db_name() :: String.t()

  # Private helpers
  defp get_db(:mysql), do: Csv2sql.Database.MySql
  defp get_db(:postgres), do: Csv2sql.Database.Postgres

  defp get_db_module(), do: get_db(Helpers.get_config(:db_type))
end

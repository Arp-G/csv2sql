defmodule Csv2sql.DB do
  require Logger

  @database Application.get_env(:csv2sql, Csv2sql.DB)[:database]
  def make_db_schema([drop_query, create_query]) do
    # tobe be moved
    MyXQL.query!(:myxql, "set sql_mode='NO_ZERO_IN_DATE';")

    "DROP TABLE IF EXISTS #{@database}." <> table_name = drop_query
    table_name = String.trim_trailing(table_name, ";")
    execute_query(drop_query)
    execute_query(create_query)
    Logger.debug("Create Schema for: #{table_name}")
  end

  defp execute_query(query) do
    MyXQL.query!(:myxql, query)
  end
end

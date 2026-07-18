defmodule Csv2sql.Adapters.Postgres do
  @moduledoc """
  PostgreSQL adapter on `Postgrex` (no Ecto repos).

  Dialect notes: double-quoted identifiers, `$n` placeholders, real
  `DATE`/`TIMESTAMP` types (an intentional improvement over v3, which fell
  back to VARCHAR on Postgres).
  """

  use Csv2sql.Adapter

  alias Csv2sql.Config.Db

  @impl true
  def pool_spec(%Db{} = db, opts) do
    start_opts =
      Db.conn_opts(db) ++
        [
          name: Keyword.fetch!(opts, :name),
          pool_size: Keyword.fetch!(opts, :pool_size),
          # The pipeline surfaces connection errors as run/file errors;
          # Postgrex's own crash-logging would only add noise.
          backoff_type: :stop
        ]

    %{
      id: :db_pool,
      start: {Postgrex, :start_link, [start_opts]},
      restart: :temporary
    }
  end

  @impl true
  def quote_ident(name), do: [?", String.replace(name, "\"", "\"\""), ?"]

  @impl true
  def sql_type({:varchar, length}), do: "VARCHAR(#{length})"
  def sql_type(:text), do: "TEXT"
  def sql_type(:longtext), do: "TEXT"
  def sql_type(:integer), do: "INTEGER"
  def sql_type(:bigint), do: "BIGINT"
  def sql_type(:float), do: "DOUBLE PRECISION"
  def sql_type(:boolean), do: "BOOLEAN"
  def sql_type(:date), do: "DATE"
  def sql_type(:datetime), do: "TIMESTAMP"

  @impl true
  def placeholder(index), do: "$#{index}"

  @impl true
  def query(conn, sql, params) do
    case Postgrex.query(conn, sql, params) do
      {:ok, %Postgrex.Result{num_rows: num_rows, rows: rows}} ->
        {:ok, %{num_rows: num_rows, rows: rows}}

      {:error, error} ->
        {:error, error}
    end
  end
end

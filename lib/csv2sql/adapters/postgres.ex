defmodule Csv2sql.Adapters.Postgres do
  @moduledoc """
  PostgreSQL adapter on `Postgrex` (no Ecto repos). Supports PostgreSQL 12+.

  Dialect notes: double-quoted identifiers, `$n` placeholders, real
  `DATE`/`TIMESTAMP` types (an intentional improvement over v3, which fell
  back to VARCHAR on Postgres). Databases are **not** auto-created —
  `ensure_database/1` verifies and reports clearly.
  """

  use Csv2sql.Adapter

  alias Csv2sql.Adapters.Probe
  alias Csv2sql.Config.Db

  @impl true
  def pool_spec(%Db{} = db, opts) do
    start_opts =
      Db.conn_opts(db) ++
        [
          name: Keyword.fetch!(opts, :name),
          pool_size: Keyword.fetch!(opts, :pool_size)
        ]

    %{
      id: :db_pool,
      start: {Postgrex, :start_link, [start_opts]},
      restart: :temporary
    }
  end

  @impl true
  def ensure_database(%Db{} = db) do
    # Pool start always succeeds (connections are async), so the only
    # honest verification is running a query — isolated, because a probe
    # pool takes its starter down when the connection dies. When it
    # fails, a check against the maintenance database turns the generic
    # connection error into a precise "database not found".
    case Probe.isolated(fn -> probe(Db.conn_opts(db)) end) do
      :ok -> :ok
      {:error, direct_error} -> classify_missing(db, direct_error)
    end
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

  defp probe(opts) do
    {:ok, conn} = Postgrex.start_link(opts ++ [backoff_type: :stop, pool_size: 1])

    result =
      case Postgrex.query(conn, "SELECT 1", [], timeout: 5_000) do
        {:ok, _result} -> :ok
        {:error, error} -> {:error, error}
      end

    Probe.safe_stop(conn)
    result
  end

  defp classify_missing(%Db{} = db, direct_error) do
    database = Db.database(db)

    case Probe.isolated(fn -> database_listed?(db, database) end) do
      {:ok, false} -> {:error, {:database_not_found, database}}
      _other -> {:error, direct_error}
    end
  end

  defp database_listed?(%Db{} = db, database) do
    opts = db |> Db.conn_opts() |> Keyword.put(:database, "postgres")
    {:ok, conn} = Postgrex.start_link(opts ++ [backoff_type: :stop, pool_size: 1])

    result =
      case Postgrex.query(conn, "SELECT 1 FROM pg_database WHERE datname = $1", [database],
             timeout: 5_000
           ) do
        {:ok, %Postgrex.Result{rows: rows}} -> {:ok, rows != []}
        {:error, error} -> {:error, error}
      end

    Probe.safe_stop(conn)
    result
  end

  @row_data_codes [
    :invalid_text_representation,
    :numeric_value_out_of_range,
    :string_data_right_truncation,
    :datetime_field_overflow,
    :character_not_in_repertoire,
    :untranslatable_character,
    :not_null_violation,
    :check_violation,
    :unique_violation,
    :foreign_key_violation
  ]
  @transient_codes [:deadlock_detected, :serialization_failure, :lock_not_available]

  @impl true
  def classify_error(%Postgrex.Error{postgres: %{code: code}}) when code in @row_data_codes,
    do: :row_data

  def classify_error(%Postgrex.Error{postgres: %{code: code}}) when code in @transient_codes,
    do: :transient

  def classify_error(%DBConnection.ConnectionError{}), do: :connection
  def classify_error(_error), do: :fatal

  @impl true
  def table_exists?(conn, table) do
    sql =
      "SELECT 1 FROM information_schema.tables " <>
        "WHERE table_schema = 'public' AND table_name = $1"

    case query(conn, sql, [table]) do
      {:ok, %{rows: rows}} -> rows != []
      {:error, _error} -> false
    end
  end
end

defmodule Csv2sql.Adapters.MySql do
  @moduledoc """
  MySQL adapter on `MyXQL` (no Ecto repos). Supports MySQL 5.7+.

  Dialect notes: backtick identifiers, `?` placeholders, `utf8mb4` with
  `utf8mb4_general_ci` (portable to 5.7 — no MySQL-8 `0900` collations),
  booleans as `TINYINT(1)` (a documented change from v3's `BIT`, which
  returns bitstrings and breaks aggregate validation).

  The target database is auto-created (`ensure_database/1`, v3 parity).
  Every pooled connection strips `NO_ZERO_DATE`/`NO_ZERO_IN_DATE` from its
  **session** `sql_mode` (upstream issue #5 — v3 used `SET GLOBAL`, which
  requires SUPER). The server's `@@max_allowed_packet` bounds insert
  chunk bytes (upstream issue #21).
  """

  use Csv2sql.Adapter

  alias Csv2sql.Adapters.Probe
  alias Csv2sql.Config.Db

  @fallback_packet_bytes 4_194_304

  @impl true
  def pool_spec(%Db{} = db, opts) do
    start_opts =
      Db.conn_opts(db) ++
        [
          name: Keyword.fetch!(opts, :name),
          pool_size: Keyword.fetch!(opts, :pool_size),
          charset: "utf8mb4",
          after_connect: &configure_session/1
        ]

    %{
      id: :db_pool,
      start: {MyXQL, :start_link, [start_opts]},
      restart: :temporary
    }
  end

  @doc """
  Session setup run on every pooled connection: removes
  `NO_ZERO_DATE`/`NO_ZERO_IN_DATE` from the session `sql_mode` so legacy
  zero-dates in CSVs cannot poison inserts (issue #5) — session-scoped,
  no SUPER privilege needed.
  """
  @spec configure_session(DBConnection.t() | pid()) :: :ok
  def configure_session(conn) do
    with {:ok, %MyXQL.Result{rows: [[modes]]}} <-
           MyXQL.query(conn, "SELECT @@SESSION.sql_mode", []) do
      cleaned =
        modes
        |> String.split(",", trim: true)
        |> Enum.reject(&(&1 in ["NO_ZERO_DATE", "NO_ZERO_IN_DATE"]))
        |> Enum.join(",")

      MyXQL.query(conn, "SET SESSION sql_mode = ?", [cleaned])
    end

    :ok
  end

  @impl true
  def ensure_database(%Db{} = db) do
    Probe.isolated(fn -> create_database(db) end)
  end

  defp create_database(%Db{} = db) do
    database = Db.database(db)

    opts =
      db
      |> Db.conn_opts()
      |> Keyword.delete(:database)
      |> Keyword.merge(backoff_type: :stop, pool_size: 1)

    sql =
      IO.iodata_to_binary([
        "CREATE DATABASE IF NOT EXISTS ",
        quote_ident(database),
        " CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci"
      ])

    {:ok, conn} = MyXQL.start_link(opts)

    result =
      case MyXQL.query(conn, sql, [], timeout: 5_000) do
        {:ok, _result} -> :ok
        {:error, error} -> {:error, error}
      end

    Probe.safe_stop(conn)
    result
  end

  @impl true
  def quote_ident(name), do: [?`, String.replace(name, "`", "``"), ?`]

  @impl true
  def sql_type({:varchar, length}), do: "VARCHAR(#{length})"
  def sql_type(:text), do: "TEXT"
  def sql_type(:longtext), do: "LONGTEXT"
  def sql_type(:integer), do: "INT"
  def sql_type(:bigint), do: "BIGINT"
  def sql_type(:float), do: "DOUBLE"
  def sql_type(:boolean), do: "TINYINT(1)"
  def sql_type(:date), do: "DATE"
  def sql_type(:datetime), do: "DATETIME"

  @impl true
  def placeholder(_index), do: "?"

  @impl true
  def table_options, do: " ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci"

  @impl true
  def query(conn, sql, params) do
    case MyXQL.query(conn, sql, params) do
      {:ok, %MyXQL.Result{num_rows: num_rows, rows: rows}} ->
        {:ok, %{num_rows: num_rows, rows: rows}}

      {:error, error} ->
        {:error, error}
    end
  end

  @impl true
  def max_packet_bytes(conn) do
    case query(conn, "SELECT @@max_allowed_packet", []) do
      {:ok, %{rows: [[bytes]]}} when is_integer(bytes) and bytes > 0 -> bytes
      _other -> @fallback_packet_bytes
    end
  end

  @impl true
  def table_exists?(conn, table) do
    sql =
      "SELECT 1 FROM information_schema.tables " <>
        "WHERE table_schema = DATABASE() AND table_name = ?"

    case query(conn, sql, [table]) do
      {:ok, %{rows: rows}} -> rows != []
      {:error, _error} -> false
    end
  end
end

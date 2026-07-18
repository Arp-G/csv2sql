defmodule Csv2sql.Adapter do
  @moduledoc """
  The database adapter contract.

  The engine speaks abstract column types and calls these callbacks for
  everything database-specific. `use Csv2sql.Adapter` injects default
  implementations (marked below) built from the adapter's own primitives —
  adapters override only what their dialect needs.

  Walking-skeleton scope: connection pool, dialect quoting/types, DDL, and
  multi-VALUES inserts. Later stages extend the contract (session setup,
  error classification, packet limits, fingerprint SQL) without touching
  call sites.
  """

  alias Csv2sql.Config.Db
  alias Csv2sql.Schema.ColumnSpec

  @typedoc "A connection handle: pid, name, or via-tuple of the driver pool."
  @type conn :: pid() | atom() | {:via, module(), term()}

  @type query_result :: %{num_rows: non_neg_integer(), rows: [[term()]] | nil}

  @doc "Child spec for the run-owned connection pool."
  @callback pool_spec(Db.t(), Keyword.t()) :: Supervisor.child_spec()

  @doc "Quotes an identifier for the dialect."
  @callback quote_ident(String.t()) :: iodata()

  @doc "Maps an abstract type to dialect SQL."
  @callback sql_type(ColumnSpec.abstract_type()) :: iodata()

  @doc "The positional parameter placeholder (1-based index)."
  @callback placeholder(pos_integer()) :: iodata()

  @doc "Runs a query, returning a normalized result."
  @callback query(conn(), iodata(), [term()]) :: {:ok, query_result()} | {:error, Exception.t()}

  @doc "CREATE TABLE IF NOT EXISTS statement. *(default provided)*"
  @callback create_table_sql(String.t(), [ColumnSpec.t()]) :: iodata()

  @doc "DROP TABLE IF EXISTS statement. *(default provided)*"
  @callback drop_table_sql(String.t()) :: iodata()

  @doc "Inserts encoded rows, returning the driver-reported count. *(default provided)*"
  @callback insert_rows(conn(), String.t(), [ColumnSpec.t()], [[term()]]) ::
              {:ok, non_neg_integer()} | {:error, Exception.t()}

  @doc "Exact row count of a table. *(default provided)*"
  @callback exact_count(conn(), String.t()) :: {:ok, non_neg_integer()} | {:error, Exception.t()}

  defmacro __using__(_opts) do
    quote do
      @behaviour Csv2sql.Adapter

      alias Csv2sql.Schema.ColumnSpec

      @impl Csv2sql.Adapter
      def create_table_sql(table, columns) do
        column_defs =
          Enum.map_join(columns, ", ", fn %ColumnSpec{} = column ->
            IO.iodata_to_binary([
              quote_ident(column.name),
              " ",
              column |> ColumnSpec.abstract_type() |> sql_type(),
              " NULL"
            ])
          end)

        IO.iodata_to_binary([
          "CREATE TABLE IF NOT EXISTS ",
          quote_ident(table),
          " (",
          column_defs,
          ")"
        ])
      end

      @impl Csv2sql.Adapter
      def drop_table_sql(table) do
        IO.iodata_to_binary(["DROP TABLE IF EXISTS ", quote_ident(table)])
      end

      @impl Csv2sql.Adapter
      def insert_rows(conn, table, columns, rows)

      def insert_rows(_conn, _table, _columns, []), do: {:ok, 0}

      def insert_rows(conn, table, columns, rows) do
        column_count = length(columns)

        columns_sql =
          Enum.map_join(columns, ", ", fn column ->
            IO.iodata_to_binary(quote_ident(column.name))
          end)

        values_sql =
          rows
          |> Enum.with_index()
          |> Enum.map_join(", ", fn {_row, row_index} ->
            placeholders =
              Enum.map_join(1..column_count, ", ", fn column_index ->
                IO.iodata_to_binary(placeholder(row_index * column_count + column_index))
              end)

            "(" <> placeholders <> ")"
          end)

        sql =
          IO.iodata_to_binary([
            "INSERT INTO ",
            quote_ident(table),
            " (",
            columns_sql,
            ") VALUES ",
            values_sql
          ])

        case query(conn, sql, Enum.concat(rows)) do
          {:ok, %{num_rows: inserted}} -> {:ok, inserted}
          {:error, error} -> {:error, error}
        end
      end

      @impl Csv2sql.Adapter
      def exact_count(conn, table) do
        sql = IO.iodata_to_binary(["SELECT COUNT(*) FROM ", quote_ident(table)])

        case query(conn, sql, []) do
          {:ok, %{rows: [[count]]}} -> {:ok, count}
          {:error, error} -> {:error, error}
        end
      end

      defoverridable create_table_sql: 2, drop_table_sql: 1, insert_rows: 4, exact_count: 2
    end
  end
end

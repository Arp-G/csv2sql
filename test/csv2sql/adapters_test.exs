defmodule Csv2sql.Adapters.PostgresTest do
  # Runs only when the postgres parameter set is selected (always, locally
  # and in CI).
  use Csv2sql.EngineCase, async: true, parameterize: Csv2sql.EngineCase.db_parameters(:postgres)

  alias Csv2sql.Adapters.Postgres
  alias Csv2sql.Config.Db

  @moduletag :db
  # Probe connections against missing databases legitimately log
  # connection errors — keep them out of the suite output.
  @moduletag capture_log: true

  test "ensure_database verifies the database and reports a missing one", ctx do
    ok_db = %Db{adapter: :postgres, url: ctx.db_url}
    assert :ok = Postgres.ensure_database(ok_db)

    missing = %Db{
      adapter: :postgres,
      url: String.replace(ctx.db_url, ~r{/[^/]+$}, "/csv2sql_definitely_missing")
    }

    assert {:error, {:database_not_found, "csv2sql_definitely_missing"}} =
             Postgres.ensure_database(missing)
  end
end

defmodule Csv2sql.Adapters.MySqlTest do
  # Runs only when MySQL is selected (CSV2SQL_TEST_ADAPTERS or a locally
  # reachable server); otherwise the module runs zero times.
  use Csv2sql.EngineCase, async: true, parameterize: Csv2sql.EngineCase.db_parameters(:mysql)

  alias Csv2sql.Adapters.MySql
  alias Csv2sql.Config.Db

  @moduletag :db

  test "ensure_database auto-creates the target database (idempotently)", ctx do
    database = unique_name("csv2sql_created")
    url = String.replace(ctx.db_url, ~r{/[^/?]+(\?|$)}, "/#{database}\\1")
    db = %Db{adapter: :mysql, url: url}

    assert :ok = MySql.ensure_database(db)
    assert :ok = MySql.ensure_database(db)

    on_exit(fn ->
      opts = Db.conn_opts(%Db{adapter: :mysql, url: ctx.db_url}) ++ [pool_size: 1]
      {:ok, conn} = MyXQL.start_link(opts)
      MyXQL.query(conn, "DROP DATABASE IF EXISTS `#{database}`", [])
      GenServer.stop(conn)
    end)
  end

  test "pooled connections get a session sql_mode without NO_ZERO modes", ctx do
    opts = Db.conn_opts(%Db{adapter: :mysql, url: ctx.db_url}) ++ [pool_size: 1]
    {:ok, conn} = MyXQL.start_link(opts)

    :ok = MySql.configure_session(conn)
    %MyXQL.Result{rows: [[modes]]} = MyXQL.query!(conn, "SELECT @@SESSION.sql_mode", [])

    refute modes =~ "NO_ZERO_DATE"
    refute modes =~ "NO_ZERO_IN_DATE"
    GenServer.stop(conn)
  end

  test "max_packet_bytes probes a sane server value", ctx do
    opts = Db.conn_opts(%Db{adapter: :mysql, url: ctx.db_url}) ++ [pool_size: 1]
    {:ok, conn} = MyXQL.start_link(opts)

    packet = MySql.max_packet_bytes(conn)
    assert packet >= 1_048_576

    GenServer.stop(conn)
  end
end

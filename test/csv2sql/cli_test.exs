defmodule Csv2sql.CliTest do
  # Mutates CSV2SQL_* env vars — must not run concurrently.
  use ExUnit.Case, async: false

  import Csv2sql.EngineCase, only: [csv!: 3, unique_name: 1, test_db_url: 1]
  import ExUnit.CaptureIO

  alias Csv2sql.Cli

  @moduletag :db
  @moduletag :tmp_dir

  @env ~w(CSV2SQL_SOURCE_DIR CSV2SQL_DB_URL CSV2SQL_DB_PASSWORD CSV2SQL_STRICT)

  setup do
    saved = Map.new(@env, &{&1, System.get_env(&1)})
    Enum.each(@env, &System.delete_env/1)

    on_exit(fn ->
      Enum.each(saved, fn
        {var, nil} -> System.delete_env(var)
        {var, value} -> System.put_env(var, value)
      end)
    end)

    :ok
  end

  defp drop!(table) do
    ctx = %{db_adapter: :postgres, db_url: test_db_url(:postgres)}
    Csv2sql.EngineCase.drop_table!(ctx, table)
  end

  test "import: happy path exits 0 and reports", %{tmp_dir: dir} do
    table = unique_name("cli_ok")
    csv!(dir, table <> ".csv", [~w(id name), ["1", "a"], ["2", "b"]])
    on_exit(fn -> drop!(table) end)

    {code, output} =
      with_io(fn ->
        Cli.main(["import", "--source-dir", dir, "--db-url", test_db_url(:postgres)])
      end)

    assert code == 0
    assert output =~ "1 file(s) discovered"
    assert output =~ "✓ #{table}.csv — 2 rows"
    assert output =~ "completed"
    assert output =~ "report:"

    ctx = %{db_adapter: :postgres, db_url: test_db_url(:postgres)}
    assert Csv2sql.EngineCase.count!(ctx, table) == 2
  end

  test "analyze: prints the inferred schema and exits 0", %{tmp_dir: dir} do
    table = unique_name("cli_dry")
    csv!(dir, table <> ".csv", [~w(id note), ["7", "hello"]])

    {code, output} =
      with_io(fn -> Cli.main(["analyze", "--source-dir", dir]) end)

    assert code == 0
    assert output =~ "table #{table} (#{table}.csv, 1 rows)"
    assert output =~ "id    integer"
    assert output =~ "note  varchar(5)"
  end

  test "rejected rows exit 1", %{tmp_dir: dir} do
    table = unique_name("cli_rejects")

    csv!(dir, table <> ".csv", [
      ~w(id name),
      ["1", "fine"],
      ["2", <<0xFF, 0xFE>>]
    ])

    on_exit(fn -> drop!(table) end)

    {code, output} =
      with_io(fn ->
        Cli.main(["import", "--source-dir", dir, "--db-url", test_db_url(:postgres)])
      end)

    assert code == 1
    assert output =~ "1 row(s) rejected"
  end

  test "configuration errors exit 3 with messages", %{tmp_dir: dir} do
    {code, output} =
      with_io(:stderr, fn -> Cli.main(["import", "--source-dir", dir]) end)

    assert code == 3
    assert output =~ "configuration is invalid"
    assert output =~ "db: can't be blank"
  end

  test "unknown flags exit 3", %{tmp_dir: dir} do
    {code, output} =
      with_io(:stderr, fn -> Cli.main(["import", "--source-dir", dir, "--wat"]) end)

    assert code == 3
    assert output =~ "invalid option"
  end

  test "env vars supply config; flags win over env", %{tmp_dir: dir} do
    env_dir = Path.join(dir, "env_src")
    flag_dir = Path.join(dir, "flag_src")
    File.mkdir_p!(env_dir)
    File.mkdir_p!(flag_dir)

    env_table = unique_name("cli_env")
    flag_table = unique_name("cli_flag")
    csv!(env_dir, env_table <> ".csv", [~w(id), ["1"]])
    csv!(flag_dir, flag_table <> ".csv", [~w(id), ["1"], ["2"]])
    on_exit(fn -> Enum.each([env_table, flag_table], &drop!/1) end)

    System.put_env("CSV2SQL_SOURCE_DIR", env_dir)
    System.put_env("CSV2SQL_DB_URL", test_db_url(:postgres))

    # Env alone drives the run.
    {code, _output} = with_io(fn -> Cli.main(["import"]) end)
    assert code == 0
    ctx = %{db_adapter: :postgres, db_url: test_db_url(:postgres)}
    assert Csv2sql.EngineCase.count!(ctx, env_table) == 1

    # A flag overrides the env source dir.
    {code, _output} = with_io(fn -> Cli.main(["import", "--source-dir", flag_dir]) end)
    assert code == 0
    assert Csv2sql.EngineCase.count!(ctx, flag_table) == 2
  end

  test "CSV2SQL_DB_PASSWORD fills a password-less URL", %{tmp_dir: dir} do
    table = unique_name("cli_pass")
    csv!(dir, table <> ".csv", [~w(id), ["1"]])
    on_exit(fn -> drop!(table) end)

    uri = URI.parse(test_db_url(:postgres))
    [user, password] = String.split(uri.userinfo, ":", parts: 2)
    passwordless = URI.to_string(%{uri | userinfo: user})

    System.put_env("CSV2SQL_DB_PASSWORD", password)

    {code, _output} =
      with_io(fn -> Cli.main(["import", "--source-dir", dir, "--db-url", passwordless]) end)

    assert code == 0
  end

  test "help and version exit 0" do
    {code, output} = with_io(fn -> Cli.main(["--help"]) end)
    assert code == 0
    assert output =~ "Usage:"

    {code, output} = with_io(fn -> Cli.main(["--version"]) end)
    assert code == 0
    assert output =~ "csv2sql 5.0.0-dev"
  end
end

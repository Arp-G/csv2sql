defmodule Csv2sql.DatabaseTest do
  @moduledoc false

  use Csv2sql.Support.TestHelper
  alias Csv2sql.{Database, Database.MySql, Database.Postgres}

  setup_all do
    start_repos()
  end

  describe "run_query/1" do
    db_test "attemps to runs given query string" do
      assert match?(%{rows: [[1]]}, Database.run_query!("SELECT 1"))
    end
  end

  describe "run_query/2" do
    db_test "attemps to runs given query string" do
      assert match?(
               %{rows: [[1]]},
               Csv2sql.Helpers.get_config(:db_type)
               |> Database.get_repo()
               |> Database.run_query!("SELECT 1")
             )
    end
  end

  describe "get_repo/1" do
  end

  describe "varchar_limit/0" do
  end

  describe "get_db_type/1" do
  end

  describe "get_db_name/0" do
  end

  describe "get_create_table_ddl/3" do
  end

  describe "get_drop_table_ddl/3" do
  end

  # Callback tests
  [MySql, Postgres]
  |> Enum.map(fn db_module ->
    describe "#{db_module}: type_mapping/1" do
    end

    describe "#{db_module}: db_name/0" do
    end

    describe "#{db_module}: column_name_delimiter/0" do
    end
  end)
end

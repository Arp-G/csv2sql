defmodule Csv2sql.DatabaseTest do
  @moduledoc false

  use Csv2sql.Support.TestHelper
  alias Csv2sql.Database

  @type_map %{
    is_empty: false,
    is_date: false,
    is_datetime: false,
    is_boolean: false,
    is_integer: false,
    is_float: false,
    is_text: false
  }

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
    test "returns mysql repo" do
      assert Database.get_repo(:mysql) == Csv2sql.MySQLRepo
    end

    test "returns postgres repo" do
      assert Database.get_repo(:postgres) == Csv2sql.PostgreSQLRepo
    end
  end

  describe "varchar_limit/0" do
    test "returns varchar limit" do
      assert Database.varchar_limit() == Csv2sql.Helpers.get_config(:varchar_limit)
    end
  end

  describe "get_db_type/1" do
    db_test "returns correct column type mapping" do
      varchar_limit = Csv2sql.Helpers.get_config(:varchar_limit)
      db_type = Csv2sql.Helpers.get_config(:db_type)

      db_type_mappings = %{
        is_empty: "VARCHAR(#{varchar_limit})",
        is_date: "DATE",
        is_datetime: "DATETIME",
        is_boolean: "BIT",
        is_integer: "INT",
        is_float: "DOUBLE",
        is_text: "LONGTEXT"
      }

      db_type_mappings =
        if db_type == :postgres,
          do:
            Map.merge(db_type_mappings, %{
              is_text: "TEXT",
              is_datetime: "TIMESTAMP",
              is_boolean: "BOOLEAN",
              is_float: "NUMERIC(1000, 100)"
            }),
          else: db_type_mappings

      @type_map
      |> Enum.each(fn {key, _value} ->
        updated_type_map = @type_map |> Map.put(key, true)

        assert Database.get_db_type(updated_type_map) ==
                 Map.get(db_type_mappings, key, "VARCHAR(#{varchar_limit})")
      end)
    end

    db_test "when date and datetime returns date" do
      date_and_datetime = Map.merge(@type_map, %{is_date: true, is_datetime: true})

      assert Database.get_db_type(date_and_datetime) == "DATE"
    end

    db_test "when boolean, integer and float returns boolean" do
      boolean_type = if Csv2sql.Helpers.get_config(:db_type) == :mysql, do: "BIT", else: "BOOLEAN"

      boolean_interger_and_float =
        Map.merge(@type_map, %{is_boolean: true, is_integer: true, is_float: true})

      assert Database.get_db_type(boolean_interger_and_float) == boolean_type
    end

    db_test "when integer and float returns integer" do
      boolean_interger_and_float = Map.merge(@type_map, %{is_integer: true, is_float: true})

      assert Database.get_db_type(boolean_interger_and_float) == "INT"
    end

    db_test "when none returns varchar" do
      varchar_limit = Csv2sql.Helpers.get_config(:varchar_limit)
      assert Database.get_db_type(@type_map) == "VARCHAR(#{varchar_limit})"
    end
  end

  describe "get_db_name/0" do
    db_test "returns correct db name" do
      assert Database.get_db_name() == get_db_name()
    end
  end

  describe "get_create_table_ddl/3" do
    db_test "returns correct create table ddl" do
      db_type = Csv2sql.Helpers.get_config(:db_type)
      db_name = get_db_name()

      col_type_defs = [
        {"id", "INT"},
        {"name", "VARCHAR(100)"},
        {"description", "TEXT"},
        {"salary", if(db_type == :mysql, do: "DOUBLE", else: "NUMERIC(1000, 100)")},
        {"permanent", if(db_type == :mysql, do: "BIT", else: "BOOLEAN")},
        {"created_at", if(db_type == :mysql, do: "DATETIME", else: "TIMESTAMP")}
      ]

      column_name_delimiter = if(db_type == :mysql, do: "`", else: "\"")

      cols =
        col_type_defs
        |> Enum.map_join(", ", fn {col_name, type} ->
          "#{column_name_delimiter}#{col_name}#{column_name_delimiter} #{type}"
        end)

      assert Database.get_create_table_ddl("priv/src/test.csv", db_name, col_type_defs) ==
               "CREATE TABLE #{db_name}.test (#{cols});"
    end
  end

  describe "get_drop_table_ddl/3" do
    test "returns correct drop table ddl" do
      db_name = get_db_name()

      assert Database.get_drop_table_ddl("priv/src/test.csv", db_name) ==
               "DROP TABLE IF EXISTS #{db_name}.test;"
    end
  end

  defp get_db_name() do
    "ecto://" <> db_url = Csv2sql.Helpers.get_config(:db_url)
    db_name = db_url |> String.split("/") |> Enum.at(1) |> String.split("?") |> Enum.at(0)

    if Csv2sql.Helpers.get_config(:db_type) == :postgres,
      do: "#{db_name}.public",
      else: db_name
  end
end

defmodule Csv2sql.TypeDeducerTest do
  use Csv2sql.Support.TestHelper

  describe "get_types/1" do
    db_test "should return a column type list for csv file" do
      csv_file_path = "priv/src/test.csv"
      db_type = Csv2sql.Helpers.get_config(:db_type)

      default_config = Application.get_env(:csv2sql, :config)

      datetime_patterns = [
        "{YYYY}-{0M}-{0D} {h24}:{m}:{s}",
        "{0M}-{0D}-{YYYY} {h12}{am}-{m}",
        "{0M}/{0D}/{YYYY} {h12}**{AM}/{s}/{m}"
      ]

      Application.put_env(
        :csv2sql,
        :config,
        ~M{%Csv2sql.Config default_config | datetime_patterns, varchar_limit: 120}
      )

      col_type_defs = [
        {"id", "INT"},
        {"name", "VARCHAR(120)"},
        {"description", "TEXT"},
        {"salary", if(db_type == :mysql, do: "DOUBLE", else: "NUMERIC(1000, 100)")},
        {"permanent", if(db_type == :mysql, do: "BIT", else: "BOOLEAN")},
        {"created_at", if(db_type == :mysql, do: "DATETIME", else: "TIMESTAMP")}
      ]

      assert Csv2sql.TypeDeducer.get_count_and_types(csv_file_path) == {5, col_type_defs}
    end
  end
end

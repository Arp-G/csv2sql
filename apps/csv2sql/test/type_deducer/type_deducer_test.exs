defmodule Csv2sql.TypeDeducerTest do
  use Csv2sql.Support.TestHelper, async: false

  describe "get_types/1" do
    db_test "should return a column type list for csv file" do
      csv_file_path = "test/support/fixtures/test.csv"
      db_type = Csv2sql.Helpers.get_config(:db_type)

      default_config = Application.get_env(:csv2sql, :config)

      datetime_patterns = [
        "{YYYY}-{0M}-{0D} {h24}:{m}:{s}",
        "{0M}-{0D}-{YYYY} {h12}{am}-{m}",
        "{0M}/{0D}/{YY} {h12}**{AM}/{s}/{m}"
      ]

      Application.put_env(
        :csv2sql,
        :config,
        ~M{%Csv2sql.Config default_config | datetime_patterns, varchar_limit: 120}
      )

      col_type_defs = [
        {"id", "INT"},
        {"name", "VARCHAR(120)"},
        {"description", if(db_type == :mysql, do: "LONGTEXT", else: "TEXT")},
        {"salary", if(db_type == :mysql, do: "DOUBLE", else: "NUMERIC(1000, 100)")},
        {"permanent", if(db_type == :mysql, do: "BIT", else: "BOOLEAN")},
        {"created_at", if(db_type == :mysql, do: "DATETIME", else: "TIMESTAMP")}
      ]

      assert Csv2sql.TypeDeducer.get_count_and_types(csv_file_path) == {5, col_type_defs}
    end

    db_test "should avoid duplicate column names" do
      logs =
        ExUnit.CaptureLog.capture_log(fn ->
          csv_file_path = "test/support/fixtures/duplicate_cols.csv"
          {5, col_type_defs} = Csv2sql.TypeDeducer.get_count_and_types(csv_file_path)
          names = Enum.map(col_type_defs, fn {name, _type} -> name end)
          assert names == ["id", "name", "name_1", "salary", "id_1", "id_2"]
        end)

      # Assert warning log messages
      assert logs =~ "Renamed duplicate column \"name\" to \"name_1\" in csv duplicate_cols"
      assert logs =~ "Renamed duplicate column \"id\" to \"id_1\" in csv duplicate_cols"
      assert logs =~ "Renamed duplicate column \"id\" to \"id_2\" in csv duplicate_cols"
    end

    db_test "fixes missing and invalid column names" do
      logs =
        ExUnit.CaptureLog.capture_log(fn ->
          csv_file_path = "test/support/fixtures/invalid_column_names.csv"
          {2, col_type_defs} = Csv2sql.TypeDeducer.get_count_and_types(csv_file_path)
          names = Enum.map(col_type_defs, fn {name, _type} -> name end)

          assert names == [
                   "missing_column_1",
                   "name",
                   "missing_column_2",
                   "salary",
                   "permanent",
                   "missing_column_3"
                 ]
        end)

      # Assert warning log messages
      assert logs =~ "Trimmed spaces for column \"salary \" in csv invalid_column_names.csv"

      assert logs =~
               "Renamed empty column as \"missing_column_1\" in csv invalid_column_names.csv"

      assert logs =~
               "Renamed empty column as \"missing_column_2\" in csv invalid_column_names.csv"

      assert logs =~
               "Renamed empty column as \"missing_column_3\" in csv invalid_column_names.csv"
    end

    test "when csv file is invalid returns error" do
      # Capture process crash logs to avoid bloating output
      ExUnit.CaptureLog.capture_log(fn ->
        Csv2sql.ProgressTracker.subscribe()

        Task.start(fn ->
          Csv2sql.TypeDeducer.get_count_and_types("test/support/fixtures/invalid.csv")
        end)

        assert_receive {:error, {{%NimbleCSV.ParseError{}, _}, _}}, 3000
      end)
    end
  end
end

defmodule Csv2sql.Stages.AnalyzeTest do
  use Csv2sql.Support.TestHelper, async: false

  describe "analyze/0" do
    db_test 'loads csv files into database properly' do
      load_fixtures(["test.csv"])
      Csv2sql.ProgressTracker.add_subscriber()
      Csv2sql.Stages.Analyze.analyze_files()
      assert_receive :finish, 50_00

      %{rows: rows} = Csv2sql.Database.run_query!("SELECT * from test")

      "#{get_fixture_path()}/test.csv"
      |> File.stream!([:trim_bom])
      |> NimbleCSV.RFC4180.parse_stream()
      |> Stream.zip(rows)
      |> Stream.map(fn {
                         [
                           csv_id,
                           csv_name,
                           csv_description,
                           csv_salary,
                           csv_permanent,
                           csv_created_at
                         ],
                         [db_id, db_name, db_description, db_salary, db_permanent, db_created_at]
                       } ->
        db_permanent =
          case db_permanent do
            <<1::size(1)>> -> true
            <<0::size(1)>> -> false
            arg -> arg
          end
          |> to_string()

        csv_permanent =
          case csv_permanent do
            "1" -> true
            "0" -> false
            "true" -> true
            "false" -> false
          end
          |> to_string()

        string_salary = fn salary -> salary |> to_string() |> Float.parse() end

        assert csv_id == to_string(db_id)
        assert csv_name == db_name
        assert csv_description == db_description
        assert string_salary.(csv_salary) == string_salary.(db_salary)
        assert csv_permanent == db_permanent
        assert csv_created_at == db_created_at
      end)
      |> Stream.run()
    end

    db_test "when ordered true, loads csv files into database properly with ordering column",
            %{ordered: true} do
      load_fixtures(["test.csv"])
      Csv2sql.ProgressTracker.add_subscriber()
      Csv2sql.Stages.Analyze.analyze_files()

      assert_receive :finish, 50_00

      %{rows: rows} = Csv2sql.Database.run_query!("SELECT * from test")

      "#{get_fixture_path()}/test.csv"
      |> File.stream!([:trim_bom])
      |> NimbleCSV.RFC4180.parse_stream()
      |> Stream.with_index(1)
      |> Stream.zip(rows)
      |> Stream.map(fn {
                         {[csv_id | _], csv_index},
                         [db_index, db_id | _]
                       } ->
        assert csv_index == db_index
        assert csv_id == to_string(db_id)
      end)
      |> Stream.run()
    end

    test "check producer produces correct data" do
      # TODO: GenStage.stream |> Enum.take
    end
  end
end

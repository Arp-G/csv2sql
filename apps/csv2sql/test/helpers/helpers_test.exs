defmodule Csv2sql.Helpers.HelpersTest do
  use ExUnit.Case, async: false
  alias Csv2sql.{Config.Loader, Helpers}

  @test_date Date.new!(2018, 01, 01, Calendar.ISO)
  @test_date_time %DateTime{
    year: 2018,
    month: 01,
    day: 01,
    hour: 22,
    minute: 20,
    second: 45,
    microsecond: {0, 0},
    time_zone: "Etc/UTC",
    zone_abbr: "UTC",
    utc_offset: 0,
    std_offset: 0
  }

  describe "get_config/1" do
    test "should return a config value" do
      Loader.load(%{db_url: "db_url"})
      assert Helpers.get_config(:db_url) == "db_url"
    end
  end

  describe "db_access_required" do
    test "should return true if insert_schema or insert_data is true" do
      [
        {true, true, true},
        {true, false, true},
        {false, true, true},
        {false, false, false}
      ]
      |> Enum.each(fn {insert_schema, insert_data, db_access_needed} ->
        Loader.load(%{db_url: "db_url", insert_schema: insert_schema, insert_data: insert_data})
        assert db_access_needed == Helpers.db_access_required()
      end)
    end
  end

  describe "get_csv_headers/1" do
    test "should return csv headers" do
      headers = Helpers.get_csv_headers("test/support/fixtures/test.csv")
      assert headers == ["id", "name", "description", "salary", "permanent", "created_at"]
    end
  end

  describe "format_datetime/1" do
    setup do
      Loader.load(%{
        db_url: "db_url",
        date_patterns: "{YYYY}-{0M}-{0D};{0D}-{0M}-{YYYY}",
        datetime_patterns:
          "{YYYY}-{0M}-{0D} {0h24}:{0m}:{0s};{0D}-{0M}-{YYYY} {0h12}{AM}:{0m}-{0s}"
      })
    end

    test "when date" do
      assert Helpers.format_datetime("2018-01-01", true) == @test_date
      assert Helpers.format_datetime("01-01-2018", true) == @test_date

      # When no matching pattern
      assert Helpers.format_datetime("01-31-2018", true) == nil
    end

    test "when datetime" do
      assert Helpers.format_datetime("2018-01-01 22:20:45", false) == @test_date_time
      assert Helpers.format_datetime("01-01-2018 10PM:20-45", false) == @test_date_time

      # When no matching pattern
      assert Helpers.format_datetime("01-01-2018 10pm:20:45", false) == nil
    end
  end
end

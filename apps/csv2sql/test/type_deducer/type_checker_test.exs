defmodule Csv2sql.Config.TypeCheckerTest do
  use Csv2sql.Support.TestHelper, async: false
  alias Csv2sql.TypeDeducer.TypeChecker

  @initial_type_map %{
    is_empty: true,
    is_date: true,
    is_datetime: true,
    is_boolean: true,
    is_integer: true,
    is_float: true,
    is_text: false
  }

  @date_patterns_to_tests [
    {"{YYYY}-{0M}-{0D}", "2020-01-01"},
    {"{0M}-{0D}-{YYYY}", "09-11-2001"},
    {"{0M}/{0D}/{YYYY}", "09/11/2001"},
    {"{Mshort}/{WDfull}/{YY}", "Sep/Wednesday/01"},
    {"{0M}={D}={YY}", "09=10=19"}
  ]

  @datetime_patterns_to_tests [
    {"{YYYY}-{0M}-{0D} {h24}:{m}:{s}", "2020-01-01 22:15:45"},
    {"{0M}-{0D}-{YYYY} {h12}{am}-{m}", "09-11-2001 7am-15"},
    {"{0M}/{0D}/{YYYY} {h12}**{AM}/{s}/{m}", "09/11/20 7**PM/45/15"}
  ]

  import ShorterMaps

  describe "check_type/2" do
    setup do
      load_default_config()
    end

    # Empty checks
    test "when value is an empty string returns proper type map" do
      assert TypeChecker.check_type("", @initial_type_map) == @initial_type_map
    end

    test "when value is an empty string but previous values where not empty returns proper type map" do
      type_map = Map.put(@initial_type_map, :is_empty, false)
      assert TypeChecker.check_type("", type_map) == type_map
    end

    # Date Checks
    test "when value is a date matching some pattern returns proper type map" do
      default_config = Application.get_env(:csv2sql, :config)

      # Supports different date formats
      Enum.each(@date_patterns_to_tests, fn {pattern, value} ->
        Application.put_env(
          :csv2sql,
          :config,
          %Csv2sql.Config{default_config | date_patterns: [pattern]}
        )

        assert TypeChecker.check_type(value, @initial_type_map) == %{
                 is_empty: false,
                 is_date: true,
                 is_datetime: false,
                 is_boolean: false,
                 is_integer: false,
                 is_float: false,
                 is_text: false
               }
      end)

      # Works when multiple patterns are provided with some matching pattern
      load_date_and_time_patterns()

      Enum.each(@date_patterns_to_tests, fn {_pattern, value} ->
        assert TypeChecker.check_type(value, @initial_type_map) == %{
                 is_empty: false,
                 is_date: true,
                 is_datetime: false,
                 is_boolean: false,
                 is_integer: false,
                 is_float: false,
                 is_text: false
               }
      end)
    end

    test "when value does not match any date pattern returns proper type map" do
      # Works when multiple patterns are provided with some matching pattern
      load_date_and_time_patterns()

      Enum.each(["2020-99-01", "09-11/2001", "BAD/Wednesday/01", "not a date"], fn value ->
        refute TypeChecker.check_type(value, @initial_type_map) == %{
                 is_empty: false,
                 is_date: true,
                 is_datetime: false,
                 is_boolean: false,
                 is_integer: false,
                 is_float: false,
                 is_text: false
               }
      end)
    end

    # Datetime Checks
    test "when value is a datetime matching some pattern returns proper type map" do
      default_config = Application.get_env(:csv2sql, :config)

      # Supports different datetime formats
      Enum.each(@datetime_patterns_to_tests, fn {pattern, value} ->
        Application.put_env(
          :csv2sql,
          :config,
          %Csv2sql.Config{default_config | datetime_patterns: [pattern]}
        )

        assert TypeChecker.check_type(value, @initial_type_map) == %{
                 is_empty: false,
                 is_date: false,
                 is_datetime: true,
                 is_boolean: false,
                 is_integer: false,
                 is_float: false,
                 is_text: false
               }
      end)

      # Works when multiple patterns are provided with some matching pattern
      load_date_and_time_patterns()

      Enum.each(@datetime_patterns_to_tests, fn {_pattern, value} ->
        assert TypeChecker.check_type(value, @initial_type_map) == %{
                 is_empty: false,
                 is_date: false,
                 is_datetime: true,
                 is_boolean: false,
                 is_integer: false,
                 is_float: false,
                 is_text: false
               }
      end)
    end

    test "when value does not match any datetime pattern returns proper type map" do
      # Works when multiple patterns are provided with some matching pattern
      load_date_and_time_patterns()

      Enum.each(
        ["2020-01-01 99:15:45", "09-11-2001 7aM-15", "09/11/2001 7~AM/45/15", "not a datetime"],
        fn value ->
          refute TypeChecker.check_type(value, @initial_type_map) == %{
                   is_empty: false,
                   is_date: true,
                   is_datetime: true,
                   is_boolean: false,
                   is_integer: false,
                   is_float: false,
                   is_text: false
                 }
        end
      )
    end

    # Boolean Checks
    test "detects valid boolean values" do
      [
        {"true", true},
        {"false", true},

        # only lowercase values are considered
        {"TRUE", false},
        {"FALSE", false},

        # Spaces are not allowed
        {" true   ", false},
        {"    false  ", false},

        # 1 or 0 is considered boolean
        {"1", true},
        {"0", true}
      ]
      |> run_assertions(:is_boolean)
    end

    # Integer Checks
    test "detects valid integer values" do
      [
        {"123", true},
        {"-34532", true},
        {"0", true},
        {"1", true},
        {" 123   ", false},
        {"    -34532  ", false},
        {"1.03", false},
        {"-2147483647", true},
        {"-2147483649", false},
        {"2147483646", true},
        {"2147483647", false},
        {"1.e3", false}
      ]
      |> run_assertions(:is_integer)
    end

    # Float Checks
    test "detects valid float values" do
      [
        {"123", true},
        {"123.45", true},
        {"-3453.45", true},
        {"0.0", true},
        {"1.0", true},
        {" 123   ", false},
        {"    -3453.45  ", false},
        {"0.0", true},
        {"9999999999.99999", true},
        {"-9999999999.99999", true},
        # Maximum allowed float size
        {"1.7976931348623157e+308", true},
        {"1.7976931348623159e+308", false},
        {"9999999999.9e", false},
        {"abc", false}
      ]
      |> run_assertions(:is_float)
    end

    # Text Checks
    test "detects valid text values" do
      default_config = Application.get_env(:csv2sql, :config)

      Application.put_env(
        :csv2sql,
        :config,
        ~M{%Csv2sql.Config default_config | varchar_limit: 10}
      )

      [
        {"abc", false},
        {"12345678901", true},
        {"", false}
      ]
      |> run_assertions(:is_text)
    end

    # Private test helper functions
    defp load_date_and_time_patterns() do
      default_config = Application.get_env(:csv2sql, :config)
      date_patterns = Enum.map(@date_patterns_to_tests, fn {pattern, _value} -> pattern end)

      datetime_patterns =
        Enum.map(@datetime_patterns_to_tests, fn {pattern, _value} -> pattern end)

      Application.put_env(
        :csv2sql,
        :config,
        ~M{%Csv2sql.Config default_config | date_patterns, datetime_patterns}
      )
    end

    defp run_assertions(tests, key) do
      tests
      |> Enum.each(fn
        {value, true} ->
          assert Map.get(TypeChecker.check_type(value, @initial_type_map), key)

        {value, false} ->
          refute Map.get(TypeChecker.check_type(value, @initial_type_map), key)
      end)
    end
  end
end

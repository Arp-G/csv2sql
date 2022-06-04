defmodule Csv2sql.Config.ParserTest do
  use ExUnit.Case, async: true
  alias Csv2sql.Config.Parser

  describe "parse/1" do
    test "parses args and returns correct args map" do
      args = [
        "--dashboard",
        "--source-directory",
        "test/data/source",
        "--schema-path",
        "test/data/schema",
        "--insert-schema",
        "false",
        "--insert-data",
        "false",
        "--validate-import",
        "true",
        "--date-patterns",
        "{YYYY}-{0M}-{0D}",
        "--datetime-patterns",
        "{YYYY}-{0M}-{0D} {0h24}:{0m}:{0s}",
        "--schema-infer-chunk-size",
        "140",
        "--worker-count",
        "88",
        "--db-type",
        "postgres",
        "--db-worker-count",
        "66",
        "--insertion-chunk-size",
        "550",
        "--db-url",
        "user@pass:host/db",
        "--varchar-limit",
        "120",
        "--log",
        "debug"
      ]

      assert {:cont,
              %{
                dashboard: true,
                source_directory: "test/data/source",
                schema_path: "test/data/schema",
                insert_schema: "false",
                insert_data: "false",
                ordered: "true",
                date_patterns: "{YYYY}-{0M}-{0D}",
                datetime_patterns: "{YYYY}-{0M}-{0D} {0h24}:{0m}:{0s}",
                schema_infer_chunk_size: 140,
                worker_count: 88,
                db_type: "postgres",
                db_worker_count: 66,
                insertion_chunk_size: 550,
                db_url: "user@pass:host/db",
                varchar_limit: 120,
                log: "debug"
              }} == Parser.parse(args)
    end

    test "returns help text when --help arg is passed" do
      assert {:stop, "Usage: csv2sql [options] [source_directory]"} ==
               Parser.parse(["--help", "--db-url", "ignored_arg"])
    end

    test "returns current app version when --version is passed" do
      vsn = Application.spec(:csv2sql, :vsn) |> to_string()

      assert {:stop, "csv2sql version: #{vsn}"} ==
               Parser.parse(["--version", "--db-url", "ignored_arg"])
    end

    test "raises OptionParser.ParseError when invalid arg is passed" do
      # Unknown arg
      assert_raise OptionParser.ParseError, fn ->
        Parser.parse(["--invalid-arg"])
      end

      # Missing value
      assert_raise OptionParser.ParseError, fn ->
        Parser.parse(["--db-url"])
      end

      # Invalid arg type
      assert_raise OptionParser.ParseError, fn ->
        Parser.parse(["--schema-infer-chunk-size", "thirty"])
      end
    end
  end
end

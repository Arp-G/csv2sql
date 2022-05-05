defmodule Csv2sql.Config.LoaderTest do
  use ExUnit.Case, async: true
  alias Csv2sql.Config.Loader

  @default_config %{db_url: "user@pass:host/db"}
  import ShorterMaps

  describe "load/1" do
    test "when no args are passed loads default configs" do
      Loader.load(@default_config)
      current_dir = File.cwd!()

      assert %Csv2sql.Config{
               dashboard: false,
               date_patterns: ["{YYYY}-{0M}-{0D}"],
               datetime_patterns: ["{YYYY}-{0M}-{0D} {0h24}:{0m}:{0s}"],
               db_type: :mysql,
               db_url: "ecto://user@pass:host/db",
               db_worker_count: nil,
               insert_data: true,
               insert_schema: true,
               insertion_chunk_size: 100,
               log: false,
               schema_infer_chunk_size: 100,
               schema_path: current_dir,
               source_directory: current_dir,
               validate_import: true,
               varchar_limit: 100,
               worker_count: 32
             } == Application.get_env(:csv2sql, :config)
    end

    test "when invalid source directory is specified" do
      source_directory = "/tmp/invalid_dir_#{:rand.uniform(10000)}"

      assert_raise RuntimeError, "Could not find source directory: #{source_directory}", fn ->
        @default_config
        |> Map.put(:source_directory, source_directory)
        |> Loader.load()
      end
    end

    test "when invalid schema directory is specified" do
      schema_directory = "/tmp/invalid_dir_#{:rand.uniform(10000)}"

      assert_raise RuntimeError, "Could not find schema directory: #{schema_directory}", fn ->
        @default_config
        |> Map.put(:schema_path, schema_directory)
        |> Loader.load()
      end
    end

    test "when schema directory not specified uses source directory" do
      source_directory = "#{File.cwd!()}/priv"

      @default_config
      |> Map.put(:source_directory, source_directory)
      |> Loader.load()

      ~M{%Csv2sql.Config schema_path} = Application.get_env(:csv2sql, :config)
      assert schema_path == source_directory
    end

    test "when no db operations are required, does not load db config" do
      @default_config
      |> Map.merge(%{
        insert_schema: false,
        insert_data: false,
        validate_import: false,
        db_url: "some_url",
        log: "debug",
        varchar_limit: 200,
        insertion_chunk_size: 200
      })
      |> Loader.load()

      ~M{%Csv2sql.Config db_type, db_url, insertion_chunk_size, date_patterns, datetime_patterns, log, varchar_limit} =
        Application.get_env(:csv2sql, :config)

      assert is_nil(db_type)
      assert is_nil(db_url)
      assert is_nil(insertion_chunk_size)
      assert varchar_limit == 100
      assert date_patterns == []
      assert datetime_patterns == []
      assert log == false
    end

    for config <- ~w(insert_schema insert_data validate_import)a do
      test "when only \"#{config}\" is set, loads db config" do
        config = unquote(config)
        @default_config
        |> Map.merge(%{
          insert_schema: false,
          insert_data: false,
          validate_import: false,
          db_url: "some_url",
          log: "debug",
          varchar_limit: 200,
          insertion_chunk_size: 200
        })
        |> Map.put(config, true)
        |> Loader.load()

        ~M{%Csv2sql.Config db_type, db_url, insertion_chunk_size, date_patterns, datetime_patterns, log, varchar_limit} =
          Application.get_env(:csv2sql, :config)

        assert db_type == :mysql
        assert db_url == "ecto://some_url"
        assert insertion_chunk_size == 200
        assert date_patterns == ["{YYYY}-{0M}-{0D}"]
        assert datetime_patterns == ["{YYYY}-{0M}-{0D} {0h24}:{0m}:{0s}"]
        assert log == :debug
        assert varchar_limit == 200
      end
    end
  end
end

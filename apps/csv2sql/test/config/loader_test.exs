defmodule Csv2sql.Config.LoaderTest do
  use ExUnit.Case, async: true
  alias Csv2sql.Config.Loader

  @default_config %{db_url: "user@pass:host/db"}
  import ShorterMaps

  describe "load/1" do
    test "when args are passed loads them in env" do
      current_dir = File.cwd!()

      Loader.load(%{
        dashboard: true,
        date_patterns: "{YYYY}-{0M}-{0D};{0D}-{0M}-{YYYY}",
        datetime_patterns: "{YYYY}-{0M}-{0D} {0h24}:{0m}:{0s};{0D}-{0M}-{YYYY} {0h12}:{mm}",
        db_type: "postgres",
        db_url: "user@pass:host/db",
        db_worker_count: 10,
        insert_data: true,
        insert_schema: true,
        insertion_chunk_size: 200,
        log: "debug",
        schema_infer_chunk_size: 250,
        schema_path: current_dir,
        source_directory: current_dir,
        validate_import: true,
        varchar_limit: 150,
        worker_count: 22
      })

      assert %Csv2sql.Config{
               dashboard: true,
               date_patterns: ["{YYYY}-{0M}-{0D}", "{0D}-{0M}-{YYYY}"],
               datetime_patterns: [
                 "{YYYY}-{0M}-{0D} {0h24}:{0m}:{0s}",
                 "{0D}-{0M}-{YYYY} {0h12}:{mm}"
               ],
               db_type: :postgres,
               db_url: "ecto://user@pass:host/db",
               db_worker_count: 10,
               insert_data: true,
               insert_schema: true,
               insertion_chunk_size: 200,
               log: :debug,
               schema_infer_chunk_size: 250,
               schema_path: current_dir,
               source_directory: current_dir,
               validate_import: true,
               varchar_limit: 150,
               worker_count: 22
             } == Application.get_env(:csv2sql, :config)
    end

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
          db_type: "mysql",
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

    test "when duplicate date and datetime patterns given adds only uniq patterns" do
      @default_config
      |> Map.merge(%{
        date_patterns: "{YYYY}-{0M}-{0D};{0D}-{0M}-{YYYY};{0D}-{0M}-{YYYY}",
        datetime_patterns:
          "{YYYY}-{0M}-{0D} {0h24}:{0m}:{0s};{0D}-{0M}-{YYYY} {0h12}:{mm};{0D}-{0M}-{YYYY} {0h12}:{mm}"
      })
      |> Loader.load()

      loaded_args = Application.get_env(:csv2sql, :config)
      assert loaded_args.date_patterns == ["{YYYY}-{0M}-{0D}", "{0D}-{0M}-{YYYY}"]

      assert loaded_args.datetime_patterns == [
               "{YYYY}-{0M}-{0D} {0h24}:{0m}:{0s}",
               "{0D}-{0M}-{YYYY} {0h12}:{mm}"
             ]
    end

    test "ignores log level other than debug, info, warn and false" do
      @default_config
      |> Map.put(:log, "invalid_log_type")
      |> Loader.load()

      assert match?(%{log: false}, Application.get_env(:csv2sql, :config))

      @default_config
      |> Map.put(:log, 123)
      |> Loader.load()

      assert match?(%{log: false}, Application.get_env(:csv2sql, :config))
    end

    test "selects mysql if unknown db_type given" do
      @default_config
      |> Map.put(:db_type, "msql")
      |> Loader.load()

      assert match?(%{db_type: :mysql}, Application.get_env(:csv2sql, :config))
    end

    test "ignores invalid varchar limit" do
      @default_config
      |> Map.put(:varchar_limit, 1000)
      |> Loader.load()

      assert match?(%{varchar_limit: 100}, Application.get_env(:csv2sql, :config))

      @default_config
      |> Map.put(:varchar_limit, -1000)
      |> Loader.load()

      assert match?(%{varchar_limit: 100}, Application.get_env(:csv2sql, :config))
    end

    test "ignores invalid insertion chunk size" do
      @default_config
      |> Map.put(:insertion_chunk_size, 1_000_000)
      |> Loader.load()

      assert match?(%{insertion_chunk_size: 100}, Application.get_env(:csv2sql, :config))

      @default_config
      |> Map.put(:insertion_chunk_size, -1000)
      |> Loader.load()

      assert match?(%{insertion_chunk_size: 100}, Application.get_env(:csv2sql, :config))
    end

    test "handle boolean values with spaces and mixed case" do
      @default_config
      |> Map.put(:insert_data, " TrUe  ")
      |> Loader.load()

      assert match?(%{insert_data: true}, Application.get_env(:csv2sql, :config))

      @default_config
      |> Map.put(:insert_data, " fALsE  ")
      |> Loader.load()

      assert match?(%{insert_data: false}, Application.get_env(:csv2sql, :config))
    end

    test "treats invalid boolean type as true" do
      @default_config
      |> Map.put(:insert_data, 123)
      |> Loader.load()

      assert match?(%{insert_data: true}, Application.get_env(:csv2sql, :config))
    end

    test "when db url is missing" do
      assert_raise RuntimeError, "Please provide a valid database url", fn ->
        Loader.load(%{db_url: nil})
      end
    end
  end
end

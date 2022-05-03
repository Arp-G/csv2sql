defmodule Csv2sql.Config.LoaderTest do
  use ExUnit.Case
  alias Csv2sql.Config.Loader

  @default_config %{db_url: "user@pass:host/db"}

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
  end
end

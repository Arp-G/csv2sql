defmodule WithDbSetup do
  use ExUnit.CaseTemplate

  # TODO: Load these from some env vars
  # Add ability to overwrite these with passed values
  setup :prep_db

  def prep_db(args \\ %{}) do
    correct_args = %{
      datetime_patterns: "yyyy;mmmm;{YYYY}-{0M}-{0D};yyyy",
      db_type: "mysql",
      db_url: "root:root@localhost/mysql?socket=/var/run/mysqld/mysqld.sock",
      db_worker_count: 78,
      insertion_chunk_size: 34,
      log: "debug",
      source_directory: "/tmp",
      validate_import: "true",
      varchar_limit: 140
    }

    correct_args
    |> Map.merge(args)
    |> Csv2sql.Config.Loader.load()
  end
end

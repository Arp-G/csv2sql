defmodule WithDbSetup do
  @moduledoc false
  use ExUnit.CaseTemplate

  setup :prep_db

  # Somehow create a test db before trying to connect - maybe a mix tasks which creates test db, sources .env.test and starts mix tests
  def prep_db(args) do
    # Load proper env file
    test_db_type = Application.get_env(:csv2sql, :test_db_type)
    Dotenv.load!(".env.#{test_db_type}.test")

    # Custom args passed via tags
    db_args = Map.get(args, :db_args, %{})

    correct_args = %{
      db_type: System.get_env("DB_TYPE") || "mysql",
      db_url: System.get_env("DB_URL") || raise("DB URL for test not specified"),
      log: System.get_env("LOG_LEVEL"),
      source_directory: System.get_env("SOURCE_DIRECTORY")
    }

    correct_args
    |> Map.merge(db_args)
    |> Csv2sql.Config.Loader.load()
  end
end

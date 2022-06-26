require Logger
Code.require_file("support/test_helper.exs", __DIR__)

# Load database configurations from .env files
for db <- [:mysql, :postgres] do
  configs = ".env.#{db}.test" |> File.read!() |> Dotenv.parse_contents()

  loader_config = %{
    db_type: configs["DB_TYPE"],
    db_url: configs["DB_URL"],
    log_level: configs["LOG_LEVEL"]
  }

  Application.put_env(:csv2sql, :"#{db}_config", loader_config)
end

# Load some default configs, so that non-db dependent tests work
Csv2sql.Support.TestHelper.load_default_config()

ExUnit.start()

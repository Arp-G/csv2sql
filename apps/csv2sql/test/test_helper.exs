require Logger
Code.require_file("support/with_db_setup.exs", __DIR__)

for db <- [:mysql, :postgres] do
  configs = ".env.#{db}.test" |> File.read!() |> Dotenv.parse_contents()
  loader_config = %{
    db_type: configs["DB_TYPE"],
    db_url: configs["DB_URL"],
    log_level: configs["LOG_LEVEL"],
    source_directory: configs["SOURCE_DIRECTORY"]
  }

  Application.put_env(:csv2sql, :"#{db}_config", loader_config)
end

ExUnit.start()

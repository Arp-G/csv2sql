require Logger
Code.require_file("support/with_db_setup.exs", __DIR__)

Logger.info("Run non-db tests")
# Run tests without db involvement
ExUnit.start(exclude: :multi_db_test)

# Run tests with db involvement
for db <- ["mysql", "postgres"] do
  Logger.info("Run db tests for #{db}")
  Application.put_env(:csv2sql, :test_db_type, db)
  ExUnit.start(exclude: :test, include: :multi_db_test)
end

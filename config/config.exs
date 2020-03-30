use Mix.Config

config :csv2sql, Csv2sql.SchemaMaker,
  varchar_limit: 100,
  source_csv_directory: "/home/arpan/dev/DataMigration/leap_frog/ExtractedData_1"

# config :csv2sql, Csv2sql.DB,
#   username: "root",
#   password: "mysql",
#   host: "localhost",
#   database: "test_csv",
#   socket: "/var/run/mysqld/mysqld.sock"

config :csv2sql, Csv2sql.Repo,
  username: "root",
  password: "mysql",
  host: "localhost",
  database: "test_csv",
  socket: "/var/run/mysqld/mysqld.sock",
  connect_timeout: 30000,
  pool_size: 50,
  queue_target: 2000,
  queue_interval: 30000

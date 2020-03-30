use Mix.Config

config :csv2sql, Csv2sql.SchemaMaker,
  varchar_limit: 100,
  source_csv_directory: "/home/arpan/dev/DataMigration/leap_frog/ExtractedData_1"


config :csv2sql, Csv2sql.DB,
  username: "root",
  password: "mysql",
  host: "localhost",
  database: "test_csv",
  socket: "/var/run/mysqld/mysqld.sock"

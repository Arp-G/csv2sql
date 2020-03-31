use Mix.Config

config :csv2sql, Csv2sql.SchemaMaker,
  varchar_limit: 100,
  schema_file_path: "/home/arpan/dev/csv2sql"

config :csv2sql, Csv2sql.Server,
  worker_count: 10,
  source_csv_directory: "/home/arpan/dev/DataMigration/leap_frog/temp",
  imported_csv_directory: "/home/arpan/dev/DataMigration/leap_frog/temp_imported",
  validated_csv_directory: "/home/arpan/dev/DataMigration/leap_frog/temp_validated"

config :csv2sql, Csv2sql.Repo,
  username: "root",
  password: "mysql",
  host: "localhost",
  database_name: "test_csv",
  socket: "/var/run/mysqld/mysqld.sock",
  log: false # Make false to disable ecto logs
  #connect_timeout: 30000,
  #pool_size: 50,
  #queue_target: 2000,
  #queue_interval: 30000

use Mix.Config

config :csv2sql, Csv2sql.SchemaMaker,
  # The character limit after which a db field becomes a text from a varchar
  # (CAUTION: Changing this could lead to data truncation errors in some cases)
  varchar_limit: 100,
  # The location were the generated schema file will be stored
  schema_file_path: "/home/arpan/dev/DataMigration/"

config :csv2sql, Csv2sql.Server,
  # Increasing worker count may result in database connection error, since too many processes access the databases concurrently
  worker_count: 10,

  # CAUTION:
  # Make each of the below directory configuration are in separate directories
  # Setting them to the same directory can lead to infinite execution or crashes

  # The source directory where the csvs are located
  source_csv_directory: "/home/arpan/dev/DataMigration/temp",
  # The directory were the csvs will be moved after importing to database, make sure it is present and is empty

  imported_csv_directory: "/home/arpan/dev/DataMigration/temp_imported",

  # The directory were the csvs will be moved after they are validated, make sure it is present and is empty
  validated_csv_directory: "/home/arpan/dev/DataMigration/temp_validated"

config :csv2sql, Csv2sql.Repo,
  # Your mysql credentials
  username: "root",
  password: "mysql",
  host: "localhost",
  # This is the name of the database which will be created (if not present already)
  database_name: "test_csv",
  socket: "/var/run/mysqld/mysqld.sock",
  # Make false to disable ecto logs
  log: false

# These parameters can be changed to allow more database connections
# connect_timeout: 15000,
# pool_size: 20,
# queue_target: 5000,
# queue_interval: 1000

use Mix.Config

config :csv2sql, Csv2sql.SchemaMaker,
  # The character limit after which a db field becomes a text from a varchar
  # (CAUTION: Changing this could lead to data truncation errors in some cases)
  varchar_limit: 100,
  # The location were the generated schema file will be stored
  schema_file_path: "/home/arpan/dev/DataMigration/"

config :csv2sql, Csv2sql.MainServer,
  # Increasing worker count may result in database connection error, since too many processes access the databases concurrently
  worker_count: 10,
  # The number of database workers
  db_worker_count: 10,

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
  # Number of records to insert into the database at once
  insertion_chunk_size: 100,
  # The socket file location for mysql
  socket: "/var/run/mysqld/mysqld.sock",
  # Make false to disable ecto logs
  #log: true,

  # The below parameters can be changed to allow more database connections

  timeout: 60000,
  # The number of seconds that the mysqld server waits for a connect packet before responding with Bad handshake
  #  The timeout for establishing new connections
  connect_timeout: 60000,

  # The pool_size controls how many connections you want to the database.
  # The advice of starting one per core is good for CPU work.
  # Connections however do a lot of IO work so its recommende a minimum of at least 10.
  # To find the ideal number you need to monitor and measure how your queues are behaving.
  # A higher number is not necessarily better, as it implies in less re-use between connections and database overload.
  pool_size: 20,

# Handling requests is done through a queue. When DBConnection is started,
# there are two relevant options to control the queue:
# Our goal is to wait at most :queue_target for a connection.
# If all connections checked out during a :queue_interval takes more than :queue_target, then we double the :queue_target.
# If checking out connections take longer than the new target, then we start dropping messages.

 queue_target: 5000,
 queue_interval: 1000

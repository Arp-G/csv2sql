use Mix.Config

config :csv2sql, Csv2sql.SchemaMaker,
  # The character limit after which a db field becomes a text from a varchar
  # (CAUTION: Changing this could lead to data truncation errors in some cases)
  varchar_limit: System.get_env("csv2sql_varchar_limit") |> String.to_integer(),
  # The location were the generated schema file will be stored
  schema_file_path: System.get_env("csv2sql_schema_file_path")

config :csv2sql, Csv2sql.MainServer,
  # The number of workers
  # Increasing worker count may result in errors
  worker_count: System.get_env("csv2sql_worker_count") |> String.to_integer(),
  # The number of database workers
  db_worker_count: System.get_env("csv2sql_db_worker_count") |> String.to_integer(),

  # CAUTION:
  # Make each of the below directory configuration are in separate directories
  # Setting them to the same directory can lead to infinite execution or crashes

  # The source directory where the csvs are located
  source_csv_directory: System.get_env("csv2sql_source_csv_directory"),
  # The directory were the csvs will be moved after importing to database, make sure it is present and is empty

  imported_csv_directory: System.get_env("csv2sql_imported_csv_directory"),

  # The directory were the csvs will be moved after they are validated, make sure it is present and is empty
  validated_csv_directory: System.get_env("csv2sql_validated_csv_directory")

config :csv2sql, Csv2sql.Repo,
  # Your mysql credentials
  username: System.get_env("csv2sql_username"),
  password: System.get_env("csv2sql_password"),
  host: System.get_env("csv2sql_host"),
  # This is the name of the database which will be created (if not present already)
  database_name: System.get_env("csv2sql_database_name"),
  # Number of records to insert into the database at once
  insertion_chunk_size: System.get_env("csv2sql_insertion_chunk_size") |> String.to_integer(),
  # Number of chunks to keep in memory (Memory required = insertion_chunk_size * job_count_limit)
  job_count_limit: System.get_env("csv2sql_job_count_limit") |> String.to_integer(),
  # The socket file location for mysql
  socket: System.get_env("csv2sql_socket"),
  # When false, does not log the query

  log: if(System.get_env("csv2sql_log") == "false", do: false, else: true),

  # The below parameters can be changed to allow more database connections

  # The time in milliseconds to wait for the query call to finishThe time in milliseconds to wait for the query call to finish
  # (default: 15000)
  timeout: System.get_env("csv2sql_timeout") |> String.to_integer(),
  # The number of seconds that the mysqld server waits for a connect packet before responding with Bad handshake
  #  The timeout for establishing new connections
  connect_timeout: System.get_env("csv2sql_connect_timeout") |> String.to_integer(),

  # The pool_size controls how many connections you want to the database.
  # The advice of starting one per core is good for CPU work.
  # Connections however do a lot of IO work so its recommende a minimum of at least 10.
  # To find the ideal number you need to monitor and measure how your queues are behaving.
  # A higher number is not necessarily better, as it implies in less re-use between connections and database overload.
  pool_size: System.get_env("csv2sql_pool_size") |> String.to_integer(),

  # Handling requests is done through a queue. When DBConnection is started,
  # there are two relevant options to control the queue:
  # Our goal is to wait at most :queue_target for a connection.
  # If all connections checked out during a :queue_interval takes more than :queue_target, then we double the :queue_target.
  # If checking out connections take longer than the new target, then we start dropping messages.

  queue_target: System.get_env("csv2sql_queue_target") |> String.to_integer(),
  queue_interval: System.get_env("csv2sql_queue_interval") |> String.to_integer()

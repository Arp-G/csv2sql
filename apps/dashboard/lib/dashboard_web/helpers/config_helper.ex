defmodule DashboardWeb.Helper.ConfigHelper do
  def load_initial_config do
    inital_config = get_initial_config()
    Cachex.put_many(:config_cache, convert_to_klist(inital_config))
  end

  defp convert_to_klist(map) do
    Enum.map(map, fn {key, value} -> {key, value} end)
  end

  def get_config_from_cache() do
    Cachex.export!(:config_cache)
    |> Enum.reduce(%{}, fn {:entry, key, _, _, value}, acc ->
      Map.put(acc, key, value)
    end)
  end

  def get_to_config_arg() do
    Cachex.export!(:config_cache)
    |> add_db_connection_config()
    |> Enum.reject(fn {_, _, _, _, val} -> is_nil(val) || val=="" end)
    |> Enum.map(fn {:entry, key, _, _, value} ->
      {"--" <> to_string(key), to_string(value)}
    end)
    |> Enum.reduce([], fn {key, value}, acc ->
      acc ++ [key, value]
    end)
  end

  defp add_db_connection_config(config) do
    {:entry, _, _, _, username} =
      Enum.find(config, fn {:entry, key, _, _, _value} -> key == :csv2sql_username end)

    {:entry, _, _, _, password} =
      Enum.find(config, fn {:entry, key, _, _, _value} -> key == :csv2sql_password end)

    {:entry, _, _, _, host} =
      Enum.find(config, fn {:entry, key, _, _, _value} -> key == :csv2sql_host end)

    {:entry, _, _, _, database_name} =
      Enum.find(config, fn {:entry, key, _, _, _value} -> key == :csv2sql_database_name end)

    config ++
      [
        {:entry, String.to_atom("db-connection-string"), nil, nil,
         "#{username}:#{password}@#{host}/#{database_name}"}
      ]
  end

  defp get_initial_config do
    %{
      "schema-file-path": "",
      "source-csv-directory": "/home/arpan/Desktop/test/bulk_csvs",  #"",
      "imported-csv-directory": "",
      "validated-csv-directory": "",
      "skip-make-schema": nil,
      "skip-insert-schema": nil,
      "skip-insert-data": nil,
      "skip-validate-import": nil,
      csv2sql_username: "root",
      csv2sql_password: "mysql",
      csv2sql_host: "localhost",
      csv2sql_database_name: "csvsql_test",
      "connection-socket": "/var/run/mysqld/mysqld.sock",
      "varchar-limit": 100,
      "schema-infer-chunk-size": 100,
      "worker-count": 10,
      "db-worker-count": 15,
      "insertion-chunk-size": 100,
      "job-count-limit": 10,
      timeout: 60000,
      "connect-timeout": 60000,
      "pool-size": 20,
      "queue-target": 5000,
      "queue-interval": 1000
    }
  end

  def get_config_desc do
    %{
      csv2sql_schema_file_path:
        "The location were the generated schema file will be stored, default to the csv2sql_source_csv_directory",
      csv2sql_source_csv_directory:
        "The source directory where the csvs are located, default to the current directory",
      csv2sql_imported_csv_directory:
        "The directory were the csvs will be moved after importing to database, defaults to the <csv2sql_source_csv_directory>/imported",
      csv2sql_validated_csv_directory:
        "The directory were the csvs will be moved after they are validated, defaults to the <csv2sql_source_csv_directory>/validated",
      csv2sql_set_make_schema: "Set whether you want to make schema file",
      csv2sql_set_insert_schema:
        "Set whether you want to insert the schema file that is generated (this option will only work if set_make_schema=\"true\")",
      csv2sql_set_insert_data: "Set whether to insert the CSVs into the database",
      csv2sql_set_validate: "Set whether to validate if the csvs have been inserted correctly",
      csv2sql_username: "mysql username, required field if database access is required",
      csv2sql_password: "mysql password, required field if database access is required",
      csv2sql_host: "mysql host",
      csv2sql_database_name:
        "This is the name of the database which will be created (if not present already), required field if database access is required",
      csv2sql_socket: "The socket file location for mysql",
      csv2sql_varchar_limit:
        "The character limit after which a db field becomes a text from a varchar",
      csv2sql_schema_infer_chunk_size: """
         The chunk size to use when the schema for a csv will be infered parallely .
         For example: A chunk size 100 means the csv will be read 100 rows at a time
         and separate processes will be used to infer the schema of each 100 row chunk
      """,
      csv2sql_worker_count: "The number of workers, Increasing worker count may result in errors",
      csv2sql_db_worker_count: "The number of database workers",
      csv2sql_insertion_chunk_size: """
      Number of records to insert into the database at once
      Increasing this may result in mysql error for too many placeholders
      """,
      csv2sql_job_count_limit:
        "Number of chunks to keep in memory (Memory required=insertion_chunk_size * job_count_limit)",
      csv2sql_log:
        "When false, does not log the query, possible values are false, debug, info, warn",
      csv2sql_timeout: " The time in milliseconds to wait for the query call to finish",
      csv2sql_connect_timeout: """
      The number of seconds that the mysqld server waits for a connect packet before responding with Bad handshake
      The timeout for establishing new connections
      """,
      csv2sql_pool_size: """
        The pool_size controls how many connections you want to the database.
        The advice of starting one per core is good for CPU work.
        Connections however do a lot of IO work so its recommende a minimum of at least 10.
        To find the ideal number you need to monitor and measure how your queues are behaving.
        A higher number is not necessarily better, as it implies in less re-use between connections and database overload.
      """,
      csv2sql_queue_target: """
      Handling requests is done through a queue. When DBConnection is started,
      there are two relevant options to control the queue:
      Our goal is to wait at most :queue_target for a connection.
      If all connections checked out during a :queue_interval takes more than :queue_target, then we double the :queue_target.
      If checking out connections take longer than the new target, then we start dropping messages.
      """,
      csv2sql_queue_interval: """
      Handling requests is done through a queue. When DBConnection is started,
      there are two relevant options to control the queue:
      Our goal is to wait at most :queue_target for a connection.
      If all connections checked out during a :queue_interval takes more than :queue_target, then we double the :queue_target.
      If checking out connections take longer than the new target, then we start dropping messages.
      """
    }
  end

  def validate_config(_config) do
    # TODO
    %{
      csv2sql_schema_file_path: true,
      csv2sql_source_csv_directory: true,
      csv2sql_imported_csv_directory: true,
      csv2sql_validated_csv_directory: true,
      csv2sql_set_make_schema: true,
      csv2sql_set_insert_schema: true,
      csv2sql_set_insert_data: true,
      csv2sql_set_validate: true,
      csv2sql_username: true,
      csv2sql_password: true,
      csv2sql_host: true,
      csv2sql_database_name: true,
      csv2sql_socket: true,
      csv2sql_varchar_limit: true,
      csv2sql_schema_infer_chunk_size: true,
      csv2sql_worker_count: true,
      csv2sql_db_worker_count: true,
      csv2sql_insertion_chunk_size: true,
      csv2sql_job_count_limit: true,
      csv2sql_log: true,
      csv2sql_timeout: true,
      csv2sql_connect_timeout: true,
      csv2sql_pool_size: true,
      csv2sql_queue_target: true,
      csv2sql_queue_interval: true
    }
  end
end

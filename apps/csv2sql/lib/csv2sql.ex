defmodule Csv2sql do
  def main(args) do
    Csv2sql.Helpers.greet()
    # Load configuration varaibles dynamically for escripts, this is required
    # since configuration variables are set to whatever they where when the
    # escript was build and cannot be changed later
    dashboard = update_config(args)

    # Start supervision tree
    {:ok, sup_pid} = Csv2sql.Application.start(:no_args, :no_args)

    # Wait for finish and stop supervion tree
    # This is done in separate Task to reply back to the caller(dashbaord GUI)
    # immediately after the supervision tree is started successfully
    Task.start(fn -> wait_for_finish(sup_pid) end)

    # If error tracker server is not running, start it.
    # If block executes for first time when the app is started from "dashboard" app
    if !Process.whereis(:error_tracker), do: Csv2sql.ErrorTracker.start_link(:no_args)

    # Regiter the main supervisor pid with error tracker
    # Error tracker will stop supervisor incase of errors
    Csv2sql.ErrorTracker.register_supervisor(sup_pid)

    unless dashboard do
      # In escripts as soon as the main() function return, the escript ends,
      # this allows the escript to keep running, when the app is used without the dashboard.
      receive do
        {:wait} ->
          System.halt(0)
      end
    end

    sup_pid
  end

  defp wait_for_finish(sup_pid) do
    Csv2sql.Observer.get_stage()
    |> case do
      :error ->
        nil

      :finish ->
        # Finish and stop supervisors after a second
        :timer.sleep(1000)
        Supervisor.stop(sup_pid)

      _ ->
        wait_for_finish(sup_pid)
    end
  end

  defp update_config(args) do
    {opts, _, _} =
      OptionParser.parse(args,
        strict: [
          dashboard: :boolean,
          schema_file_path: :string,
          source_csv_directory: :string,
          imported_csv_directory: :string,
          validated_csv_directory: :string,
          skip_make_schema: :boolean,
          skip_insert_schema: :boolean,
          skip_insert_data: :boolean,
          skip_validate_import: :boolean,
          db_connection_string: :string,
          connection_socket: :string,
          varchar_limit: :integer,
          schema_infer_chunk_size: :integer,
          worker_count: :integer,
          db_worker_count: :integer,
          insertion_chunk_size: :integer,
          job_count_limit: :integer,
          log: :string,
          timeout: :integer,
          connect_timeout: :integer,
          pool_size: :integer,
          queue_target: :integer,
          queue_interval: :integer,
          custom_date_patterns: :string,
          custom_datetime_patterns: :string
        ]
      )

    source_csv_directory = opts[:source_csv_directory] || "."
    schema_file_path = opts[:schema_file_path] || source_csv_directory
    imported_csv_directory = opts[:imported_csv_directory] || "#{source_csv_directory}/imported"

    validated_csv_directory =
      opts[:validated_csv_directory] || "#{source_csv_directory}/validated"

    make_schema = if opts[:skip_make_schema], do: false, else: true
    insert_schema = if opts[:skip_insert_schema], do: false, else: true
    insert_data = if opts[:skip_insert_data], do: false, else: true
    validate_import = if opts[:skip_validate_import], do: false, else: true

    [db_type, username, password, host, database_name] =
      if opts[:db_connection_string] do
        str = opts[:db_connection_string]
        [db_type, username, tmp] = String.split(str, ":")
        [password, tmp] = String.split(tmp, "@")
        [host, database_name] = String.split(tmp, "/")
        [db_type, username, password, host, database_name]
      end

    connection_socket = opts[:connection_socket] || "/var/run/mysqld/mysqld.sock"

    varchar_limit = opts[:varchar_limit] || 100
    schema_infer_chunk_size = opts[:schema_infer_chunk_size] || 100
    worker_count = opts[:worker_count] || 10
    db_worker_count = opts[:db_worker_count] || 15
    insertion_chunk_size = opts[:insertion_chunk_size] || 100
    job_count_limit = opts[:job_count_limit] || 10
    log = if opts[:log], do: String.to_atom(opts[:log]), else: false
    timeout = opts[:timeout] || 60_000
    connect_timeout = opts[:connect_timeout] || 60_000
    pool_size = opts[:pool_size] || 20
    queue_target = opts[:queue_target] || 5000
    queue_interval = opts[:queue_interval] || 1000
    custom_date_patterns = ["{YYYY}-{0M}-{0D}" | String.split((opts[:custom_date_patterns] || ""), ";")] 
    custom_datetime_patterns = ["{YYYY}-{0M}-{0D} {0h24}:{0m}:{0s}" | String.split((opts[:custom_date_patterns] || ""), ";")] 

    repo_config = [
      username: username,
      password: password,
      host: host,
      insertion_chunk_size: insertion_chunk_size,
      job_count_limit: job_count_limit,
      log: log,
      timeout: timeout,
      connect_timeout: connect_timeout,
      pool_size: pool_size,
      queue_target: queue_target,
      queue_interval: queue_interval
    ]

    repo_config =
      if db_type == "postgres" do
        {Csv2sql.PostgreSQLRepo, repo_config ++ [database: database_name]}
      else
        {Csv2sql.MySQLRepo,
         repo_config ++
           [
             database_name: database_name,
             socket: connection_socket
           ]}
      end

    current_config = [
      csv2sql: [
        {Csv2sql.SchemaMaker,
         [
           varchar_limit: varchar_limit,
           schema_file_path: schema_file_path,
           schema_infer_chunk_size: schema_infer_chunk_size,
           custom_date_patterns: custom_date_patterns,
           custom_datetime_patterns: custom_datetime_patterns
         ]},
        {Csv2sql.MainServer,
         [
           worker_count: worker_count,
           db_worker_count: db_worker_count,
           source_csv_directory: source_csv_directory,
           imported_csv_directory: imported_csv_directory,
           validated_csv_directory: validated_csv_directory,
           set_validate: validate_import,
           db_type: db_type
         ]},
        {Csv2sql.Worker,
         [
           set_make_schema: make_schema,
           set_insert_schema: insert_schema,
           set_insert_data: insert_data
         ]},
        repo_config
      ]
    ]

    Application.put_all_env(current_config)

    opts[:dashboard]
  end

  def get_repo() do
    db_type = Application.get_env(:csv2sql, Csv2sql.MainServer)[:db_type]

    if db_type == "postgres", do: Csv2sql.PostgreSQLRepo, else: Csv2sql.MySQLRepo
  end

  def get_db_type() do
    if Application.get_env(:csv2sql, Csv2sql.MainServer)[:db_type] == "postgres",
      do: :postgres,
      else: :mysql
  end
end

defmodule Csv2sql do
  def main(args) do
    Csv2sql.Helpers.greet()
    # Load configuration varaibles dynamically for escripts, this is required
    # since configuration variables are set to whatever they where when the
    # escript was build and cannot be changed later
    update_config(args)

    # Start supervision tree
    {:ok, sup_pid} = Csv2sql.Application.start(:no_args, :no_args)

    # Wait for finish and stop supervion tree
    # This is done in separate Task to reply back to the caller(dashbaord GUI)
    # immediately after the supervision tree is started successfully
    Task.start(fn -> wait_for_finish(sup_pid) end)

    if !Process.whereis(:error_tracker), do: Csv2sql.ErrorTracker.start_link(:no_args)
    Csv2sql.ErrorTracker.register_supervisor(sup_pid)

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
          queue_interval: :integer
        ]
      )

    source_csv_directory =
      opts[:source_csv_directory] || System.get_env("csv2sql_source_csv_directory") || "."

    schema_file_path =
      opts[:schema_file_path] || is_blank(System.get_env("csv2sql_schema_file_path")) ||
        source_csv_directory

    imported_csv_directory =
      opts[:imported_csv_directory] ||
        (is_blank(System.get_env("csv2sql_imported_csv_directory")) ||
           "#{source_csv_directory}/imported")

    validated_csv_directory =
      opts[:validated_csv_directory] ||
        (is_blank(System.get_env("csv2sql_validated_csv_directory")) ||
           "#{source_csv_directory}/validated")

    make_schema =
      if opts[:skip_make_schema],
        do: false,
        else: if(System.get_env("csv2sql_set_make_schema") == "false", do: false, else: true)

    insert_schema =
      if opts[:skip_insert_schema],
        do: false,
        else: if(System.get_env("csv2sql_set_insert_schema") == "false", do: false, else: true)

    insert_data =
      if opts[:skip_insert_data],
        do: false,
        else: if(System.get_env("csv2sql_set_insert_data") == "false", do: false, else: true)

    validate_import =
      if opts[:skip_validate_import],
        do: false,
        else: if(System.get_env("csv2sql_set_validate") == "false", do: false, else: true)

    [db_type, username, password, host, database_name] =
      if opts[:db_connection_string] do
        str = opts[:db_connection_string]

        [db_type, username, tmp] = String.split(str, ":")

        [password, tmp] = String.split(tmp, "@")

        [host, database_name] = String.split(tmp, "/")

        [db_type, username, password, host, database_name]
      else
        [
          System.get_env("csv2sql_db_type"),
          System.get_env("csv2sql_username"),
          System.get_env("csv2sql_password"),
          System.get_env("csv2sql_host"),
          System.get_env("csv2sql_database_name")
        ]
      end

    connection_socket =
      opts[:connection_socket] || System.get_env("csv2sql_socket") ||
        "/var/run/mysqld/mysqld.sock"

    varchar_limit =
      opts[:varchar_limit] || System.get_env("csv2sql_varchar_limit") |> to_int() ||
        100

    schema_infer_chunk_size =
      opts[:schema_infer_chunk_size] ||
        System.get_env("csv2sql_schema_infer_chunk_size") |> to_int() || 100

    worker_count =
      opts[:worker_count] || System.get_env("csv2sql_db_worker_count") |> to_int() ||
        10

    db_worker_count =
      opts[:db_worker_count] || System.get_env("csv2sql_db_worker_count") |> to_int() ||
        15

    insertion_chunk_size =
      opts[:insertion_chunk_size] ||
        System.get_env("csv2sql_insertion_chunk_size") |> to_int() || 100

    job_count_limit =
      opts[:job_count_limit] || System.get_env("csv2sql_job_count_limit") |> to_int() ||
        10

    log =
      if(opts[:log],
        do: String.to_atom(opts[:log]),
        else: false
      ) ||
        if(System.get_env("csv2sql_log") == "false") do
          false
        else
          if System.get_env("csv2sql_log"),
            do: String.to_atom(System.get_env("csv2sql_log")),
            else: false
        end

    timeout = opts[:timeout] || System.get_env("csv2sql_timeout") |> to_int() || 60000

    connect_timeout =
      opts[:connect_timeout] || System.get_env("csv2sql_connect_timeout") |> to_int() ||
        60000

    pool_size = opts[:pool_size] || System.get_env("csv2sql_pool_size") |> to_int() || 20

    queue_target =
      opts[:queue_target] || System.get_env("csv2sql_queue_target") |> to_int() || 5000

    queue_interval =
      opts[:queue_interval] || System.get_env("csv2sql_queue_interval") |> to_int() ||
        1000

    repo_config = [
      username: username,
      password: password,
      host: host,
      insertion_chunk_size: insertion_chunk_size,
      job_count_limit: job_count_limit,
      log: log
    ]

    repo_config =
      if db_type == "postgres" do
        {Csv2sql.PostgreSQLRepo, repo_config ++ [database: database_name]}
      else
        {Csv2sql.MySQLRepo,
         repo_config ++
           [
             database_name: database_name,
             timeout: timeout,
             connect_timeout: connect_timeout,
             pool_size: pool_size,
             queue_target: queue_target,
             queue_interval: queue_interval,
             socket: connection_socket
           ]}
      end

    current_config = [
      csv2sql: [
        {Csv2sql.SchemaMaker,
         [
           varchar_limit: varchar_limit,
           schema_file_path: schema_file_path,
           schema_infer_chunk_size: schema_infer_chunk_size
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
  end

  def get_repo() do
    db_type = Application.get_env(:csv2sql, Csv2sql.MainServer)[:db_type]

    cond do
      db_type == "postgres" -> Csv2sql.PostgreSQLRepo
      true -> Csv2sql.MySQLRepo
    end
  end

  def get_db_type() do
    if Application.get_env(:csv2sql, Csv2sql.MainServer)[:db_type] == "postgres",
      do: :postgres,
      else: :mysql
  end

  defp is_blank(item, int \\ false) do
    if item == nil || item == "",
      do: false,
      else: if(int, do: to_int(item), else: item)
  end

  defp to_int(str) do
    if is_nil(str) || str == "" do
      nil
    else
      try do
        String.to_integer(str)
      rescue
        _e in ArgumentError -> nil
      end
    end
  end
end

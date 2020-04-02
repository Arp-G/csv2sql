defmodule Csv2sql do
  def main(args \\ []) do
    # Load configuration varaibles dynamically for escripts, this is required
    # since configuration variables are set to whatever they where when the
    # escript was build and cannot be changed later
    update_config()

    Csv2sql.Application.start(:no_args, :no_args)

    # In escripts as soon as the main() function return,, the escript ends,
    # this allows the escript to keep running.
    receive do
      {:wait} ->
        System.halt(0)
    end
  end

  def update_config() do
    current_config = [
      csv2sql: [
        {Csv2sql.SchemaMaker,
         [
           varchar_limit: System.get_env("csv2sql_varchar_limit") |> String.to_integer(),
           schema_file_path: System.get_env("csv2sql_schema_file_path")
         ]},
        {Csv2sql.MainServer,
         [
           worker_count: System.get_env("csv2sql_worker_count") |> String.to_integer(),
           db_worker_count: System.get_env("csv2sql_db_worker_count") |> String.to_integer(),
           source_csv_directory: System.get_env("csv2sql_source_csv_directory"),
           imported_csv_directory: System.get_env("csv2sql_imported_csv_directory"),
           validated_csv_directory: System.get_env("csv2sql_validated_csv_directory")
         ]},
        {Csv2sql.Repo,
         [
           username: System.get_env("csv2sql_username"),
           password: System.get_env("csv2sql_password"),
           host: System.get_env("csv2sql_host"),
           database_name: System.get_env("csv2sql_database_name"),
           insertion_chunk_size:
             System.get_env("csv2sql_insertion_chunk_size") |> String.to_integer(),
           job_count_limit: System.get_env("csv2sql_job_count_limit") |> String.to_integer(),
           socket: System.get_env("csv2sql_socket"),
           log: if(System.get_env("csv2sql_log") == "false", do: false, else: true),
           timeout: System.get_env("csv2sql_timeout") |> String.to_integer(),
           connect_timeout: System.get_env("csv2sql_connect_timeout") |> String.to_integer(),
           pool_size: System.get_env("csv2sql_pool_size") |> String.to_integer(),
           queue_target: System.get_env("csv2sql_queue_target") |> String.to_integer(),
           queue_interval: System.get_env("csv2sql_queue_interval") |> String.to_integer()
         ]}
      ]
    ]

    Application.put_all_env(current_config)
  end
end

defmodule Csv2sql.Config.Loader do
  @moduledoc """
    Prepares and loads configurations for csv2sql
  """

  import ShorterMaps
  alias Csv2sql.Config

  # Default configurations and guards
  @date_pattern "{YYYY}-{0M}-{0D}"
  @datetime_pattern "{YYYY}-{0M}-{0D} {0h24}:{0m}:{0s}"
  @db_type :mysql

  @min_schema_infer_chunk_size 1
  @schema_infer_chunk_size 100
  @max_schema_infer_chunk_size 10_000

  @min_varchar_limit 1
  @varchar_limit 100
  @max_varchar_limit 255

  @max_worker_count 100
  @min_worker_count 1

  @max_db_worker_count 100
  @min_db_worker_count 1
  @default_db_worker_count 10

  @max_insertion_chunk_size 1000
  @insertion_chunk_size 100
  @min_insertion_chunk_size 1

  @spec get_defaults() :: map()
  def get_defaults do
    %{
      date_patterns: [%{id: 1, pattern: @date_pattern}],
      datetime_patterns: [%{id: 1, pattern: @datetime_pattern}],
      db_type: @db_type,
      drop_existing_tables: false,
      insert_data: false,
      insert_schema: true,
      log: false,
      ordered: false,
      parse_datetime: true,
      remove_illegal_characters: false,
      schema_infer_chunk_size: @schema_infer_chunk_size,
      db_worker_count: @default_db_worker_count,
      varchar_limit: @varchar_limit,
      insertion_chunk_size: @insertion_chunk_size
    }
  end

  @spec get_constraints() :: map()
  def get_constraints do
    %{
      schema_infer_chunk_size: %{
        min: @min_schema_infer_chunk_size,
        max: @max_schema_infer_chunk_size
      },
      varchar_limit: %{min: @min_varchar_limit, max: @max_varchar_limit},
      worker_count: %{min: @min_worker_count, max: @max_worker_count},
      db_worker_count: %{min: @min_db_worker_count, max: @max_db_worker_count},
      insertion_chunk_size: %{min: @min_insertion_chunk_size, max: @max_insertion_chunk_size}
    }
  end

  @spec load(map) :: :ok
  def load(args), do: Application.put_env(:csv2sql, :config, prepare_configs(args))

  @spec worker_count :: pos_integer()
  def worker_count(), do: System.schedulers_online() * 2

  defp prepare_configs(args) do
    dashboard = to_bool(args[:dashboard], false)

    # TODO: add tests
    source_directory = String.trim_trailing(args[:source_directory] || File.cwd!(), "/") <> "/"

    unless File.dir?(source_directory),
      do: raise("Could not find source directory: #{source_directory}")

    schema_path = args[:schema_path] || source_directory

    unless File.dir?(schema_path),
      do: raise("Could not find schema directory: #{schema_path}")

    insert_schema = to_bool(args[:insert_schema])
    insert_data = to_bool(args[:insert_data])

    ordered = to_bool(args[:ordered], false)

    db_config = if insert_schema || insert_data, do: load_db_config(args), else: %{}

    worker_count = get_worker_count(args)
    parse_datetime = to_bool(args[:parse_datetime])
    schema_infer_chunk_size = get_schema_infer_chunk_size(args)
    db_worker_count = get_db_worker_count(args)
    remove_illegal_characters = to_bool(args[:remove_illegal_characters], false)

    config = ~M{
         dashboard, source_directory, schema_path, insert_schema, insert_data,
         ordered, worker_count, parse_datetime, db_worker_count, schema_infer_chunk_size,
         remove_illegal_characters
        }

    struct(Config, Map.merge(config, db_config))
  end

  defp load_db_config(args) do
    db_type = get_db_type(args)
    IO.inspect args, label: "args"
    IO.inspect db_type, label: "DB Type"

    db_url =
      if args[:db_url],
        do: args[:db_url],
        else: raise("Please provide a valid database url")

    varchar_limit = get_varchar_limit(args)
    insertion_chunk_size = get_insertion_chunk_size(args)

    drop_existing_tables = to_bool(args[:drop_existing_tables], false)

    log = strip_string(args[:log])
    log = if log in ~w(info warn debug), do: String.to_atom(log), else: false

    date_patterns = [@date_pattern | get_pattern_list(args[:date_patterns])] |> Enum.uniq()

    datetime_patterns =
      [@datetime_pattern | get_pattern_list(args[:datetime_patterns])] |> Enum.uniq()

    ~M{db_type, db_url, varchar_limit, insertion_chunk_size, log, date_patterns, datetime_patterns, drop_existing_tables}
  end

  defp get_worker_count(~M{worker_count})
       when worker_count >= @min_worker_count and worker_count <= @max_worker_count,
       do: worker_count

  defp get_worker_count(_), do: worker_count()

  defp get_db_worker_count(~M{db_worker_count})
       when db_worker_count >= @min_db_worker_count and db_worker_count <= @max_db_worker_count,
       do: db_worker_count

  defp get_db_worker_count(_), do: @default_db_worker_count

  defp get_insertion_chunk_size(~M{insertion_chunk_size})
       when insertion_chunk_size >= @min_insertion_chunk_size and
              insertion_chunk_size <= @max_insertion_chunk_size,
       do: insertion_chunk_size

  defp get_insertion_chunk_size(_), do: @insertion_chunk_size

  defp get_varchar_limit(~M{varchar_limit})
       when varchar_limit >= @min_varchar_limit and varchar_limit <= @max_varchar_limit,
       do: varchar_limit

  defp get_varchar_limit(_), do: @varchar_limit

  defp get_schema_infer_chunk_size(~M{schema_infer_chunk_size})
       when schema_infer_chunk_size >= @min_schema_infer_chunk_size and
              schema_infer_chunk_size <= @max_schema_infer_chunk_size,
       do: schema_infer_chunk_size

  defp get_schema_infer_chunk_size(_), do: @schema_infer_chunk_size

  defp get_db_type(%{db_type: db_type}),
    do: db_type |> to_string() |> strip_string() |> get_db_type()

  defp get_db_type("mysql"), do: :mysql
  defp get_db_type("postgres"), do: :postgres
  defp get_db_type(:mysql), do: :mysql
  defp get_db_type(:postgres), do: :postgres
  defp get_db_type(_unknown_type), do: @db_type

  defp strip_string(nil), do: nil
  defp strip_string(str) when is_binary(str), do: str |> String.downcase() |> String.trim()
  defp strip_string(_arg), do: nil

  defp to_bool(val, default \\ true) do
    cond do
      val == nil -> default
      val == true -> true
      val == false -> false
      is_binary(val) -> strip_string(val) != "false"
      true -> default
    end
  end

  defp get_pattern_list(pattern_str) when is_binary(pattern_str) and pattern_str != "",
    do: String.split(pattern_str, ";")

  defp get_pattern_list(_pattern_str), do: []
end

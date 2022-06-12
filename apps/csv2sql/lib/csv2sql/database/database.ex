defmodule Csv2sql.Database do
  @moduledoc """
    Database specific functions
  """
  use Csv2sql.Types
  alias Csv2sql.{Config, ProgressTracker, Helpers}
  import ShorterMaps
  require Logger

  @ordering_column_name "CSV_ORDERING_ID"
  @default_db_pool_size 20

  # Public functions
  def start_repo() do
    repo = Helpers.get_config(:db_type) |> get_repo()
    db_url = Helpers.get_config(:db_url)
    ~M{%URI query} = URI.parse(db_url)

    pool_size =
      (query || "")
      |> URI.decode_query()
      |> Map.get("pool_size", @default_db_pool_size)

    repo.start_link(
      url: db_url,
      pool_size: pool_size,
      log: Helpers.get_config(:log)
    )
  end

  @spec run_query!(String.t()) :: db_result_types()
  def run_query!(query) do
    Helpers.get_config(:db_type)
    |> get_repo()
    |> run_query!(query)
  end

  @spec run_query!(atom(), String.t()) :: db_result_types()
  def run_query!(repo, query) do
    Ecto.Adapters.SQL.query!(repo, query)
  end

  @spec get_repo(:mysql | :postgres) :: Csv2sql.MySQLRepo | Csv2sql.PostgresRepo
  def get_repo(:mysql), do: Csv2sql.MySQLRepo
  def get_repo(:postgres), do: Csv2sql.PostgreSQLRepo

  @spec varchar_limit :: pos_integer()
  def varchar_limit, do: Helpers.get_config(:varchar_limit)

  @spec get_db_type(type_map()) :: String.t()
  def get_db_type(type_map), do: get_db_module().type_mapping(type_map)

  @spec get_db_name() :: String.t()
  def get_db_name() do
    with %Config{db_name: db_name} = config when is_nil(db_name) <-
           Application.get_env(:csv2sql, :config) do
      db_name = get_db_module().db_name()
      # Cache the value
      Application.put_env(:csv2sql, :config, %Config{config | db_name: db_name})
      db_name
    else
      %Config{db_name: db_name} ->
        db_name
    end
  end

  @spec get_create_table_ddl(String.t(), String.t(), csv_col_types_list()) :: String.t()
  def get_create_table_ddl(file_path, db_name, column_types) do
    table_name = get_table_name(file_path)
    qq = get_db_module().delimiter()
    column_types = get_ordering_id_column(column_types)

    column_defs =
      column_types
      |> Enum.map_join(", ", fn {column_name, column_type} ->
        "#{qq}#{column_name}#{qq} #{column_type}"
      end)

    # TODO: test for upper case, special character and spaces in table names
    # WARN: "IF NOT EXISTS" is only supported > postgres 9.1
    "CREATE TABLE IF NOT EXISTS #{db_name}.#{qq}#{table_name}#{qq} (#{column_defs});"
  end

  @spec get_drop_table_ddl(String.t(), String.t()) :: String.t()
  def get_drop_table_ddl(file_path, db_name) do
    qq = get_db_module().delimiter()
    "DROP TABLE IF EXISTS #{db_name}.#{qq}#{get_table_name(file_path)}#{qq};"
  end

  @spec insert_data_chunk(Csv2sql.File.t(), list) :: :ok
  def insert_data_chunk(~M{%Csv2sql.File name, path, column_types}, data_chunk) do
    encoded_data_chunk = encode_data_chunk(column_types, data_chunk)
    repo = Helpers.get_config(:db_type) |> get_repo()

    # Todo: Handle and log insertion errors gracefully
    repo.insert_all(name, encoded_data_chunk)

    # Todo: Don't update count in case of failures
    ProgressTracker.update_row_count(path, length(data_chunk))
  end

  def encode_binary(str) do
    if Helpers.get_config(:remove_illegal_characters) do
      # TODO: Check if utf8mb4 is supported https://github.com/tallakt/codepagex/issues/27
      {:ok, str, replaced} =
        Codepagex.to_string(str, :iso_8859_1, Codepagex.replace_nonexistent(""), 0)

      # TODO: fix this can slow down things
      if replaced > 0,
        do: Logger.warn("[#{Process.get(:file)}] Replaced #{replaced} characters in binary data")

      str
    else
      str
    end
  end

  # Callbacks to implement
  @callback type_mapping(type_map()) :: String.t()

  @callback db_name() :: String.t()

  @callback encode(String.t(), String.t()) :: supported_db_data_types()

  @callback delimiter :: <<_::8>>

  @callback get_ordering_column_type :: String.t()

  # Private helpers
  defp get_db(:mysql), do: Csv2sql.Database.MySql
  defp get_db(:postgres), do: Csv2sql.Database.Postgres

  defp get_db_module(), do: get_db(Helpers.get_config(:db_type))

  defp get_table_name(file_path) do
    file_path
    |> Path.basename()
    |> String.trim_trailing()
    |> String.replace(~r/.csv$/i, "")
  end

  defp encode_data_chunk(column_types, data_chunk) do
    data_chunk
    |> Enum.map(fn
      {row, ordering} ->
        [{@ordering_column_name, ordering} | zip_types_with_row(column_types, row)]

      row ->
        zip_types_with_row(column_types, row)
    end)
  end

  defp encode(<<"VARCHAR"::binary, _offset::binary>>, ""), do: ""
  defp encode("TEXT", ""), do: nil
  defp encode(_type, ""), do: nil
  defp encode(type, data), do: get_db_module().encode(type, data)

  defp get_ordering_id_column(column_types) do
    if Helpers.get_config(:ordered),
      do: [{@ordering_column_name, get_db_module().get_ordering_column_type()} | column_types],
      else: column_types
  end

  defp zip_types_with_row(column_types, row) do
    Enum.zip_with(
      column_types,
      row,
      fn {header, type}, data ->
        {header, encode(type, data)}
      end
    )
  end
end

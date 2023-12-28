defmodule Csv2sql.Config do
  @moduledoc """
    Configuration struct defination for csv2sql
  """
  use TypedStruct

  typedstruct enforce: true do
    @typedoc "Csv2sql Configuration struct"

    field(:dashboard, boolean(), default: false)
    field(:source_directory, String.t())
    field(:schema_path, String.t(), enforce: false)
    field(:insert_schema, boolean(), default: true)
    field(:insert_data, boolean(), default: true)
    field(:ordered, boolean(), default: false)
    field(:date_patterns, list(String.t()), default: [])
    field(:datetime_patterns, list(String.t()), default: [])
    field(:schema_infer_chunk_size, non_neg_integer(), default: 100)
    field(:worker_count, non_neg_integer())
    field(:parse_datetime, boolean(), default: true)
    field(:remove_illegal_characters, boolean(), default: false)

    # Database related configs
    field(:db_type, atom(), enforce: false)
    field(:db_name, String.t(), enforce: false)
    field(:db_url, String.t(), enforce: false)
    field(:drop_existing_tables, boolean(), default: false)
    field(:varchar_limit, non_neg_integer(), default: 200)
    field(:db_worker_count, non_neg_integer())
    field(:insertion_chunk_size, non_neg_integer())
    field(:log, boolean(), default: false)
  end
end

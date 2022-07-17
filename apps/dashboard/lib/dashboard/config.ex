defmodule DashBoard.Config do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field(:source_directory)
    field(:schema_path, :string)
    field(:insert_schema, :boolean)
    field(:insert_data, :boolean)
    field(:ordered, :boolean)
    field(:date_patterns, {:array, :utc_datetime})
    field(:datetime_patterns, {:array, :utc_datetime})
    field(:schema_infer_chunk_size, :integer)
    field(:worker_count, :integer)
    field(:parse_datetime, :boolean)
    field(:remove_illegal_characters, :boolean)

    # Database related configs
    field(:db_type, Ecto.Enum, values: [:mysql, :postgres])
    field(:db_name, :string)
    field(:db_url, :string)
    field(:drop_existing_tables, :boolean)
    field(:varchar_limit, :integer)
    field(:db_worker_count, :integer)
    field(:insertion_chunk_size, :integer)
    field(:log, :boolean)
  end

  def changeset(params) do
    cast(%__MODULE__{}, params, __MODULE__.__schema__(:fields))
  end
end

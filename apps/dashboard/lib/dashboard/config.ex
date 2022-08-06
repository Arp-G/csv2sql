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
    field(:db_username, :string)
    field(:db_password, :string)
    field(:db_host, :string)

    # Other Database configs
    field(:drop_existing_tables, :boolean)
    field(:varchar_limit, :integer)
    field(:db_worker_count, :integer)
    field(:insertion_chunk_size, :integer)
    field(:log, :boolean)

    embeds_many(:db_attrs, DashBoard.DbAttribute, on_replace: :delete)
  end

  def changeset(params) do
    attrs_to_cast =
      :fields
      |> __MODULE__.__schema__()
      |> Enum.reject(fn
        field when field in [:db_attrs] -> true
        _field -> false
      end)

    %__MODULE__{}
    |> cast(params, attrs_to_cast)
    |> cast_embed(:db_attrs)
  end
end

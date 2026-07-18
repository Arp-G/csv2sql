defmodule Csv2sql.Config.FileOverride do
  @moduledoc """
  Per-file user overrides — the schema-editor payload.

  `include: false` drops the file from the run entirely; `table_name`
  renames the target table; column overrides (matched by **source
  position**, the 0-based CSV column index) rename, re-type, resize, or
  exclude individual columns.
  """

  use Ecto.Schema

  import Ecto.Changeset

  defmodule ColumnOverride do
    @moduledoc "One column's override, matched by source (CSV) position."
    use Ecto.Schema

    import Ecto.Changeset

    @types [:varchar, :text, :longtext, :integer, :bigint, :float, :boolean, :date, :datetime]

    @primary_key false
    embedded_schema do
      field(:position, :integer)
      field(:name, :string)
      field(:type, Ecto.Enum, values: @types)
      field(:length, :integer)
      field(:include, :boolean, default: true)
    end

    @type t :: %__MODULE__{
            position: non_neg_integer() | nil,
            name: String.t() | nil,
            type: atom() | nil,
            length: pos_integer() | nil,
            include: boolean()
          }

    @spec changeset(t(), map()) :: Ecto.Changeset.t()
    def changeset(override, params) do
      override
      |> cast(params, [:position, :name, :type, :length, :include])
      |> validate_required([:position])
      |> validate_number(:position, greater_than_or_equal_to: 0)
      |> validate_number(:length, greater_than: 0, less_than_or_equal_to: 65_535)
    end
  end

  @primary_key false
  embedded_schema do
    field(:file, :string)
    field(:include, :boolean, default: true)
    field(:table_name, :string)

    embeds_many(:columns, ColumnOverride)
  end

  @type t :: %__MODULE__{
          file: String.t() | nil,
          include: boolean(),
          table_name: String.t() | nil,
          columns: [ColumnOverride.t()]
        }

  @spec changeset(t(), map()) :: Ecto.Changeset.t()
  def changeset(override, params) do
    override
    |> cast(params, [:file, :include, :table_name])
    |> validate_required([:file])
    |> cast_embed(:columns)
  end

  @doc "The column override for a source position, if any."
  @spec column(t() | nil, non_neg_integer()) :: ColumnOverride.t() | nil
  def column(nil, _position), do: nil

  def column(%__MODULE__{columns: columns}, position),
    do: Enum.find(columns, &(&1.position == position))
end

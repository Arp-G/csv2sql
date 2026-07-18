defmodule Csv2sql.Schema.ColumnSpec do
  @moduledoc """
  One column of an inferred (or user-overridden) table schema.

  The engine speaks *abstract types* — adapters map them to dialect SQL.
  `type` + `length` together form the abstract type; `abstract_type/1`
  returns the canonical tuple/atom form used in pattern matches.
  """

  use Ecto.Schema

  @types [:varchar, :text, :longtext, :integer, :bigint, :float, :boolean, :date, :datetime]

  @primary_key false
  embedded_schema do
    field(:position, :integer)
    field(:name, :string)
    field(:original_name, :string)
    field(:type, Ecto.Enum, values: @types)
    field(:length, :integer)
    field(:max_length, :integer, default: 0)
  end

  @type abstract_type ::
          {:varchar, pos_integer()}
          | :text
          | :longtext
          | :integer
          | :bigint
          | :float
          | :boolean
          | :date
          | :datetime

  @type t :: %__MODULE__{
          position: non_neg_integer() | nil,
          name: String.t() | nil,
          original_name: String.t() | nil,
          type: atom() | nil,
          length: pos_integer() | nil,
          max_length: non_neg_integer()
        }

  @doc """
  The canonical abstract type of a column.

  ## Examples

      iex> Csv2sql.Schema.ColumnSpec.abstract_type(
      ...>   %Csv2sql.Schema.ColumnSpec{type: :varchar, length: 42}
      ...> )
      {:varchar, 42}

      iex> Csv2sql.Schema.ColumnSpec.abstract_type(%Csv2sql.Schema.ColumnSpec{type: :bigint})
      :bigint

  """
  @spec abstract_type(t()) :: abstract_type()
  def abstract_type(%__MODULE__{type: :varchar} = column),
    do: {:varchar, max(column.length || 1, 1)}

  def abstract_type(%__MODULE__{type: type}), do: type
end

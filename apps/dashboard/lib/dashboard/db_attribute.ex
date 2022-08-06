defmodule DashBoard.DbAttribute do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field(:id, :string)
    field(:name, :string)
    field(:value, :string)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:id, :name, :value])
    |> validate_required([:id])
  end
end

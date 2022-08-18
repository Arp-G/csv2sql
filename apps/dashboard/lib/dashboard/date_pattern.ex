defmodule DashBoard.DatePattern do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field(:id, :string)
    field(:pattern, :string)
  end

  def changeset(params), do: changeset(%__MODULE__{}, params)

  def changeset(struct, params) do
    struct
    |> cast(params, [:id, :pattern])
    |> validate_required([:id])
  end
end

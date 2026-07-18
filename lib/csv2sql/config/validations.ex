defmodule Csv2sql.Config.Validations do
  @moduledoc """
  Which post-load validation layers run.

  The ledger (in-run row accounting) is always on — it's free and it's
  the ground truth. `counts` re-checks the table's row count
  (append-aware); `fingerprints` compares per-column aggregates of the
  values we sent against one aggregate query per table. `checksum` is
  reserved for the future deep row-hash layer.
  """

  use Ecto.Schema

  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field(:counts, :boolean, default: true)
    field(:fingerprints, :boolean, default: true)
    field(:checksum, :boolean, default: false)
  end

  @type t :: %__MODULE__{counts: boolean(), fingerprints: boolean(), checksum: boolean()}

  @spec changeset(t(), map()) :: Ecto.Changeset.t()
  def changeset(validations, params) do
    cast(validations, params, [:counts, :fingerprints, :checksum])
  end
end

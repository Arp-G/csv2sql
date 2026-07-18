defmodule Csv2sql.Validate.Outcome do
  @moduledoc """
  The result of one validation layer for one file.

  Validation is **report-only**: a failed outcome never fails the file —
  it's rendered in the UI/report with expected-vs-actual detail. The
  `detail` map is JSON-safe (strings/numbers/booleans only).
  """

  use Ecto.Schema

  @layers [:ledger, :counts, :fingerprints]
  @statuses [:passed, :failed, :skipped]

  @primary_key false
  embedded_schema do
    field(:layer, Ecto.Enum, values: @layers)
    field(:status, Ecto.Enum, values: @statuses)
    field(:detail, :map, default: %{})
  end

  @type layer :: :ledger | :counts | :fingerprints
  @type status :: :passed | :failed | :skipped

  @type t :: %__MODULE__{layer: layer(), status: status(), detail: map()}
end

defmodule Csv2sql.Config.ErrorPolicy do
  @moduledoc """
  How a run reacts to failures.

    * `strict` — halt the whole run on the first file failure
      (default: isolate the file and continue).
    * `row_error_threshold_pct` — fail a file once more than this
      percentage of its rows were rejected (the per-file circuit
      breaker). `0` fails on any rejection; `100` never escalates.
    * `row_error_min_sample` — rows that must be read before the
      percentage is meaningful (avoids "1 of the first 3 rows = 33%").
    * `max_retries` / `backoff_ms` — transient-error retry budget per
      chunk; waits double each attempt.
  """

  use Ecto.Schema

  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field(:strict, :boolean, default: false)
    field(:row_error_threshold_pct, :float, default: 5.0)
    field(:row_error_min_sample, :integer, default: 500)
    field(:max_retries, :integer, default: 3)
    field(:backoff_ms, :integer, default: 500)
  end

  @type t :: %__MODULE__{
          strict: boolean(),
          row_error_threshold_pct: float(),
          row_error_min_sample: non_neg_integer(),
          max_retries: non_neg_integer(),
          backoff_ms: pos_integer()
        }

  @spec changeset(t(), map()) :: Ecto.Changeset.t()
  def changeset(policy, params) do
    policy
    |> cast(params, [
      :strict,
      :row_error_threshold_pct,
      :row_error_min_sample,
      :max_retries,
      :backoff_ms
    ])
    |> validate_number(:row_error_threshold_pct,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100
    )
    |> validate_number(:row_error_min_sample, greater_than_or_equal_to: 0)
    |> validate_number(:max_retries, greater_than_or_equal_to: 0, less_than_or_equal_to: 10)
    |> validate_number(:backoff_ms, greater_than_or_equal_to: 1, less_than_or_equal_to: 60_000)
  end
end

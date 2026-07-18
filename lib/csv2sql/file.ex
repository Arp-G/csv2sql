defmodule Csv2sql.File do
  @moduledoc """
  Per-file state as it moves through the pipeline.

  Built at discovery, enriched by each stage, and returned as part of the
  final run state and report.
  """

  use Ecto.Schema

  alias Csv2sql.Error
  alias Csv2sql.Schema.ColumnSpec
  alias Csv2sql.Validate.Ledger

  @statuses [
    :pending,
    :analyzing,
    :creating_schema,
    :loading,
    :validating,
    :done,
    :failed,
    :skipped
  ]

  @primary_key false
  embedded_schema do
    field(:path, :string)
    field(:name, :string)
    field(:table_name, :string)
    field(:size, :integer, default: 0)
    field(:status, Ecto.Enum, values: @statuses, default: :pending)
    field(:row_count, :integer, default: 0)
    field(:timings, :map, default: %{})
    field(:errors_csv, :string)
    field(:encoding, Ecto.Enum, values: [:utf8, :utf16le, :utf16be, :latin1])
    field(:delimiter, Ecto.Enum, values: [:comma, :semicolon, :tab, :pipe])

    field(:fingerprints, {:array, :map}, default: [])

    embeds_many(:columns, ColumnSpec)
    embeds_one(:ledger, Ledger)
    embeds_many(:errors, Error)
    embeds_many(:validation, Csv2sql.Validate.Outcome)
  end

  @type status ::
          :pending
          | :analyzing
          | :creating_schema
          | :loading
          | :validating
          | :done
          | :failed
          | :skipped

  @type t :: %__MODULE__{
          path: String.t() | nil,
          name: String.t() | nil,
          table_name: String.t() | nil,
          size: non_neg_integer(),
          status: status(),
          row_count: non_neg_integer(),
          timings: %{optional(atom()) => non_neg_integer()},
          errors_csv: String.t() | nil,
          encoding: :utf8 | :utf16le | :utf16be | :latin1 | nil,
          delimiter: :comma | :semicolon | :tab | :pipe | nil,
          fingerprints: [map()],
          columns: [ColumnSpec.t()],
          ledger: Ledger.t() | nil,
          errors: [Error.t()],
          validation: [Csv2sql.Validate.Outcome.t()]
        }

  @doc "Marks the file failed with the given error attached."
  @spec fail(t(), Error.t()) :: t()
  def fail(%__MODULE__{} = file, %Error{} = error) do
    %{file | status: :failed, errors: file.errors ++ [error]}
  end

  @doc "Records a stage duration in milliseconds."
  @spec put_timing(t(), atom(), non_neg_integer()) :: t()
  def put_timing(%__MODULE__{} = file, stage, ms) do
    %{file | timings: Map.put(file.timings, stage, ms)}
  end
end

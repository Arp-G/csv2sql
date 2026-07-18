defmodule Csv2sql.Config do
  @moduledoc """
  The single validated configuration for a run.

  Every configuration source — CLI flags, `CSV2SQL_*` environment variables,
  the persisted config file, and the web UI — funnels through `changeset/2`
  and produces one immutable `%Config{}` that is passed down the pipeline.
  Nothing in the engine reads global application env at runtime.
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias Csv2sql.Config.Db

  @primary_key false
  embedded_schema do
    field(:mode, Ecto.Enum, values: [:import, :analyze], default: :import)
    field(:source_dir, :string)
    field(:table_mode, Ecto.Enum, values: [:drop, :append], default: :drop)
    field(:file_workers, :integer)
    field(:insert_workers, :integer, default: 4)
    field(:analyze_chunk_rows, :integer, default: 1000)
    field(:insert_chunk_rows, :integer, default: 2000)
    field(:insert_chunk_bytes, :integer, default: 4_194_304)
    field(:varchar_limit, :integer, default: 200)
    field(:ordered, :boolean, default: false)
    field(:delimiter, Ecto.Enum, values: [:auto, :comma, :semicolon, :tab, :pipe], default: :auto)
    field(:encoding, Ecto.Enum, values: [:auto, :utf8, :utf16, :latin1], default: :auto)
    field(:date_patterns, {:array, :string}, default: ["{YYYY}-{0M}-{0D}"])

    field(:datetime_patterns, {:array, :string},
      default: ["{YYYY}-{0M}-{0D} {0h24}:{0m}:{0s}", "{YYYY}-{0M}-{0D}T{0h24}:{0m}:{0s}"]
    )

    embeds_one(:db, Db)
    embeds_one(:error_policy, Csv2sql.Config.ErrorPolicy)
    embeds_one(:validations, Csv2sql.Config.Validations)
  end

  @type t :: %__MODULE__{
          mode: :import | :analyze,
          source_dir: String.t() | nil,
          table_mode: :drop | :append,
          file_workers: pos_integer() | nil,
          insert_workers: pos_integer(),
          analyze_chunk_rows: pos_integer(),
          insert_chunk_rows: pos_integer(),
          insert_chunk_bytes: pos_integer(),
          varchar_limit: pos_integer(),
          ordered: boolean(),
          delimiter: :auto | :comma | :semicolon | :tab | :pipe,
          encoding: :auto | :utf8 | :utf16 | :latin1,
          date_patterns: [String.t()],
          datetime_patterns: [String.t()],
          db: Db.t() | nil,
          error_policy: Csv2sql.Config.ErrorPolicy.t() | nil,
          validations: Csv2sql.Config.Validations.t() | nil
        }

  @doc """
  Builds a validated `%Config{}` from params.

  Returns `{:ok, config}` or `{:error, changeset}`.
  """
  @spec new(map()) :: {:ok, t()} | {:error, Ecto.Changeset.t()}
  def new(params) when is_map(params) do
    %__MODULE__{}
    |> changeset(params)
    |> apply_action(:insert)
  end

  @doc """
  The changeset behind every config source (CLI, env, file, UI forms).
  """
  @spec changeset(t(), map()) :: Ecto.Changeset.t()
  def changeset(config, params) do
    config
    |> cast(params, [
      :mode,
      :source_dir,
      :table_mode,
      :file_workers,
      :insert_workers,
      :analyze_chunk_rows,
      :insert_chunk_rows,
      :insert_chunk_bytes,
      :varchar_limit,
      :ordered,
      :delimiter,
      :encoding,
      :date_patterns,
      :datetime_patterns
    ])
    |> cast_embed(:db, required: true)
    |> cast_embed(:error_policy)
    |> cast_embed(:validations)
    |> default_embed(:error_policy, %Csv2sql.Config.ErrorPolicy{})
    |> default_embed(:validations, %Csv2sql.Config.Validations{})
    |> validate_required([:source_dir])
    |> put_default(:file_workers, &System.schedulers_online/0)
    |> validate_number(:file_workers, greater_than: 0, less_than_or_equal_to: 100)
    |> validate_number(:insert_workers, greater_than: 0, less_than_or_equal_to: 100)
    |> validate_number(:analyze_chunk_rows, greater_than: 0, less_than_or_equal_to: 100_000)
    |> validate_number(:insert_chunk_rows, greater_than: 0, less_than_or_equal_to: 100_000)
    |> validate_number(:insert_chunk_bytes,
      greater_than_or_equal_to: 65_536,
      less_than_or_equal_to: 268_435_456
    )
    |> validate_number(:varchar_limit, greater_than: 0, less_than_or_equal_to: 65_535)
    |> validate_source_dir()
    |> validate_patterns(:date_patterns)
    |> validate_patterns(:datetime_patterns)
  end

  @adapter_modules %{postgres: Csv2sql.Adapters.Postgres, mysql: Csv2sql.Adapters.MySql}

  @doc "Resolves the adapter module for this config."
  @spec adapter(t()) :: module()
  def adapter(%__MODULE__{db: %Db{adapter: adapter}}), do: Map.fetch!(@adapter_modules, adapter)

  defp put_default(changeset, field, default_fun) do
    case get_field(changeset, field) do
      nil -> put_change(changeset, field, default_fun.())
      _value -> changeset
    end
  end

  defp default_embed(changeset, field, default_struct) do
    case get_field(changeset, field) do
      nil -> put_embed(changeset, field, default_struct)
      _value -> changeset
    end
  end

  defp validate_source_dir(changeset) do
    validate_change(changeset, :source_dir, fn :source_dir, dir ->
      if File.dir?(dir), do: [], else: [source_dir: "is not an existing directory"]
    end)
  end

  defp validate_patterns(changeset, field) do
    validate_change(changeset, field, fn ^field, patterns ->
      case Csv2sql.TimeParse.compile_all(patterns) do
        {:ok, _compiled} -> []
        {:error, pattern, reason} -> [{field, "invalid pattern #{pattern}: #{reason}"}]
      end
    end)
  end
end

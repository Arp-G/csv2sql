# This is required so that changesets can be serialized and stored in browser local storage
# We are using only changes on a changeset
defimpl Jason.Encoder, for: Ecto.Changeset do
  def encode(changeset, opts) do
    Jason.Encode.map(changeset.changes, opts)
  end
end

defmodule DashBoard.Config do
  use Ecto.Schema
  import Ecto.Changeset
  import ShorterMaps

  @primary_key false
  embedded_schema do
    field(:source_directory)
    field(:schema_path, :string)
    field(:insert_schema, :boolean)
    field(:insert_data, :boolean)
    field(:ordered, :boolean)
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

    # Misc
    field(:csv_count, :integer)
    field(:date_time_trial, :string)

    embeds_many(:db_attrs, DashBoard.DbAttribute, on_replace: :delete)
    embeds_many(:date_patterns, DashBoard.DatePattern, on_replace: :delete)
    embeds_many(:date_time_patterns, DashBoard.DateTimePattern, on_replace: :delete)
  end

  def get_defaults do
    Csv2sql.Config.Loader.get_defaults()
    |> Map.merge(%{
      source_directory: get_source_directory(),
      worker_count: System.schedulers_online()
    })
  end

  def changeset(params), do: changeset(%__MODULE__{}, params)

  def changeset(%__MODULE__{} = config, params) do
    attrs_to_cast =
      :fields
      |> __MODULE__.__schema__()
      # Reject nested attributes from cast, they will be loaded via cast_embed/2
      |> Enum.reject(fn
        field when field in ~w[db_attrs date_patterns date_time_patterns]a -> true
        _field -> false
      end)

    changeset =
      config
      |> cast(params, attrs_to_cast)
      |> validate_limit_constraints(Csv2sql.Config.Loader.get_constraints())
      |> validate_source_directory()
      |> validate_path(:schema_path, true)
      |> cast_embed(:db_attrs)
      |> cast_embed(:date_patterns)
      |> cast_embed(:date_time_patterns)

    # Phoenix uses the value of changeset.action to decide if errors should be shown or not on a given form
    %{changeset | action: :insert}
  end

  defp validate_limit_constraints(changeset, constants) do
    Enum.reduce(
      constants,
      changeset,
      fn {key, ~M{min, max}}, changeset ->
        validate_number(
          changeset,
          key,
          greater_than_or_equal_to: min,
          less_than_or_equal_to: max
        )
      end
    )
  end

  defp validate_source_directory(changeset) do
    changeset
    |> validate_path(:source_directory)
    |> add_csv_count()
  end

  defp validate_path(changeset, field, allow_blank \\ false) do
    value = get_change(changeset, field, "")

    if allow_blank && value == "" do
      changeset
    else
      value
      |> File.dir?()
      |> if(
        do: changeset,
        else: add_error(changeset, field, "Invalid path, enter a path to a valid directory")
      )
    end
  end

  defp add_csv_count(changeset) do
    source_directory = get_change(changeset, :source_directory)

    if File.dir?(source_directory) do
      csv_count =
        source_directory
        |> File.ls!()
        |> Enum.filter(&is_csv?/1)
        |> Enum.count()

      if csv_count == 0,
        do: add_error(changeset, :source_directory, "No CSVs found at path"),
        else: put_change(changeset, :csv_count, csv_count)
    else
      changeset
    end
  end

  defp is_csv?(filepath) do
    filepath
    |> String.trim()
    |> String.slice(-4..-1)
    |> String.downcase() == ".csv"
  end

  defp get_source_directory() do
    case :os.type() do
      {:win32, _} ->
        username = System.shell("echo %USERNAME%") |> elem(0) |> String.trim()
        "C:/Users/#{username}/Desktop"

      {:unix, _} ->
        {op, _exit_code} = System.shell("eval echo \"~$USER\"")
        String.trim(op)
    end
  end
end

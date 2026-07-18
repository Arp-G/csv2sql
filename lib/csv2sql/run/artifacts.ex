defmodule Csv2sql.Run.Artifacts do
  @moduledoc """
  The per-run artifacts directory: `<source>/csv2sql_runs/<run_id>/`.

  Holds `schema.sql` (every DDL statement of the run, written in analyze
  mode too — a dry run produces a reviewable schema), and later the run
  report and rejected-row CSVs. Being per-run-id, artifacts are always
  fresh — v3's ever-growing `schema.sql` cannot happen structurally.
  """

  alias Csv2sql.Config

  @doc "The artifacts directory of a run (not created)."
  @spec dir(Config.t(), String.t()) :: Path.t()
  def dir(%Config{} = config, run_id) do
    Path.join([config.source_dir, "csv2sql_runs", run_id])
  end

  @doc "Creates and returns the artifacts directory."
  @spec ensure_dir!(Config.t(), String.t()) :: Path.t()
  def ensure_dir!(%Config{} = config, run_id) do
    path = dir(config, run_id)
    File.mkdir_p!(path)
    path
  end

  @doc "The run's schema.sql path."
  @spec schema_path(Path.t()) :: Path.t()
  def schema_path(artifacts_dir), do: Path.join(artifacts_dir, "schema.sql")

  @doc """
  Appends one file's DDL to `schema.sql`.

  Concurrent appends from file workers are safe: each call is a single
  `O_APPEND` write.
  """
  @spec append_schema(Path.t(), String.t(), [String.t()]) :: :ok
  def append_schema(artifacts_dir, file_name, statements) do
    block = ["-- ", file_name, "\n", Enum.map(statements, &[&1, ";\n"]), "\n"]
    File.write!(schema_path(artifacts_dir), block, [:append])
  end
end

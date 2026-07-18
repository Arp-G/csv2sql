defmodule Csv2sql.Load.ErrorsCsv do
  @moduledoc """
  Writes rejected rows to `<artifacts>/<file>.errors.csv`.

  Layout: `row_number, reason`, then the file's original columns — so a
  cleaned-up errors file can be fixed and re-imported. Written only by
  the file's single accumulation fold, so appends never interleave.
  """

  alias NimbleCSV.RFC4180, as: CSV

  @type state :: %{path: Path.t(), headers: [String.t()], started: boolean()}

  @doc "Prepares the (lazy) writer state; nothing is written yet."
  @spec new(Path.t(), String.t(), [String.t()]) :: state()
  def new(artifacts_dir, file_name, original_headers) do
    %{
      path: Path.join(artifacts_dir, file_name <> ".errors.csv"),
      headers: ["row_number", "reason" | original_headers],
      started: false
    }
  end

  @doc "Appends rejected rows (creates the file with a header on first write)."
  @spec append(state(), [Csv2sql.Load.Inserter.rejected()]) :: state()
  def append(state, []), do: state

  def append(%{started: false} = state, rejected) do
    File.write!(state.path, CSV.dump_to_iodata([state.headers]))
    append(%{state | started: true}, rejected)
  end

  def append(state, rejected) do
    rows =
      Enum.map(rejected, fn %{row: row, row_number: row_number, reason: reason} ->
        [Integer.to_string(row_number), reason | row]
      end)

    File.write!(state.path, CSV.dump_to_iodata(rows), [:append])
    state
  end

  @doc "The errors.csv path if anything was written, else nil."
  @spec path(state()) :: Path.t() | nil
  def path(%{started: true, path: path}), do: path
  def path(_state), do: nil
end

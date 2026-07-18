defmodule Csv2sql.Source.Discovery do
  @moduledoc """
  Finds the CSV files of a run and builds their initial state.

  Ordering is stable (lexicographic by file name) so file positions,
  events, and reports are deterministic across runs.
  """

  alias Csv2sql.File, as: CsvFile
  alias Csv2sql.Validate.Ledger

  @doc "Lists `*.csv` files (case-insensitive) in `dir` as `%Csv2sql.File{}`s."
  @spec discover(Path.t()) :: [CsvFile.t()]
  def discover(dir) do
    dir
    |> File.ls!()
    |> Enum.filter(&csv?/1)
    |> Enum.sort()
    |> Enum.map(&build_file(dir, &1))
    |> Enum.filter(& &1)
  end

  defp csv?(name), do: name |> String.downcase() |> String.ends_with?(".csv")

  defp build_file(dir, name) do
    path = Path.join(dir, name)

    case File.stat(path) do
      {:ok, %File.Stat{type: :regular, size: size}} ->
        %CsvFile{
          path: path,
          name: name,
          table_name: Path.rootname(name),
          size: size,
          status: :pending,
          ledger: Ledger.new()
        }

      _other ->
        nil
    end
  end
end

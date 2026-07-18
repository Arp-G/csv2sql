defmodule Csv2sql.Source.Discovery do
  @moduledoc """
  Finds the CSV files of a run and builds their initial state.

  Ordering is stable (lexicographic by file name) so file positions,
  events, and reports are deterministic across runs.
  """

  alias Csv2sql.Config.FileOverride
  alias Csv2sql.File, as: CsvFile
  alias Csv2sql.Validate.Ledger

  @doc """
  Lists `*.csv` files (case-insensitive) in `dir` as `%Csv2sql.File{}`s.

  User overrides participate here: files with `include: false` are left
  out of the run entirely, and `table_name` overrides replace the
  filename-derived table name.
  """
  @spec discover(Path.t(), [FileOverride.t()]) :: [CsvFile.t()]
  def discover(dir, overrides \\ []) do
    dir
    |> File.ls!()
    |> Enum.filter(&csv?/1)
    |> Enum.sort()
    |> Enum.filter(&included?(&1, overrides))
    |> Enum.map(&build_file(dir, &1, overrides))
    |> Enum.filter(& &1)
  end

  defp csv?(name), do: name |> String.downcase() |> String.ends_with?(".csv")

  defp included?(name, overrides) do
    case Enum.find(overrides, &(&1.file == name)) do
      nil -> true
      override -> override.include
    end
  end

  defp build_file(dir, name, overrides) do
    path = Path.join(dir, name)
    override = Enum.find(overrides, &(&1.file == name))

    case File.stat(path) do
      {:ok, %File.Stat{type: :regular, size: size}} ->
        %CsvFile{
          path: path,
          name: name,
          table_name: table_name(name, override),
          size: size,
          status: :pending,
          ledger: Ledger.new()
        }

      _other ->
        nil
    end
  end

  defp table_name(_name, %FileOverride{table_name: table}) when table not in [nil, ""], do: table
  defp table_name(name, _override), do: Path.rootname(name)
end

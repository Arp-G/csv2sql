defmodule Csv2sql.Cli.SchemaTable do
  @moduledoc """
  Prints inferred schemas for `csv2sql analyze` — the terminal
  counterpart of the UI's schema editor.
  """

  alias Csv2sql.Run
  alias Csv2sql.Schema.ColumnSpec

  @doc "Prints every analyzed file's schema."
  @spec print(Run.t()) :: :ok
  def print(%Run{} = run) do
    run
    |> Run.files_in_order()
    |> Enum.each(&print_file/1)
  end

  defp print_file(%{status: :failed} = file) do
    IO.puts("\ntable #{file.table_name} (#{file.name}) — FAILED")
  end

  defp print_file(file) do
    IO.puts("\ntable #{file.table_name} (#{file.name}, #{file.row_count} rows)")
    width = file.columns |> Enum.map(&String.length(&1.name)) |> Enum.max(fn -> 0 end)

    Enum.each(file.columns, fn column ->
      IO.puts("  #{String.pad_trailing(column.name, width)}  #{sql_ish(column)}")
    end)
  end

  defp sql_ish(%ColumnSpec{type: :varchar} = column), do: "varchar(#{column.length})"
  defp sql_ish(%ColumnSpec{type: type}), do: Atom.to_string(type)
end

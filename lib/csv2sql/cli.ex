defmodule Csv2sql.Cli do
  @moduledoc """
  The headless command-line interface.

      csv2sql import  --source-dir DIR --db-url URL [options]
      csv2sql analyze --source-dir DIR [--db-url URL] [options]
      csv2sql --help | --version

  Configuration precedence: flags > `CSV2SQL_*` env > saved defaults.
  Runs on the same engine and event bus as the web UI; `main/1` returns
  the exit code (`0` ok, `1` completed with errors, `2` failed or
  cancelled, `3` configuration/usage error) — the binary wrapper halts
  with it.
  """

  alias Csv2sql.Cli.Reporter
  alias Csv2sql.Config
  alias Csv2sql.Config.Sources

  @switches [
    source_dir: :string,
    db_url: :string,
    table_mode: :string,
    delimiter: :string,
    encoding: :string,
    ordered: :boolean,
    strict: :boolean,
    varchar_limit: :integer,
    file_workers: :integer,
    insert_workers: :integer,
    date_patterns: :string,
    datetime_patterns: :string
  ]

  @spec main([String.t()]) :: non_neg_integer()
  def main(argv)

  def main(["import" | rest]), do: run(:import, rest)
  def main(["analyze" | rest]), do: run(:analyze, rest)
  def main([flag]) when flag in ["--version", "-v"], do: print_version()
  def main([flag]) when flag in ["--help", "-h"], do: print_help(0)
  def main([]), do: print_help(0)

  def main([unknown | _rest]) do
    IO.puts(:stderr, "unknown command: #{unknown}\n")
    print_help(3)
  end

  defp run(mode, argv) do
    with {:ok, cli_params} <- parse_flags(argv),
         params = mode |> merged_params(cli_params),
         {:ok, config} <- Config.new(params) do
      {:ok, run_id} = Csv2sql.start_run(config, subscribe: true)
      Reporter.consume(run_id, mode)
    else
      {:error, %Ecto.Changeset{} = changeset} ->
        print_config_errors(changeset)
        3

      {:error, message} when is_binary(message) ->
        IO.puts(:stderr, message)
        3
    end
  end

  defp merged_params(mode, cli_params) do
    cli_params
    |> Sources.build()
    |> Map.put("mode", Atom.to_string(mode))
  end

  defp parse_flags(argv) do
    {opts, positional, invalid} = OptionParser.parse(argv, strict: @switches)

    cond do
      invalid != [] ->
        {:error, "invalid option(s): #{Enum.map_join(invalid, ", ", &elem(&1, 0))}"}

      positional != [] ->
        {:error, "unexpected argument(s): #{Enum.join(positional, " ")}"}

      true ->
        {:ok, flags_to_params(opts)}
    end
  end

  defp flags_to_params(opts) do
    Enum.reduce(opts, %{}, fn
      {:db_url, value}, params ->
        put_in(params, [Access.key("db", %{}), "url"], value)

      {:strict, value}, params ->
        put_in(params, [Access.key("error_policy", %{}), "strict"], value)

      {key, value}, params when key in [:date_patterns, :datetime_patterns] ->
        patterns =
          value |> String.split(";") |> Enum.map(&String.trim/1) |> Enum.reject(&(&1 == ""))

        Map.put(params, Atom.to_string(key), patterns)

      {key, value}, params ->
        Map.put(params, Atom.to_string(key), value)
    end)
  end

  defp print_config_errors(changeset) do
    IO.puts(:stderr, "configuration is invalid:")

    changeset
    |> Ecto.Changeset.traverse_errors(fn {message, _opts} -> message end)
    |> flatten_errors()
    |> Enum.each(fn {field, message} -> IO.puts(:stderr, "  #{field}: #{message}") end)
  end

  defp flatten_errors(errors, prefix \\ "") do
    Enum.flat_map(errors, fn {field, messages} ->
      name = if prefix == "", do: to_string(field), else: "#{prefix}.#{field}"

      case messages do
        %{} = nested -> flatten_errors(nested, name)
        list when is_list(list) -> Enum.map(list, &{name, flatten_message(&1)})
      end
    end)
  end

  defp flatten_message(%{} = nested), do: inspect(nested)
  defp flatten_message(message), do: message

  defp print_version do
    IO.puts("csv2sql #{Application.spec(:csv2sql, :vsn)}")
    0
  end

  defp print_help(code) do
    IO.puts("""
    csv2sql — bulk-load CSV files into a database with automatic schema inference

    Usage:
      csv2sql                  start the web UI
      csv2sql import  [flags]  import CSVs headlessly
      csv2sql analyze [flags]  dry run: infer + print schemas, write schema.sql

    Flags:
      --source-dir DIR         directory containing *.csv (env CSV2SQL_SOURCE_DIR)
      --db-url URL             postgres://… or mysql://… (env CSV2SQL_DB_URL;
                               CSV2SQL_DB_PASSWORD fills a password-less URL)
      --table-mode MODE        drop (default) | append
      --delimiter D            auto | comma | semicolon | tab | pipe
      --encoding E             auto | utf8 | utf16 | latin1
      --ordered                add a csv_ordering_id column preserving row order
      --strict                 halt the whole run on the first file failure
      --varchar-limit N        varchar→text threshold (default 200)
      --file-workers N         parallel files (default: CPU cores)
      --insert-workers N       parallel inserts per file (default 4)
      --date-patterns P;P      extra date patterns, e.g. {D}/{M}/{YYYY}
      --datetime-patterns P;P  extra datetime patterns

    Exit codes: 0 ok · 1 completed with rejected rows or failed files ·
    2 run failed or cancelled · 3 configuration error
    """)

    code
  end
end

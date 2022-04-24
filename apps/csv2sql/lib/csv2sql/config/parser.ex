defmodule Csv2sql.Config.Parser do
  @moduledoc """
    Parses command line arguments passed to csv2sql
  """

  @permitted_args [
    help: :boolean,
    version: :boolean,
    dashboard: :boolean,
    source_directory: :string,
    schema_path: :string,
    insert_schema: :string,
    insert_data: :string,
    validate_import: :string,
    date_patterns: :string,
    datetime_patterns: :string,
    schema_infer_chunk_size: :integer,
    worker_count: :integer,
    db_type: :string,
    db_worker_count: :integer,
    insertion_chunk_size: :integer,
    db_url: :string,
    varchar_limit: :integer,
    log: :string
  ]

  def test do
    input = [
      "--source-directory",
      "/tmp",
      "--db-url",
      "root:root1@localhost/mysql?socket=/var/run/mysqld/mysqld.sock",
      "--validate-import",
      "true",
      "--log",
      "error",
      "--datetime-patterns",
      "yyyy;mmmm;{YYYY}-{0M}-{0D};yyyy",
      "--db-worker-count",
      "78",
      "--insertion-chunk-size",
      "34",
      "--db-type",
      "mysql",
      "--varchar-limit",
      "140",
      "--log",
      "debug"
    ]

    {:cont, args} = input |> parse()

    Csv2sql.Config.Loader.load(args)
    Application.get_all_env(:csv2sql)
  end

  @spec parse(list(String.t())) :: {:cont, map()} | {:stop, String.t()}
  def parse(argv) do
    {parsed, _argv} = OptionParser.parse!(argv, strict: @permitted_args)

    cond do
      Keyword.get(parsed, :help) -> {:stop, help_text()}
      Keyword.get(parsed, :version) -> {:stop, version_text()}
      true -> {:cont, Map.new(parsed)}
    end
  end

  # Todo: Read from a yml file maybe?
  defp help_text(), do: "Usage: csv2sql [options] [source_directory]"

  defp version_text do
    vsn = Application.spec(:csv2sql, :vsn) |> to_string()
    "csv2sql version: #{vsn}"
  end
end

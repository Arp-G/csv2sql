defmodule Csv2sql.Support.TestHelper do
  @moduledoc false
  use ExUnit.CaseTemplate
  import ShorterMaps

  using do
    quote do
      require unquote(__MODULE__)
      import unquote(__MODULE__)
      import ShorterMaps
    end
  end

  def load_fixtures(fixture_names \\ []) do
    dest_dir = get_csv_source_path()

    # Delete existing loaded fixtures
    File.rm_rf(dest_dir)
    File.mkdir!(dest_dir)

    # Copy fixtures to csv_src directory
    Enum.map(
      fixture_names,
      fn fixture_name ->
        File.cp(
          "#{get_fixture_path()}/#{fixture_name}",
          "#{dest_dir}/#{fixture_name}"
        )
      end
    )
  end

  defmacro db_test(message, tags \\ Macro.escape(%{}), do: block) do
    quote bind_quoted: [message: message, tags: tags], unquote: true do
      @tag tags: tags
      test "For mysql: #{message}", args do
        db_config = Application.get_env(:csv2sql, :mysql_config)
        args_from_tags = Map.get(args, :tags, %{})

        db_config
        |> Map.merge(args_from_tags)
        # If custom source directory not sent then load default
        |> Map.put_new(:source_directory, get_csv_source_path())
        |> Map.put_new(:drop_existing_tables, true)
        |> Csv2sql.Config.Loader.load()

        unquote(block)
      end

      @tag tags: tags
      test "For postgres: #{message}", args do
        db_config = Application.get_env(:csv2sql, :postgres_config)
        args_from_tags = Map.get(args, :tags, %{})

        db_config
        |> Map.merge(args_from_tags)
        # If custom source directory not sent then load default
        |> Map.put_new(:source_directory, get_csv_source_path())
        |> Map.put_new(:drop_existing_tables, true)
        |> Csv2sql.Config.Loader.load()

        unquote(block)
      end
    end
  end

  def load_default_config do
    # Load some default configs, so that non-db dependent tests work
    %{
      db_type: "msql",
      db_url: "user@password:localhost:3306/dbname",
      log_level: "debug",
      source_directory: get_csv_source_path()
    }
    |> Csv2sql.Config.Loader.load()
  end

  def start_repos do
    Enum.each([:mysql, :postgres], fn db ->
      # Start database Repos
      repo = Csv2sql.Database.get_repo(db)
      ~M{db_url} = Application.get_env(:csv2sql, :"#{db}_config")

      case repo.start_link(url: "ecto://#{db_url}") do
        {:ok, conn} -> conn
        {:error, {:already_started, conn}} -> conn
      end
    end)
  end

  def get_fixture_path, do: "#{File.cwd!()}/test/support/fixtures"
  def get_csv_source_path, do: "#{File.cwd!()}/test/support/csv_src"
end

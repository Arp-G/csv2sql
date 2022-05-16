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

  defmacro db_test(message, tags \\ Macro.escape(%{}), do: block) do
    quote bind_quoted: [message: message, tags: tags], unquote: true do
      @tag tags: tags
      test "For mysql: #{message}", args do
        db_config = Application.get_env(:csv2sql, :mysql_config)
        args_from_tags = Map.get(args, :tags, %{})

        db_config
        |> Map.merge(args_from_tags)
        |> Csv2sql.Config.Loader.load()

        unquote(block)
      end

      @tag tags: tags
      test "For postgres: #{message}", args do
        db_config = Application.get_env(:csv2sql, :postgres_config)
        args_from_tags = Map.get(args, :tags, %{})

        db_config
        |> Map.merge(args_from_tags)
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
      source_directory: "./priv/src"
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
end

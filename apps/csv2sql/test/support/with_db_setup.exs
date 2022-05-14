defmodule WithDbSetup do
  @moduledoc false
  use ExUnit.CaseTemplate

  using do
    quote do
      require WithDbSetup
      import WithDbSetup
    end
  end

  # setup :prep_db

  # def prep_db(args) do
  #   # Get db type configs
  #   test_db_config = Application.get_env(:csv2sql, :mysql_config)

  #   # require IEx; IEx.pry

  #   # IO.puts("PREP FOR #{test_db_type} DB")
  #   # IO.inspect(test_db_config)
  #   # IO.puts("\n")

  #   # Custom args passed via tags
  #   db_args = Map.get(args, :db_args, %{})

  #   # Merge custom args with db type configs and load it into application env
  #   test_db_config
  #   |> Map.merge(db_args)
  #   |> Csv2sql.Config.Loader.load()
  # end

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
end

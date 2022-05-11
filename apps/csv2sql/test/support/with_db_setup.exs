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

  defmacro db_test(message, args \\ quote(do: %{}), do: block) do
    # quoted_stuff = quote do
    #   db_config = Application.get_env(:csv2sql, :"#{db}_config")
    #   IO.input("GOT CONFIG #{inspect db_config}")
    #   db_args = Map.get(args, :db_args, %{})

    #   test_db_config
    #   |> Map.merge(db_args)
    #   |> Csv2sql.Config.Loader.load()
    # end

    quote bind_quoted: [message: message, args: args, block: block], unquote: true do
      # Run test for different db types
      for db <- [:mysql, :postgres] do
        test "For #{db}: #{message}", args do
          unquote(block)
        end
      end
    end
  end
end

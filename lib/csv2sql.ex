defmodule Csv2sql do
  require Logger

  # def parallel_make_schemas(path) do
  #   me = self()

  #   Path.wildcard("#{path}/*.csv")
  #   |> Enum.map(fn file ->
  #     fun = fn file -> {file, Csv2sql.SchemaMaker.make_schema(file)} end

  #     spawn_link(fn -> send(me, {self(), fun.(file)}) end)
  #   end)
  #   |> Enum.map(fn pid ->
  #     receive do
  #       {^pid, {file, [drop, create]}} ->
  #         Logger.debug("Infer Schema for: #{Path.basename(file)}")

  #         db_schema_maker = fn [drop, create] -> Csv2sql.DB.make_db_schema([drop, create]) end

  #         spawn_link(fn -> send(me, {self(), db_schema_maker.([drop, create])}) end)

  #         query = """

  #         #{drop}

  #         #{create}

  #         """

  #         File.write("schema.sql", query, [:append])
  #     end
  #   end)
  # end
end

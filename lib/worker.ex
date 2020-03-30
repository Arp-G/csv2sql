defmodule Csv2sql.Worker do
  use GenServer

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

  def start_link(file) do
    GenServer.start_link(__MODULE__, file)
  end

  def init(file) do
    Process.send_after(self(), {:make_schema, file}, 0)
    {:ok, nil}
  end

  def handle_info({:make_schema, file}, _) do
    queries = Csv2sql.SchemaMaker.make_schema(file)

    GenServer.cast(self(), {:insert_schema, {file, queries}})

    {:noreply, nil}
  end

  def handle_cast({:insert_schema, {file, queries}}, _) do
    Csv2sql.DB.make_db_schema(queries)

    # GenServer.cast(__MODULE__, {:insert_data, file})

    {:noreply, nil}
  end

  def handle_cast(:insert_data, _data) do
    {:noreply, nil}
  end

  def handle_cast(:validate_data, _state) do
    {:noreply, nil}
  end

  # def format_status(_reason, [_pdict, state]) do
  #   [data: [{'State', "The current Stack is #{inspect(state)}"}]]
  # end
end

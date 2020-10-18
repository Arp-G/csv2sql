defmodule Csv2sql.Observer do
  use GenServer

  @status_list [:pending, :infer_schema, :insert_schema, :insert_data, :finish]
  @stage_list [:loading_files, :waiting, :working, :validation, :finish, :error]

  def get_stats do
    try do
      # timeout is infinity here this makes the caller wait until server responds
      # usefull when the server is loading files in handle_continue block
      # catch block is usefull when genserver is requested when it is not running
      GenServer.call(__MODULE__, :get_stats, :infinity)
    catch
      _, _ ->
        nil
    end
  end

  def get_stage do
    GenServer.call(__MODULE__, :get_stage, :infinity)
  end

  def next_file() do
    GenServer.call(__MODULE__, :next_file, :infinity)
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, :no_args, name: __MODULE__)
  end

  def update_file_status(file, new_status) do
    GenServer.cast(__MODULE__, {:update_status, file, new_status})
  end

  def change_stage(new_stage) do
    GenServer.cast(__MODULE__, {:change_stage, new_stage})
  end

  def update_active_worker_count(worker_count) do
    GenServer.cast(__MODULE__, {:update_active_worker_count, worker_count})
  end

  def update_validation_status(validation_status) do
    GenServer.call(__MODULE__, {:update_validation_status, validation_status}, :infinity)
  end

  def set_schema(file, schema) do
    GenServer.call(__MODULE__, {:set_schema, file, schema}, :infinity)
  end

  def get_schema(file) do
    GenServer.call(__MODULE__, {:get_schema, file}, :infinity)
  end

  def init(_) do
    {:ok,
     %{
       start_time: DateTime.utc_now(),
       file_list: %{},
       files_to_process: [],
       stage: :loading_files,
       validation_status: nil,
       active_worker_count: Application.get_env(:csv2sql, Csv2sql.MainServer)[:worker_count]
     }, {:continue, :load_files}}
  end

  # Will be invoked right after init, the genserver will always process this callback first before any other messages
  def handle_continue(:load_files, state) do
    {files_map, files_to_process} = get_file_list()

    {:noreply,
     Map.merge(
       state,
       %{stage: :working, file_list: files_map, files_to_process: files_to_process}
     )}
  end

  def handle_call({:set_schema, file, schema}, _from, %{file_list: file_list} = state) do
    {_, file_list} =
      Map.get_and_update(file_list, file, fn file_struct ->
        {file, Map.put(file_struct, :schema, schema)}
      end)

    {:reply, nil, Map.put(state, :file_list, file_list)}
  end

  def handle_call({:get_schema, file}, _from, %{file_list: file_list} = state) do
    %Csv2sql.File{schema: schema} = Map.get(file_list, file)
    {:reply, schema, state}
  end

  def handle_call(
        :next_file,
        _from,
        %{files_to_process: files_to_process, file_list: files_map} = state
      ) do
    {path, rest} = List.pop_at(files_to_process, -1)

    row_count =
      if path do
        %Csv2sql.File{row_count: row_count} = files_map[path]
        row_count
      else
        0
      end

    {:reply, {path, row_count}, Map.put(state, :files_to_process, rest)}
  end

  def handle_call(
        :get_stats,
        _from,
        state
      ) do
    {:reply, state, state}
  end

  def handle_call(:get_stage, _from, %{stage: stage} = state) do
    {:reply, stage, state}
  end

  def handle_call({:update_validation_status, validation_status}, _from, state) do
    {:reply, validation_status, Map.put(state, :validation_status, validation_status)}
  end

  def handle_cast({:change_stage, new_stage}, state) when new_stage in @stage_list do
    {:noreply, Map.put(state, :stage, new_stage)}
  end

  def handle_cast({:update_active_worker_count, worker_count}, state) do
    {:noreply, Map.put(state, :active_worker_count, worker_count)}
  end

  def handle_cast(
        {:update_status, file, status},
        state
      )
      when status in @status_list do
    file_struct = state.file_list[file]

    new_status =
      case {file_struct.status, status} do
        {{:insert_data, progress}, :insert_data} ->
          current_progress =
            progress + Application.get_env(:csv2sql, Csv2sql.get_repo())[:insertion_chunk_size]

          if current_progress >= file_struct.row_count,
            do: :finish,
            else: {:insert_data, current_progress}

        {_, :insert_data} ->
          {:insert_data, 0}

        _ ->
          status
      end

    file_struct = %Csv2sql.File{state.file_list[file] | status: new_status}

    {
      :noreply,
      Map.put(
        state,
        :file_list,
        Map.put(state.file_list, file, file_struct)
      )
    }
  end

  defp get_file_list() do
    source_dir = Application.get_env(:csv2sql, Csv2sql.MainServer)[:source_csv_directory]

    source_dir
    |> File.ls!()
    |> Enum.reject(fn file ->
      extension =
        file
        |> String.slice(-4..-1)
        |> String.downcase()

      extension != ".csv"
    end)
    |> Enum.reduce({%{}, []}, fn file, {file_map, file_list} ->
      path = "#{source_dir}/#{file}"

      %{size: size} = File.stat!(path)

      file_struct = %Csv2sql.File{
        name: String.slice(file, 0..-5),
        path: path,
        raw_size: size,
        humanised_size: Sizeable.filesize(size),
        row_count: Csv2sql.ImportValidator.get_count_from_csv(path),
        status: :pending
      }

      {Map.put(file_map, path, file_struct), file_list ++ [path]}
    end)
  end
end

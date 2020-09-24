defmodule DashboardWeb.MainLive do
  use DashboardWeb, :live_view

  alias DashboardWeb.Helper.ConfigHelper

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       file_list: [],
       stage: :waiting,
       timer_set: nil,
       stats: %{
         active_workers: 0,
         worker_count: 0,
         db_worker_count: 0,
         cpu_usage: 0,
         memory_usage: 0,
         time_spend: 0
       }
     )}
  end

  @impl true
  def handle_event(
        "start",
        _,
        %{assigns: assigns} = socket
      ) do
    new_stage =
      case assigns.stage do
        :waiting ->
          ConfigHelper.get_to_config_arg() |> Csv2sql.main()
          send(self(), :tick)

          :working

        :finish ->
          :reset

        :working ->
          :working
      end

    if new_stage == :reset do
      {:noreply,
       assign(socket,
         file_list: [],
         stage: :waiting,
         timer_set: nil,
         stats: %{
           active_workers: 0,
           worker_count: 0,
           db_worker_count: 0,
           cpu_usage: 0,
           memory_usage: 0,
           time_spend: 0
         }
       )}
    else
      {:noreply, assign(socket, stage: new_stage)}
    end
  end

  @impl true
  def handle_info(:tick, %{assigns: assigns} = socket) do
    case assigns.stage do
      :finish ->
        {:noreply, assign(socket, timer_set: nil)}

      _ ->
        Csv2sql.Observer.get_stats()
        |> case do
          # Handles genserver get_stats call when work has finished and observer server has shut down
          nil ->
            {:noreply, assign(socket, stage: :finish, timer_set: nil)}

          # Updates socket assigns according to observer server stats reports
          %{
            start_time: start_time,
            file_list: file_list,
            stage: stage,
            active_worker_count: active_worker_count
          } ->
            file_list =
              file_list
              |> Enum.map(fn {_, file_struct} -> file_struct end)
              |> Enum.sort_by(fn %Csv2sql.File{raw_size: size} -> size end, :desc)

            time_taken =
              DateTime.utc_now()
              |> Time.diff(start_time, :millisecond)
              |> Kernel./(1000)
              |> Float.round()

            {:noreply,
             assign(socket,
               file_list: file_list,
               stage: stage,
               timer_set: Process.send_after(self(), :tick, 500),
               stats: %{
                 active_workers: active_worker_count,
                 worker_count: Application.get_env(:csv2sql, Csv2sql.MainServer)[:worker_count],
                 db_worker_count:
                   Application.get_env(:csv2sql, Csv2sql.MainServer)[:db_worker_count],
                 cpu_usage: :cpu_sup.util() |> Float.round(2),
                 memory_usage: :erlang.memory(:total) |> Sizeable.filesize(),
                 time_spend: time_taken
               }
             )}
        end
    end
  end

  @impl true
  def handle_params(_unsigned_params, _uri, socket) do
    {:noreply, socket}
  end

  def calc_total_progress(file_list) do
    if file_list == [] do
      0
    else
      {total, current} =
        Enum.reduce(file_list, {0, 0}, fn %{row_count: row_count, status: status},
                                          {total, current} ->
          current =
            case status do
              {:insert_data, file_progress} -> current + file_progress
              :finish -> current + row_count
              _ -> 0
            end

          {total + row_count, current}
        end)

      Float.round(current / total * 100, 2)
    end
  end
end

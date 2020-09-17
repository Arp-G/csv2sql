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
          Task.start(fn ->
            ConfigHelper.get_to_config_arg()
            |> Csv2sql.main()
          end)

          Process.send_after(self(), :tick, 1000)
          :working

        :finish ->
          :reset

        :working ->
          :working
      end

    {:noreply, assign(socket, stage: new_stage)}
  end

  @impl true
  def handle_info(:tick, %{assigns: assigns} = socket) do
    case assigns.stage do
      :finish ->
        {:noreply, assign(socket, timer_set: nil)}

      _ ->
        file_list =
          Csv2sql.Observer.get_stats()
          |> Enum.map(fn {_, file_struct} -> file_struct end)
          |> Enum.sort_by(fn %Csv2sql.File{raw_size: size} -> size end, :desc)

        {:noreply,
         assign(socket,
           file_list: file_list,
           stage: Csv2sql.Observer.get_stage(),
           timer_set: Process.send_after(self(), :tick, 1000),
           stats: %{
             active_workers: 0,
             worker_count: Application.get_env(:csv2sql, Csv2sql.MainServer)[:worker_count],
             db_worker_count: Application.get_env(:csv2sql, Csv2sql.MainServer)[:db_worker_count],
             cpu_usage: :cpu_sup.util() |> Float.round(2),
             memory_usage: :erlang.memory(:total) |> Sizeable.filesize(),
             time_spend: Csv2sql.TimerServer.get_time_spend()
           }
         )}
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

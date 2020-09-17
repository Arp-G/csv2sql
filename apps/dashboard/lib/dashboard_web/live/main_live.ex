defmodule DashboardWeb.MainLive do
  use DashboardWeb, :live_view

  alias DashboardWeb.Helper.ConfigHelper

  @impl true
  def mount(_params, _session, socket) do
    # file_list =
    #   [
    #     %Csv2sql.File{
    #       humanised_size: "1.57 MB",
    #       name: "010_person_attachments_20200911",
    #       path: "/home/arpan/Desktop/test/csvs/010_person_attachments_20200911.csv",
    #       raw_size: 1_642_432,
    #       row_count: 10725,
    #       status: :finish
    #     }
    #   ] ++ file_list

    {:ok, assign(socket, file_list: [], stage: :waiting, timer_set: nil)}
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

          :timer.send_after(1000, self(), :kickoff)
          :working

        :finish ->
          :reset

        :working ->
          :working
      end

    {:noreply, assign(socket, stage: new_stage)}
  end

  @impl true
  def handle_info(:kickoff, socket) do
    {:noreply,
     assign(socket,
       timer_set: Process.send_after(self(), :tick, 1000)
     )}
  end

  @impl true
  def handle_info(:tick, %{assigns: assigns} = socket) do

    IO.inspect("Tick !")

    case {assigns.stage, socket.assigns[:timer_set]} do
      {:finish, nil} ->
        {:noreply, socket}

      {:finish, timer} ->
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
           timer_set: Process.send_after(self(), :tick, 1000)
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

  def tick do
  end
end

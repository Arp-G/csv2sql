defmodule DashboardWeb.MainLive do
  use DashboardWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    file_list =
      Csv2sql.Observer.get_file_list()
      |> Enum.map(fn {_, file_struct} -> file_struct end)
      |> Enum.sort_by(fn %Csv2sql.File{raw_size: size} -> size end, :desc)

    file_list =
      [
        %Csv2sql.File{
          humanised_size: "1.57 MB",
          name: "010_person_attachments_20200911",
          path: "/home/arpan/Desktop/test/csvs/010_person_attachments_20200911.csv",
          raw_size: 1_642_432,
          row_count: 10725,
          status: :finish
        }
      ] ++ file_list

    {:ok, assign(socket, file_list: file_list, stage: :waiting)}
  end

  @impl true
  def handle_event(
        "start",
        _,
        %{assigns: assigns} = socket
      ) do
    new_stage =
      case assigns.stage do
        :waiting -> :working
        :finish -> :reset
        :working -> :working
      end

    {:noreply, assign(socket, stage: new_stage)}
  end

  @impl true
  def handle_params(_unsigned_params, _uri, socket) do
    {:noreply, socket}
  end
end

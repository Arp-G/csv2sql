defmodule DashboardWeb.MainLive do
  use DashboardWeb, :live_view
  import ShorterMaps
  import DashboardWeb.LiveHelpers
  alias DashboardWeb.IconSvg

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, page: "config")}
  end

  @impl true
  def handle_event("page-change", ~m{page}, socket) do
    {:noreply, assign(socket, ~M{page})}
  end
end

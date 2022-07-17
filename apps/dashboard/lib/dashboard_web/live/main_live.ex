defmodule DashboardWeb.Live.MainLive do
  use DashboardWeb, :live_view
  alias DashBoard.Config

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       page: "config",
       changeset: Ecto.Changeset.change(%DashBoard.Config{})
     )}
  end

  @impl true
  def handle_event("page-change", ~m{page}, socket) do
    {:noreply, assign(socket, ~M{page})}
  end

  @impl true
  def handle_event("validate-and-save", attrs, socket) do
    {:noreply,
     assign(socket,
       page: "config",
       changeset: Config.changeset(Map.get(attrs, "config", %{}))
     )}
  end
end

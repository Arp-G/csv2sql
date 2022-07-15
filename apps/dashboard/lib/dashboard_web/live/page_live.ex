defmodule DashboardWeb.PageLive do
  use DashboardWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{})}
  end

  def render(assigns) do
    ~H"""
      <div class="m-2"> CSV2SQL1 ! </div>
    """
  end
end

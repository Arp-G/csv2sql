defmodule DashboardWeb.Live.ConfigLive do
  use DashboardWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
      <.form let={f} for={@changeset} phx-change="validate-and-save">
        <.flow_card form={f}/>
      </.form>
    """
  end
end

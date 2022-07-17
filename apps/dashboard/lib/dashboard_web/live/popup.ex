defmodule DashboardWeb.Live.Popup do
  import Phoenix.LiveView.Helpers

  def render(assigns \\ %{}) do
    ~H"""
      <div
        id={@id}
        phx-update="ignore"
        data-bs-toggle="tooltip"
        data-bs-placement="top"
        title={@title}
        class="tool-tip-wrapper"
        >
        <DashboardWeb.Live.IconSvg.bulb dimensions={%{width: 20, height: 20}}/>
      </div>
    """
  end
end

defmodule DashboardWeb.Live.Modal do
  import ShorterMaps
  import DashboardWeb.LiveHelpers
  import DashboardWeb.Live.UI
  import Phoenix.LiveView.Helpers
  alias DashboardWeb.Live.IconSvg

  def modal(assigns) do
    ~H"""
      <div
        id={"#{@id}"}
        class="live-modal"
        tabindex="-1"
        phx-key="escape"
        phx-window-keydown="close-modal"
        phx-click-away="close-modal">

        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
            <%= render_slot(@inner_block) %>
          </div>
        </div>
      </div>
    """
  end
end

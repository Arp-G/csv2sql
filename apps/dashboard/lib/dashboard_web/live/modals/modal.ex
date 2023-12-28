defmodule DashboardWeb.Live.Modals do
  use DashboardWeb, :component

  def modal(assigns) do
    ~H"""
    <!-- First time inside modal click way bug -->
    <div
      class="live-modal opacity-transition"
      tabindex="-1"
      phx-key="escape"
      phx-window-keydown={hide_modal()}
      phx-click-away={hide_modal()}
    >
      <div class="card">
        <div class="card-header">
          <h5 class="d-inline-block"><%= @title %></h5>
          <button
            type="button"
            class="btn-close position-absolute inline-block end-0 pe-4"
            aria-label="Close"
            phx-click={hide_modal()}
          >
          </button>
        </div>

        <div class="card-body">
          <p><%= render_slot(@inner_block) %></p>
        </div>
      </div>
    </div>
    """
  end

  defp hide_modal(js \\ %JS{}) do
    js
    |> JS.hide(to: ".live-modal", transition: "opacity-0")
    |> JS.hide(to: ".modal-backdrop", transition: "opacity-0")
    |> JS.push("close-modal")
  end
end

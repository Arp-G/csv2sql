defmodule DashboardWeb.Live.Modals do
  import ShorterMaps
  import Phoenix.LiveView
  import DashboardWeb.LiveHelpers
  import DashboardWeb.Live.UI
  import Phoenix.LiveView.Helpers
  alias DashboardWeb.Live.IconSvg
  alias Phoenix.LiveView.JS

  def modal(assigns) do
    ~H"""
      <div class="modal-backdrop show opacity-transition"></div>
      <div
        id={"#{@id}"}
        class="live-modal opacity-transition"
        tabindex="-1"
        phx-key="escape"
        phx-window-keydown={hide_modal()}
        phx-click-away={hide_modal()}>
          <div class="card">
            <div class="card-header">
              <h5 class="d-inline-block"> <%= @title %> </h5>
              <button
                type="button"
                class="btn-close position-absolute inline-block end-0 pe-4"
                aria-label="Close" phx-click={hide_modal()}>
              </button>
            </div>

            <div class="card-body">
              <p><%= render_slot(@inner_block) %></p>
            </div>
          </div>
      </div>
    """
  end

  def db_attrs_modal(assigns) do
    ~H"""
      <.modal
        id={"db-attrs-modal"}
        title={"Add additional DB attributes"}
        >
        <div>
          <h5 class="card-title">Card title</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </.modal>
    """
  end

  defp hide_modal(js \\ %JS{}) do
    js
    |> JS.hide(to: ".live-modal", transition: "opacity-0")
    |> JS.hide(to: ".modal-backdrop", transition: "opacity-0")
    |> JS.push("close-modal")
  end
end

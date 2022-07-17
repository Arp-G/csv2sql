defmodule DashboardWeb.Live.UI do
  import Phoenix.LiveView.Helpers
  import Phoenix.HTML.Form
  alias DashboardWeb.Live.IconSvg

  def flow_card(assigns \\ %{}) do
    ~H"""
      <div class="card d-flex flex-row justify-content-around w-75 m-auto mt-4">
        <div class="card-body d-flex flex-column align-items-center pb-0">
          <IconSvg.infer_schema dimensions={%{width: 40, height: 40}}/>
          <div class="d-flex flex-row justify-content-around m-2">
            <div> <DashboardWeb.Live.Popup.render title="TODO: popup title" id ="infer_schema_popup" /> </div>
            <span> Infer Schema </span>
          </div>
        </div>

        <div class="card-body d-flex flex-column align-items-center">
          <IconSvg.right_arrow dimensions={%{width: 50, height: 50}}/>
        </div>

        <div class="card-body d-flex flex-column align-items-center pb-0">
          <IconSvg.insert_schema />
          <div class="d-flex flex-row justify-content-around m-2">
            <div> <DashboardWeb.Live.Popup.render title="TODO: popup title" id ="insert_schema_popup" /> </div>
            <div class="form-check">
              <%= checkbox @form, :insert_schema, class: "form-check-input" %>
              <%= label @form, :insert_schema, "Create Tables", class: "form-check-label" %>
            </div>
          </div>
        </div>

        <div class="card-body d-flex flex-column align-items-center">
          <IconSvg.right_arrow dimensions={%{width: 50, height: 50}}/>
        </div>

        <div class="card-body d-flex flex-column align-items-center pb-0">
          <IconSvg.insert_data />
          <div class="d-flex flex-row justify-content-around m-2">
            <div> <DashboardWeb.Live.Popup.render title="TODO: popup title" id ="insert_data_popup" /> </div>
            <div class="form-check">
              <%= checkbox @form, :insert_data, class: "form-check-input" %>
              <%= label @form, :insert_data, class: "form-check-label" %>
            </div>
          </div>
        </div>
      </div>
    """
  end
end

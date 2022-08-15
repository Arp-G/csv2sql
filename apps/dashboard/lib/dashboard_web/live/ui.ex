defmodule DashboardWeb.Live.UI do
  import Phoenix.LiveView.Helpers
  import Phoenix.HTML.Form
  alias DashboardWeb.Live.IconSvg

  def db_connection_check(assigns \\ %{}) do
    db_url = Dashboard.Helpers.create_db_url(assigns.changeset.changes)

    # TODO: Maybe add loader for indicating on going db connect check
    ~H"""
      <div class="db-connect-check border p-2 rounded">
        <div>
          <%= if @db_connection_established do %>
            <IconSvg.check_icon {%{width: 20, height: 20}} />
            <span class="fw-bold font-monospace small text-success"> CAN CONNECT TO DATABASE! </span>
          <% else %>
            <IconSvg.warn_icon {%{width: 23, height: 23}} />
            <span class="fw-bold font-monospace small text-danger"> COULD NOT CONNECT TO DATABASE! </span>
          <% end %>
        </div>

        <div class="mt-2 small text-dark fw-bold font-monospace">
          <p class="db-url-text" title={db_url}> DATABASE URL: <%= db_url %> </p>
        </div>
      </div>
    """
  end

  def popup(assigns \\ %{}) do
    ~H"""
      <div
        id={@id}
        phx-update="ignore"
        data-bs-toggle="tooltip"
        data-bs-placement="top"
        title={@title}
        class="tool-tip-wrapper"
        phx-hook="initTooltipPopup"
        >
        <IconSvg.bulb {%{width: 20, height: 20}}/>
      </div>
    """
  end

  def config_item(assigns \\ %{}) do
    ~H"""
      <div {%{class: "card-body #{assigns[:class]}"}}>
        <div class="d-flex pb-2">
          <.popup title={@tooltip} id={@id}/>

          <%= if assigns[:checkbox_input] do %>
            <div>
              <%= render_slot(@input, @form) %>
            </div>
          <% end %>

          <div class="ms-2">
            <%= if assigns[:required_input] do %>
              <span class="text-danger fw-bolder"> * </span>
            <% end %>
            <em> <%= @title %> </em>
          </div>
        </div>

        <%= if !assigns[:checkbox_input] do%>
          <div> <%= render_slot(@input, @form) %> </div>
        <% end %>
      </div>
    """
  end

  def flow_card(assigns \\ %{}) do
    ~H"""
      <div class="card d-flex flex-row justify-content-around w-75 m-auto mt-4">
        <div class="card-body d-flex flex-column align-items-center pb-0">
          <IconSvg.infer_schema dimensions={%{width: 40, height: 40}}/>
          <div class="d-flex flex-row justify-content-around m-2">
            <div> <.popup title="TODO: popup title" id="infer_schema_popup" /> </div>
            <span> Infer Schema </span>
          </div>
        </div>

        <div class="card-body d-flex flex-column align-items-center">
          <IconSvg.right_arrow dimensions={%{width: 50, height: 50}}/>
        </div>

        <div class="card-body d-flex flex-column align-items-center pb-0">
          <IconSvg.insert_schema />
          <div class="d-flex flex-row justify-content-around m-2">
            <div> <.popup title="TODO: popup title" id="insert_schema_popup" /> </div>
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
            <div> <.popup title="TODO: popup title" id="insert_data_popup" /> </div>
            <div class="form-check">
              <%= checkbox @form, :insert_data, class: "form-check-input" %>
              <%= label @form, :insert_data, class: "form-check-label" %>
            </div>
          </div>
        </div>
      </div>
    """
  end

    @doc """
  Generates tag for inlined form input errors.
  """
  def error_tag(form, field) do
    Enum.map(Keyword.get_values(form.errors, field), fn error ->
      Phoenix.HTML.Tag.content_tag(:span, translate_error(error),
        class: "invalid-feedback",
        phx_feedback_for: input_name(form, field)
      )
    end)
  end

  @doc """
  Translates an error message.
  """
  def translate_error({msg, opts}) do
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", fn _ -> to_string(value) end)
    end)
  end
end

defmodule DashboardWeb.Live.Modal.DbAttributesModal do
  use DashboardWeb, :component

  def db_attrs_modal(assigns) do
    db_attrs_added =
      assigns.changeset |> Ecto.Changeset.get_field(:db_attrs, []) |> length() != 0

    assigns = assign(assigns, :db_attrs_added, db_attrs_added)

    ~H"""
    <DashboardWeb.Live.Modals.modal title="Add additional DB attributes">
      <div>
        <div class="fst-italic mt-2 ms-2">
          Add additional database attributes, click here to
          <a href="https://github.com/Arp-G/csv2sql/wiki" target="_blank">learn</a>
          more
          <div class="text-danger fst-italic font-monospace small">
            (Duplicate and empty attributes will be ignored)
          </div>
        </div>
        <!-- TODO: Make this better: data list only works on double click -->
        <datalist id="db-attrs-suggestions">
          <option value="pool_size" />
          <option value="queue_target" />
          <option value="queue_interval" />
          <option value="socket" />
        </datalist>

        <div class="scrollable-container" id="db-attrs-container">
          <%= if @db_attrs_added do %>
            <%= for {db_attrs_form, index} <- Enum.with_index(inputs_for(@form, :db_attrs), 1) do %>
              <div class="d-flex flex-row">
                <div class="input-group mb-3">
                  <span class="input-group-text fw-bold pe-2 pt-1"><%= index %>.</span>
                  <%= text_input(db_attrs_form, :name,
                    class: "form-control",
                    placeholder: "Attribute name",
                    list: "db-attrs-suggestions"
                  ) %>
                  <span class="input-group-text"> = </span>
                  <%= text_input(db_attrs_form, :value,
                    class: "form-control",
                    placeholder: "Attribute value"
                  ) %>
                </div>

                <%= hidden_input(db_attrs_form, :id) %>

                <div
                  role="button"
                  phx-click="remove-db-attr"
                  phx-value-attrid={Ecto.Changeset.get_field(db_attrs_form.source, :id)}
                >
                  <IconSvg.remove_icon class="ms-2 pt-1" />
                </div>
              </div>
            <% end %>
          <% else %>
            <div class="text-center mt-4 pt-4">
              <div><IconSvg.empty_icon {%{height: 100, width: 100}} /></div>
              <div class="fw-bold fst-italic font-monospace text-danger">
                No additional database configs added!
              </div>
            </div>
          <% end %>
        </div>

        <div class="add-link text-center">
          <IconSvg.add_icon {%{width: 28}} />
          <span phx-click="add-new-db-attr"> Add more database configurations </span>
        </div>
      </div>
    </DashboardWeb.Live.Modals.modal>
    """
  end
end

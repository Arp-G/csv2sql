defmodule DashboardWeb.Live.Modal.DbAttributesModal do
  use DashboardWeb, :component

  def db_attrs_modal(assigns) do
    ~H"""
      <DashboardWeb.Live.Modals.modal title="Add additional DB attributes">
        <div>
          <span class="fst-italic">
            Add additional database attributes, click here to <a href="https://github.com/Arp-G/csv2sql/wiki" target="_blank">learn</a> more
          </span>
          <br/>
          <span class="text-danger fst-italic font-monospace small"> (Empty attributes would be ignored) </span>

          <!-- TODO: Make this better: data list only works on double click -->
          <datalist id="db-attrs-suggestions">
            <option value="pool_size"/>
            <option value="queue_target"/>
            <option value="queue_interval"/>
            <option value="socket"/>
          </datalist>

          <div class="db-attrs-container">
            <%= inputs_for @form, :db_attrs, fn db_attrs_form -> %>
              <div class="input-group mb-3">
                <div class="input-group mb-3">
                  <%= hidden_input(db_attrs_form, :id) %>
                  <%= text_input db_attrs_form, :name, class: "form-control", placeholder: "Attribute name", list: "db-attrs-suggestions" %>
                  <span class="input-group-text"> = </span>
                  <%= text_input db_attrs_form, :value, class: "form-control", placeholder: "Attribute value" %>

                  <!-- TODO: on adding new item: ob=document.getElementsByClassName("db-attrs-container")[0]; ob.scrollTop = ob.scrollHeight ; -->
                  <!-- style scroll bar -->
                  <!-- using hidden_input_for? -->

                  <!-- Initially for a new db_attr the id is present in db_attrs_form.data.id but once edited db_attrs_form.data becomes nil so we get id from params -->
                  <div role="button" phx-click="remove-db-config" phx-value-attrid={db_attrs_form.data.id || db_attrs_form.params["id"]}>
                    <IconSvg.remove_icon class="ms-2 mt-1"/>
                  </div>
                </div>
              </div>
            <% end %>
          </div>

          <a href="#" class="btn btn-primary" phx-click="add-new-db-config">Add more databse configurations</a>
        </div>
      </DashboardWeb.Live.Modals.modal>
    """
  end
end

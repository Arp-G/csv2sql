defmodule DashboardWeb.Live.ConfigLive do
  use DashboardWeb, :live_view
  import DashboardWeb.Live.Modal.DbAttributesModal

  # TODO: Break this in simple components and remove any unneeded classes and cleanup the markup
  @impl true
  def render(assigns) do
    ~H"""
      <.form let={f} for={@changeset} phx-change="validate-and-save">
        <.flow_card form={f}/>

        <!-- General Configurations -->
        <div class="card m-4 d-flex w-75 m-auto mt-4">
          <div class="text-danger ms-2 mt-2 fst-italic font-monospace small">
            Configurations marked with
            <span class="fw-bolder"> * </span>
            are required
          </div>

          <div class="d-flex flex-row">
            <.config_item
              form={f}
              id="source_directory_config"
              title="Source directory"
              tooltip="TODO: popup title"
              required_input={true}
              placeholder="CSV source directory path">
              <:input let={f}>
                <%= text_input f, :source_directory, "phx-debounce": "1000", class: "form-control", placeholder: "CSV source directory path" %>
              </:input>
              <%= DashboardWeb.ErrorHelpers.error_message(f, :source_directory) %>
            </.config_item>

            <.config_item
              form={f}
              id="schema_path_config"
              title="Schema file path"
              tooltip="TODO: popup title"
              placeholder="Schema file path">
              <:input let={f}>
                <%= text_input f, :schema_path, "phx-debounce": "1000", class: "form-control", placeholder: "Schema file path" %>
              </:input>
            </.config_item>

            <.config_item
              form={f}
              id="worker_count_config"
              title="Worker Count"
              tooltip="TODO: popup title"
              placeholder="Worker count">
              <:input let={f}>
                <%= text_input f, :worker_count, type: "number", class: "form-control", placeholder: "Worker count" %>
              </:input>
            </.config_item>

            <.config_item
              form={f}
              id="schema_infer_chunk_size"
              title="Chunk Size"
              tooltip="TODO: popup title"
              placeholder="Chunk Size">
              <:input let={f}>
                <%= text_input f, :schema_infer_chunk_size, type: "number", class: "form-control", placeholder: "Chunk Size" %>
              </:input>
            </.config_item>

            <div>
              <.config_item
                form={f}
                checkbox_input={true}
                id="parse_datetime_config"
                class="pb-2"
                title="Parse Datetime"
                tooltip="TODO: popup title">
                <:input let={f}>
                  <%= checkbox f, :parse_datetime, class: "form-check-input" %>
                </:input>
              </.config_item>

              <.config_item
                form={f}
                checkbox_input={true}
                id="remove_illegal_characters_config"
                class="pt-0"
                title="Remove illegal characters"
                tooltip="TODO: popup title">
                <:input let={f}>
                  <%= checkbox f, :remove_illegal_characters, class: "form-check-input" %>
                </:input>
              </.config_item>
            </div>
          </div>
        </div>

        <!-- Database Configurations -->
        <div class="card m-4 d-flex w-75 m-auto mt-4">
          <header>
            <IconSvg.db_settings class="m-2"/>
            <span class="font-monospace small fst-italic fw-bold"> Database Configurations </span>
          </header>

          <div class="d-flex">
            <div class="d-flex flex-column">
              <!-- Database Type -->
              <.config_item
                form={f}
                id="db_type_config"
                class="pb-0"
                title="DB Type"
                required_input={true}
                tooltip="TODO: popup title">
                <:input let={f}>
                  <div class="d-flex flex-column">
                    <div class="form-check">
                      <%= radio_button f, :db_type, :mysql, class: "form-check-input mt-4", id: "mysql_db_type", checked: "checked" %>
                      <label class="form-check-label mysql-label" for="mysql_db_type">
                        <IconSvg.mysql_icon {%{width: 100, height: 100}} />
                      </label>
                    </div>
                    <div class="form-check">
                      <%= radio_button f, :db_type, "postgres", class: "form-check-input mt-4", id: "postgres_db_type" %>
                      <label class="form-check-label postgres-label" for="postgres_db_type">
                        <div>
                          <IconSvg.postgresql_icon />
                          <span> Postgre<span class="inner-text">SQL</span> </span>
                        </div>
                      </label>
                    </div>
                  </div>
                  <hr/>
                </:input>
              </.config_item>

              <div class="d-flex flex-column">
                <.config_item
                  form={f}
                  checkbox_input={true}
                  id="drop_existing_tables_config"
                  class="pb-2"
                  title="Drop existing tables"
                  tooltip="TODO: popup title">
                  <:input let={f}> <%= checkbox f, :drop_existing_tables, class: "form-check-input" %> </:input>
                </.config_item>

                <.config_item
                  form={f}
                  checkbox_input={true}
                  id="log_config_config"
                  class="pt-0"
                  title="Verbose Logging"
                  tooltip="TODO: popup title">
                  <:input let={f}> <%= checkbox f, :log, class: "form-check-input" %> </:input>
                </.config_item>
              </div>
            </div>

            <div class="d-flex flex-column">

              <.db_connection_check changeset={@changeset} db_connection_established={@db_connection_established} />

              <div class="d-flex">
                <.config_item
                  form={f}
                  id="db_name_config"
                  class="pb-0"
                  title="Database name"
                  tooltip="TODO: popup title"
                  required_input={true}
                  placeholder="Database name">
                  <:input let={f}>
                    <%= text_input f, :db_name, class: "form-control", placeholder: "Database name" %>
                  </:input>
                </.config_item>

                <.config_item
                  form={f}
                  id="db_host_config"
                  title="Database Host"
                  tooltip="TODO: popup title"
                  required_input={true}
                  placeholder="Database host">
                  <:input let={f}>
                    <%= text_input f, :db_host, class: "form-control", placeholder: "Database host" %>
                  </:input>
                </.config_item>
              </div>

              <div class="d-flex">
                <.config_item
                  form={f}
                  id="db_username_config"
                  title="Database username"
                  tooltip="TODO: popup title"
                  required_input={true}
                  placeholder="Database username">
                  <:input let={f}>
                    <%= text_input f, :db_username, class: "form-control", placeholder: "Database username" %>
                  </:input>
                </.config_item>

                <.config_item
                  form={f}
                  id="db_password_config"
                  title="Database password"
                  tooltip="TODO: popup title"
                  required_input={true}
                  placeholder="Database password">
                  <:input let={f}>
                    <%= text_input f, :db_password, type: "password", class: "form-control", placeholder: "Database password" %>
                  </:input>
                </.config_item>
              </div>

              <div class="add-link">
                <IconSvg.add_icon />
                <span phx-click="open-modal" phx-value-modal="add-more-db-attrs"> Add more database configurations </span>

                <!-- These hidden elements supply db_attrs as form changes when db_attrs modal is closed -->
                <%= if @modal != "add-more-db-attrs" do %>
                  <%= inputs_for f, :db_attrs, fn db_attrs_form -> %>
                    <%= hidden_input(db_attrs_form, :id) %>
                    <%= hidden_input(db_attrs_form, :name) %>
                    <%= hidden_input(db_attrs_form, :value) %>
                  <% end %>
                <% end %>

              </div>
            </div>

            <div class="d-flex flex-column">
              <.config_item
                form={f}
                id="varchar_limit_config"
                class="pb-0"
                title="Varchar size"
                tooltip="TODO: popup title"
                placeholder="Varchar size">
                <:input let={f}>
                  <%= text_input f, :varchar_limit, type: "number", class: "form-control", placeholder: "Varchar size" %>
                </:input>
              </.config_item>

              <.config_item
                form={f}
                id="db_worker_count_config"
                class="pb-0"
                title="DB Worker Count"
                tooltip="TODO: popup title"
                placeholder="DB Worker count">
                <:input let={f}>
                  <%= text_input f, :db_worker_count, type: "number", class: "form-control", placeholder: "DB Worker count" %>
                </:input>
              </.config_item>

              <.config_item
                form={f}
                id="insertion_chunk_size_config"
                title="Insertion Chunk Size"
                tooltip="TODO: popup title"
                placeholder="Insertion Chunk Size">
                <:input let={f}>
                  <%= text_input f, :insertion_chunk_size, type: "number", class: "form-control", placeholder: "Insertion Chunk size" %>
                </:input>
              </.config_item>
            </div>
          </div>
        </div>

        <%= case @modal do %>
          <% "add-more-db-attrs" -> %> <.db_attrs_modal id="db_attrs_modal" form={f} />
          <% _ -> %>
        <% end %>
      </.form>
    """
  end
end

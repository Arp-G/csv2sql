defmodule DashboardWeb.Live.ConfigLive do
  use DashboardWeb, :component
  import DashboardWeb.Live.Modal.DbAttributesModal
  import DashboardWeb.Live.Modal.DateTimePatternsModal

  # TODO: Break this in simple components and remove any unneeded classes and cleanup the markup
  def config_page(assigns) do
    assigns = assign(assigns, :form, to_form(assigns.changeset))

    ~H"""
    <.form for={@form} phx-change="validate-and-save">
      <.flow_card form={@form} />
      <!-- General Configurations -->
      <div class="card m-4 d-flex w-75 m-auto mt-4">
        <div class="text-danger ms-2 mt-2 fst-italic font-monospace small">
          Configurations marked with <span class="fw-bolder"> * </span> are required
        </div>

        <div class="d-flex flex-row">
          <.config_item
            form={@form}
            id="source_directory_config"
            title="Source directory"
            tooltip="TODO: popup title"
            required_input={true}
            placeholder="CSV source directory path"
          >
            <:input let={@form}>
              <%= text_input(@form, :source_directory,
                "phx-debounce": "1000",
                class: "form-control",
                placeholder: "CSV source directory path"
              ) %>
              <%= if (csv_count = Ecto.Changeset.get_field(@changeset, :csv_count)) && !is_nil(csv_count) && csv_count > 0 do %>
                <span>Found <%= csv_count %> csvs at given path</span>
              <% end %>
              <%= error_tag(@form, :source_directory) %>
            </:input>
          </.config_item>

          <.config_item
            form={@form}
            id="schema_path_config"
            title="Schema file path"
            tooltip="TODO: popup title"
            placeholder="Schema file path"
          >
            <:input let={@form}>
              <%= text_input(@form, :schema_path,
                "phx-debounce": "1000",
                class: "form-control",
                placeholder: "Schema file path"
              ) %>
              <%= error_tag(@form, :schema_path) %>
            </:input>
          </.config_item>

          <.config_item
            form={@form}
            id="worker_count_config"
            title="Worker Count"
            tooltip="TODO: popup title"
            placeholder="Worker count"
          >
            <:input let={@form}>
              <%= text_input(@form, :worker_count,
                type: "number",
                class: "form-control",
                placeholder: "Worker count",
                max: @constraints.worker_count.max,
                min: @constraints.worker_count.min
              ) %>
              <%= error_tag(@form, :worker_count) %>
            </:input>
          </.config_item>

          <.config_item
            form={@form}
            id="schema_infer_chunk_size"
            title="Chunk Size"
            tooltip="TODO: popup title"
            placeholder="Chunk Size"
          >
            <:input let={@form}>
              <%= text_input(@form, :schema_infer_chunk_size,
                type: "number",
                class: "form-control",
                placeholder: "Chunk Size",
                max: @constraints.schema_infer_chunk_size.max,
                min: @constraints.schema_infer_chunk_size.min
              ) %>
              <%= error_tag(@form, :schema_infer_chunk_size) %>
            </:input>
          </.config_item>

          <div>
            <.config_item
              form={@form}
              checkbox_input={true}
              id="parse_datetime_config"
              class="pb-2"
              title="Parse Datetime"
              tooltip="TODO: popup title"
            >
              <:input let={@form}>
                <%= checkbox(@form, :parse_datetime, class: "form-check-input") %>
              </:input>
            </.config_item>

            <.config_item
              form={@form}
              checkbox_input={true}
              id="remove_illegal_characters_config"
              class="pt-0"
              title="Remove illegal characters"
              tooltip="TODO: popup title"
            >
              <:input let={@form}>
                <%= checkbox(@form, :remove_illegal_characters, class: "form-check-input") %>
              </:input>
            </.config_item>

            <%= if Ecto.Changeset.get_field(@changeset, :parse_datetime) do %>
              <div class="add-link">
                <IconSvg.add_icon />
                <span phx-click="open-modal" phx-value-modal="add-date-time-patterns">
                   Add date time patterns
                </span>
              </div>
            <% end %>
          </div>
        </div>
      </div>
      <!-- Database Configurations -->
      <div class={"card m-4 d-flex w-75 m-auto mt-4 #{unless(db_needed(@changeset), do: "invisible")}"}>
        <header>
          <IconSvg.db_settings class="m-2" />
          <span class="font-monospace small fst-italic fw-bold"> Database Configurations </span>
        </header>

        <div class="d-flex">
          <div class="d-flex flex-column">
            <!-- Database Type -->
            <.config_item
              form={@form}
              id="db_type_config"
              class="pb-0"
              title="DB Type"
              required_input={true}
              tooltip="TODO: popup title"
            >
              <:input let={@form}>
                <div class="d-flex flex-column">
                  <div class="form-check">
                    <%= radio_button(@form, :db_type, :mysql,
                      class: "form-check-input mt-4",
                      id: "mysql_db_type",
                      checked: "checked",
                      disable: !db_needed(@changeset)
                    ) %>
                    <label class="form-check-label mysql-label" for="mysql_db_type">
                      <IconSvg.mysql_icon {%{width: 100, height: 100}} />
                    </label>
                  </div>
                  <div class="form-check">
                    <%= radio_button(@form, :db_type, "postgres",
                      class: "form-check-input mt-4",
                      id: "postgres_db_type"
                    ) %>
                    <label class="form-check-label postgres-label" for="postgres_db_type">
                      <div>
                        <IconSvg.postgresql_icon />
                        <span>Postgre<span class="inner-text">SQL</span></span>
                      </div>
                    </label>
                  </div>
                </div>
                <hr />
              </:input>
            </.config_item>

            <div class="d-flex flex-column">
              <.config_item
                form={@form}
                checkbox_input={true}
                id="drop_existing_tables_config"
                class="pb-2"
                title="Drop existing tables"
                tooltip="TODO: popup title"
              >
                <:input let={@form}>
                  <%= checkbox(@form, :drop_existing_tables, class: "form-check-input") %>
                </:input>
              </.config_item>

              <.config_item
                form={@form}
                checkbox_input={true}
                id="log_config_config"
                class="pt-0"
                title="Verbose Logging"
                tooltip="TODO: popup title"
              >
                <:input let={@form}><%= checkbox(@form, :log, class: "form-check-input") %></:input>
              </.config_item>
            </div>
          </div>

          <div class="d-flex flex-column">
            <.db_connection_check
              changeset={@changeset}
              db_connection_established={@db_connection_established}
            />

            <div class="d-flex">
              <.config_item
                form={@form}
                id="db_name_config"
                class="pb-0"
                title="Database name"
                tooltip="TODO: popup title"
                required_input={true}
                placeholder="Database name"
              >
                <:input let={@form}>
                  <%= text_input(@form, :db_name, class: "form-control", placeholder: "Database name") %>
                </:input>
              </.config_item>

              <.config_item
                form={@form}
                id="db_host_config"
                title="Database Host"
                tooltip="TODO: popup title"
                required_input={true}
                placeholder="Database host"
              >
                <:input let={@form}>
                  <%= text_input(@form, :db_host, class: "form-control", placeholder: "Database host") %>
                </:input>
              </.config_item>
            </div>

            <div class="d-flex">
              <.config_item
                form={@form}
                id="db_username_config"
                title="Database username"
                tooltip="TODO: popup title"
                required_input={true}
                placeholder="Database username"
              >
                <:input let={@form}>
                  <%= text_input(@form, :db_username,
                    class: "form-control",
                    placeholder: "Database username"
                  ) %>
                </:input>
              </.config_item>

              <.config_item
                form={@form}
                id="db_password_config"
                title="Database password"
                tooltip="TODO: popup title"
                required_input={true}
                placeholder="Database password"
              >
                <:input let={@form}>
                  <%= text_input(@form, :db_password,
                    type: "password",
                    class: "form-control",
                    placeholder: "Database password"
                  ) %>
                </:input>
              </.config_item>
            </div>

            <div class="add-link">
              <IconSvg.add_icon />
              <span phx-click="open-modal" phx-value-modal="add-more-db-attrs">
                 Add more database configurations
              </span>
            </div>
          </div>

          <div class="d-flex flex-column">
            <.config_item
              form={@form}
              id="varchar_limit_config"
              class="pb-0"
              title="Varchar size"
              tooltip="TODO: popup title"
              placeholder="Varchar size"
            >
              <:input let={@form}>
                <%= text_input(@form, :varchar_limit,
                  type: "number",
                  class: "form-control",
                  placeholder: "Varchar size",
                  max: @constraints.varchar_limit.max,
                  min: @constraints.varchar_limit.min
                ) %>
                <%= error_tag(@form, :varchar_limit) %>
              </:input>
            </.config_item>

            <.config_item
              form={@form}
              id="db_worker_count_config"
              class="pb-0"
              title="DB Worker Count"
              tooltip="TODO: popup title"
              placeholder="DB Worker count"
            >
              <:input let={@form}>
                <%= text_input(@form, :db_worker_count,
                  type: "number",
                  class: "form-control",
                  placeholder: "DB Worker count",
                  max: @constraints.db_worker_count.max,
                  min: @constraints.db_worker_count.min
                ) %>
                <%= error_tag(@form, :db_worker_count) %>
              </:input>
            </.config_item>

            <.config_item
              form={@form}
              id="insertion_chunk_size_config"
              title="Insertion Chunk Size"
              tooltip="TODO: popup title"
              placeholder="Insertion Chunk Size"
            >
              <:input let={@form}>
                <%= text_input(@form, :insertion_chunk_size,
                  type: "number",
                  class: "form-control",
                  placeholder: "Insertion Chunk size",
                  max: @constraints.insertion_chunk_size.max,
                  min: @constraints.insertion_chunk_size.min
                ) %>
                <%= error_tag(@form, :insertion_chunk_size) %>
              </:input>
            </.config_item>
          </div>
        </div>
      </div>
      <!-- These hidden elements supply db_attrs as form changes when db_attrs modal is closed -->
      <%= if @modal != "add-more-db-attrs" do %>
        <%= inputs_for @form, :db_attrs, fn assoc_form -> %>
          <%= hidden_input(assoc_form, :id) %>
          <%= hidden_input(assoc_form, :name) %>
          <%= hidden_input(assoc_form, :value) %>
        <% end %>
      <% end %>

      <%= if @modal != "add-date-time-patterns" do %>
        <%= inputs_for @form, :date_time_patterns, fn assoc_form -> %>
          <%= hidden_input(assoc_form, :id) %>
          <%= hidden_input(assoc_form, :pattern) %>
        <% end %>

        <%= inputs_for @form, :date_patterns, fn assoc_form -> %>
          <%= hidden_input(assoc_form, :id) %>
          <%= hidden_input(assoc_form, :pattern) %>
        <% end %>
      <% end %>

      <%= case @modal do %>
        <% "add-more-db-attrs" -> %>
          <.db_attrs_modal id="db_attrs_modal" form={@form} changeset={@changeset} />
        <% "add-date-time-patterns" -> %>
          <.date_time_patterns_modal
            id="date_time_patterns_modal"
            form={@form}
            changeset={@changeset}
            matching_date_time={@matching_date_time}
          />
        <% _ -> %>
      <% end %>
    </.form>
    """
  end

  defp db_needed(changeset) do
    Ecto.Changeset.get_field(changeset, :insert_schema) ||
      Ecto.Changeset.get_field(changeset, :insert_data)
  end
end

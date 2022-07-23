defmodule DashboardWeb.Live.ConfigLive do
  use DashboardWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
      <.form let={f} for={@changeset} phx-change="validate-and-save">
        <.flow_card form={f}/>

        <div class="card m-4 d-flex w-75 m-auto mt-4">
          <div class="text-danger ms-2 mt-2 fst-italic font-monospace small">
            Configurations marked with
            <span class="fw-bolder"> * </span>
            are required
          </div>

          <div class="d-flex flex-row">
            <.config_item
              id="source_directory_config"
              title="Source directory"
              tooltip="TODO: popup title"
              required_input={true}
              placeholder="CSV source directory path">
              <:input let={f}>
                <%= text_input f, :source_directory, "phx-debounce": "1000", class: "form-control", placeholder: "CSV source directory path" %>
              </:input>
            </.config_item>

            <.config_item
              id="schema_path"
              title="Schema file path"
              tooltip="TODO: popup title"
              placeholder="Schema file path">
              <:input let={f}>
                <%= text_input f, :schema_path, "phx-debounce": "1000", class: "form-control", placeholder: "Schema file path" %>
              </:input>
            </.config_item>

            <.config_item
              id="worker_count_config"
              title="Worker Count"
              tooltip="TODO: popup title"
              placeholder="Worker count">
              <:input let={f}>
                <%= text_input f, :worker_count, type: "number", class: "form-control", placeholder: "Worker count" %>
              </:input>
            </.config_item>

            <.config_item
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

        <div class="card m-4 d-flex w-75 m-auto mt-4">
          <div>
            <IconSvg.db_settings class="m-2"/>
            <span class="font-monospace small fst-italic fw-bold"> Database Configurations </span>

            <.config_item
              id="db_type"
              title="DB Type"
              required_input={true}
              tooltip="TODO: popup title">
              <:input let={f}>
                <div class="d-flex flex-row">
                  <div class="form-check">
                    <%= text_input f, :source_directory, type: "radio", class: "form-check-input mt-4", name: "db_type", id: "mysql_db_type" %>
                    <label class="form-check-label position-relative mysql-label" for="mysql_db_type">
                      <IconSvg.mysql_icon {%{width: 100, height: 100}} />
                    </label>
                  </div>
                  <div class="form-check">
                    <%= text_input f, :source_directory, type: "radio", class: "form-check-input mt-4", name: "db_type", id: "postgres_db_type" %>
                    <label class="form-check-label" for="postgres_db_type">
                     <IconSvg.postgresql_icon {%{width: 320, height: 100}} />
                    </label>
                  </div>
                </div>
              </:input>
            </.config_item>

            <.config_item
              id="schema_path"
              title="Schema file path"
              tooltip="TODO: popup title"
              placeholder="Schema file path">
              <:input let={f}>
                <%= text_input f, :schema_path, "phx-debounce": "1000", class: "form-control", placeholder: "Schema file path" %>
              </:input>
            </.config_item>

          </div>
        </div>
      </.form>
    """
  end

  # field(:db_type, Ecto.Enum, values: [:mysql, :postgres])
  # field(:db_name, :string)
  # field(:db_url, :string)
  # field(:drop_existing_tables, :boolean)
  # field(:varchar_limit, :integer)
  # field(:db_worker_count, :integer)
  # field(:insertion_chunk_size, :integer)
  # field(:log, :boolean)
end

defmodule Csv2sqlWeb.ImportLive do
  @moduledoc """
  The import workspace: configure a run, test the connection, start an
  analyze (dry run) or import, and see current runs.

  Runs are **not** tied to this process — starting one hands it to the
  engine's `RunsSupervisor` and navigates to its monitor page; this page
  (and the whole browser) can come and go freely.
  """

  use Csv2sqlWeb, :live_view

  alias Csv2sql.Config
  alias Csv2sql.Config.Store
  alias Csv2sql.Events
  alias Csv2sqlWeb.UI

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: Events.subscribe_runs()
    params = deep_merge(default_params(), Store.load())

    {:ok,
     socket
     |> assign(:page_title, "New import")
     |> assign(:form, config_form(params))
     |> assign(:pending_params, params)
     |> assign(:probe, nil)
     |> assign(:advanced_open, false)
     |> assign(:runs, Csv2sql.list_runs())}
  end

  @impl true
  def handle_event("validate", %{"config" => params}, socket) do
    params = normalize_params(params)

    {:noreply, assign(socket, form: config_form(params), pending_params: params, probe: nil)}
  end

  def handle_event("start", %{"config" => params}, socket) do
    case params |> normalize_params() |> Config.new() do
      {:ok, config} ->
        {:ok, run_id} = Csv2sql.start_run(config)
        {:noreply, push_navigate(socket, to: ~p"/runs/#{run_id}")}

      {:error, changeset} ->
        {:noreply, assign(socket, form: to_form(changeset, as: :config, action: :validate))}
    end
  end

  # A plain phx-click carries no form data — probe from the tracked
  # params, which "validate" keeps current on every form change.
  def handle_event("probe", _params, socket) do
    normalized =
      socket.assigns.pending_params
      |> normalize_params()
      |> Map.put("mode", "analyze")
      |> Map.put("source_dir", ".")

    case Config.new(normalized) do
      {:ok, config} ->
        adapter = Config.adapter(config)
        db = config.db

        {:noreply,
         socket
         |> assign(:probe, :running)
         |> start_async(:probe, fn -> adapter.ensure_database(db) end)}

      {:error, _changeset} ->
        {:noreply, assign(socket, :probe, {:error, "fix the database URL first"})}
    end
  end

  # A native <details> would lose its client-side open state on every
  # form-change patch — the drawer is server-driven instead.
  def handle_event("toggle-advanced", _params, socket) do
    {:noreply, update(socket, :advanced_open, &(!&1))}
  end

  def handle_event("save_defaults", _params, socket) do
    case Store.save(socket.assigns.pending_params) do
      :ok ->
        {:noreply,
         put_flash(socket, :info, "Saved as defaults (database password is never stored)")}

      {:error, reason} ->
        {:noreply, put_flash(socket, :error, "could not save defaults: #{inspect(reason)}")}
    end
  end

  @impl true
  def handle_async(:probe, {:ok, result}, socket) do
    probe =
      case result do
        :ok ->
          :ok

        {:error, {:database_not_found, name}} ->
          {:error, "database #{inspect(name)} does not exist"}

        {:error, %{__exception__: true} = e} ->
          {:error, Exception.message(e)}

        {:error, other} ->
          {:error, inspect(other)}
      end

    {:noreply, assign(socket, :probe, probe)}
  end

  def handle_async(:probe, {:exit, reason}, socket) do
    {:noreply, assign(socket, :probe, {:error, "probe crashed: #{inspect(reason)}"})}
  end

  # Run lifecycle events (started/terminal) refresh the runs list.
  @impl true
  def handle_info(%{run_id: _id}, socket) do
    {:noreply, assign(socket, :runs, Csv2sql.list_runs())}
  end

  defp config_form(params) do
    %Config{}
    |> Config.changeset(params)
    |> Map.put(:action, :validate)
    |> to_form(as: :config)
  end

  defp default_params do
    %{
      "source_dir" => "",
      "table_mode" => "drop",
      "delimiter" => "auto",
      "encoding" => "auto",
      "ordered" => "false",
      "db" => %{"url" => ""}
    }
  end

  # Pattern lists arrive from the form as one semicolon-separated string.
  defp normalize_params(params) do
    Enum.reduce(["date_patterns", "datetime_patterns"], params, fn key, params ->
      case params[key] do
        value when is_binary(value) ->
          Map.put(
            params,
            key,
            value |> String.split(";") |> Enum.map(&String.trim/1) |> Enum.reject(&(&1 == ""))
          )

        _list_or_missing ->
          params
      end
    end)
  end

  defp deep_merge(base, override) when is_map(base) and is_map(override) do
    Map.merge(base, override, fn _key, a, b ->
      if is_map(a) and is_map(b), do: deep_merge(a, b), else: b
    end)
  end

  defp patterns_value(field) do
    case field.value do
      list when is_list(list) -> Enum.join(list, ";")
      value when is_binary(value) -> value
      _nil -> ""
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <div class="grid gap-6 lg:grid-cols-5">
        <div class="lg:col-span-3">
          <UI.card title="New import" role="setup-card">
            <.form
              for={@form}
              id="config-form"
              phx-change="validate"
              phx-submit="start"
              class="space-y-4"
            >
              <.input
                field={@form[:source_dir]}
                type="text"
                label="Source directory"
                placeholder="/path/to/csv/files"
                phx-debounce="300"
                data-role="source-dir-input"
              />

              <.inputs_for :let={db} field={@form[:db]}>
                <.input
                  field={db[:url]}
                  type="text"
                  label="Database URL"
                  placeholder="postgres://user:pass@localhost:5432/mydb or mysql://…"
                  phx-debounce="300"
                  data-role="db-url-input"
                />
              </.inputs_for>

              <div class="grid grid-cols-2 gap-3 sm:grid-cols-4">
                <.input
                  field={@form[:table_mode]}
                  type="select"
                  label="Existing tables"
                  options={[{"Drop + recreate", "drop"}, {"Append", "append"}]}
                />
                <.input
                  field={@form[:delimiter]}
                  type="select"
                  label="Delimiter"
                  options={[
                    {"Auto-detect", "auto"},
                    {"Comma", "comma"},
                    {"Semicolon", "semicolon"},
                    {"Tab", "tab"},
                    {"Pipe", "pipe"}
                  ]}
                />
                <.input
                  field={@form[:encoding]}
                  type="select"
                  label="Encoding"
                  options={[
                    {"Auto (BOM)", "auto"},
                    {"UTF-8", "utf8"},
                    {"UTF-16", "utf16"},
                    {"Latin-1", "latin1"}
                  ]}
                />
                <.input
                  field={@form[:ordered]}
                  type="select"
                  label="Row order column"
                  options={[{"Off", "false"}, {"On (csv_ordering_id)", "true"}]}
                />
              </div>

              <div class="border border-base-300 rounded-lg">
                <button
                  type="button"
                  phx-click="toggle-advanced"
                  class="flex w-full items-center justify-between px-4 py-2 text-sm font-medium"
                  data-role="advanced-toggle"
                >
                  Advanced settings
                  <.icon
                    name={(@advanced_open && "hero-chevron-up") || "hero-chevron-down"}
                    class="size-4"
                  />
                </button>
                <%!-- Hidden, never unmounted: the fields must stay in the form
                     so submits include them while the drawer is closed. --%>
                <div
                  class={[
                    "space-y-4 px-4 pb-4 [&_.label]:whitespace-normal",
                    !@advanced_open && "hidden"
                  ]}
                  data-role="advanced-settings"
                >
                  <div class="grid grid-cols-2 gap-3 sm:grid-cols-3">
                    <.input
                      field={@form[:file_workers]}
                      type="number"
                      label="File workers"
                      placeholder="auto (CPU cores)"
                    />
                    <.input
                      field={@form[:insert_workers]}
                      type="number"
                      label="Insert workers / file"
                    />
                    <.input field={@form[:varchar_limit]} type="number" label="Varchar limit" />
                    <.input
                      field={@form[:analyze_chunk_rows]}
                      type="number"
                      label="Analyze chunk rows"
                    />
                    <.input field={@form[:insert_chunk_rows]} type="number" label="Insert chunk rows" />
                    <.input
                      field={@form[:insert_chunk_bytes]}
                      type="number"
                      label="Insert chunk bytes"
                    />
                  </div>

                  <div class="grid gap-3 sm:grid-cols-2">
                    <label class="form-control">
                      <span class="label-text text-xs">Date patterns (separate with ;)</span>
                      <input
                        type="text"
                        name="config[date_patterns]"
                        value={patterns_value(@form[:date_patterns])}
                        class="input input-sm input-bordered font-mono"
                        data-role="date-patterns"
                      />
                      <p
                        :for={{message, _opts} <- @form[:date_patterns].errors}
                        class="text-error text-sm mt-1"
                      >
                        {message}
                      </p>
                    </label>
                    <label class="form-control">
                      <span class="label-text text-xs">Datetime patterns (separate with ;)</span>
                      <input
                        type="text"
                        name="config[datetime_patterns]"
                        value={patterns_value(@form[:datetime_patterns])}
                        class="input input-sm input-bordered font-mono"
                        data-role="datetime-patterns"
                      />
                      <p
                        :for={{message, _opts} <- @form[:datetime_patterns].errors}
                        class="text-error text-sm mt-1"
                      >
                        {message}
                      </p>
                    </label>
                  </div>

                  <.inputs_for :let={policy} field={@form[:error_policy]}>
                    <.input
                      field={policy[:strict]}
                      type="checkbox"
                      label="Strict (halt on first failure)"
                    />
                    <div class="grid grid-cols-2 gap-3 sm:grid-cols-4">
                      <.input
                        field={policy[:row_error_threshold_pct]}
                        type="number"
                        step="0.1"
                        label="Reject threshold %"
                      />
                      <.input
                        field={policy[:row_error_min_sample]}
                        type="number"
                        label="Min sample rows"
                      />
                      <.input field={policy[:max_retries]} type="number" label="Max retries" />
                      <.input field={policy[:backoff_ms]} type="number" label="Backoff ms" />
                    </div>
                  </.inputs_for>

                  <.inputs_for :let={validations} field={@form[:validations]}>
                    <div class="flex flex-wrap gap-6">
                      <.input
                        field={validations[:counts]}
                        type="checkbox"
                        label="Validate row counts"
                      />
                      <.input
                        field={validations[:fingerprints]}
                        type="checkbox"
                        label="Validate column fingerprints"
                      />
                    </div>
                  </.inputs_for>
                </div>
              </div>

              <div class="flex flex-wrap items-center gap-3 pt-2">
                <button
                  type="button"
                  class="btn btn-outline btn-sm"
                  phx-click="probe"
                  data-role="probe-button"
                >
                  Test connection
                </button>
                <button
                  type="button"
                  class="btn btn-ghost btn-sm"
                  phx-click="save_defaults"
                  data-role="save-defaults"
                >
                  Save as default
                </button>
                <span :if={@probe == :running} class="loading loading-dots loading-sm"></span>
                <span :if={@probe == :ok} data-role="probe-ok" class="badge badge-success">
                  Connection OK
                </span>
                <span
                  :if={match?({:error, _}, @probe)}
                  data-role="probe-error"
                  class="text-error text-sm"
                >
                  {elem(@probe, 1)}
                </span>

                <div class="grow"></div>

                <button
                  type="submit"
                  name="config[mode]"
                  value="analyze"
                  class="btn btn-ghost btn-sm"
                  data-role="analyze-button"
                >
                  Analyze (dry run)
                </button>
                <button
                  type="submit"
                  name="config[mode]"
                  value="import"
                  class="btn btn-primary btn-sm"
                  data-role="import-button"
                >
                  Import
                </button>
              </div>
            </.form>
          </UI.card>
        </div>

        <div class="lg:col-span-2">
          <UI.card title="Runs" role="runs-card">
            <UI.empty_state :if={@runs == []}>
              No runs yet — configure an import and hit start.
            </UI.empty_state>

            <ul :if={@runs != []} class="divide-y divide-base-200" data-role="runs-list">
              <li :for={run <- @runs} class="py-2">
                <.link
                  navigate={~p"/runs/#{run.id}"}
                  data-role="run-link"
                  class="flex items-center justify-between gap-2 hover:bg-base-200/60 rounded-lg px-2 py-1"
                >
                  <div class="min-w-0">
                    <div class="font-mono text-xs text-base-content/60">{run.id}</div>
                    <div class="truncate text-sm">{run.config.source_dir}</div>
                  </div>
                  <UI.status_badge status={run.status} role="run-list-status" />
                </.link>
              </li>
            </ul>
          </UI.card>
        </div>
      </div>
    </Layouts.app>
    """
  end
end

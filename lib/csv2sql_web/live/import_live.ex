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
  alias Csv2sql.Events
  alias Csv2sqlWeb.UI

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: Events.subscribe_runs()

    {:ok,
     socket
     |> assign(:page_title, "New import")
     |> assign(:form, config_form(default_params()))
     |> assign(:probe, nil)
     |> assign(:runs, Csv2sql.list_runs())}
  end

  @impl true
  def handle_event("validate", %{"config" => params}, socket) do
    {:noreply, assign(socket, form: config_form(params), probe: nil)}
  end

  def handle_event("start", %{"config" => params}, socket) do
    case Config.new(params) do
      {:ok, config} ->
        {:ok, run_id} = Csv2sql.start_run(config)
        {:noreply, push_navigate(socket, to: ~p"/runs/#{run_id}")}

      {:error, changeset} ->
        {:noreply, assign(socket, form: to_form(changeset, as: :config, action: :validate))}
    end
  end

  def handle_event("probe", %{"config" => params}, socket) do
    case Config.new(Map.put(params, "mode", "analyze") |> Map.put("source_dir", ".")) do
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

              <div class="flex flex-wrap items-center gap-3 pt-2">
                <button
                  type="button"
                  class="btn btn-outline btn-sm"
                  phx-click="probe"
                  data-role="probe-button"
                >
                  Test connection
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

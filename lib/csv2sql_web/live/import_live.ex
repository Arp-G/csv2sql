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
  alias Csv2sql.Source.Discovery
  alias Csv2sql.TimeParse
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
     |> assign(:pattern_trial, nil)
     |> assign(:pattern_match, nil)
     |> assign(:csv_count, csv_count(params["source_dir"]))
     |> assign(:runs, Csv2sql.list_runs())}
  end

  @impl true
  def handle_event("validate", %{"config" => params} = payload, socket) do
    {:noreply,
     socket
     |> assign(form: config_form(params), pending_params: params, probe: nil)
     |> assign(:csv_count, csv_count(params["source_dir"]))
     |> assign_trial(payload["pattern_trial"])}
  end

  def handle_event("add_pattern", %{"kind" => kind}, socket)
      when kind in ["date_patterns", "datetime_patterns"] do
    update_patterns(socket, kind, &(&1 ++ [""]))
  end

  def handle_event("remove_pattern", %{"kind" => kind, "index" => index}, socket)
      when kind in ["date_patterns", "datetime_patterns"] do
    update_patterns(socket, kind, &List.delete_at(&1, String.to_integer(index)))
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
    case Store.save(normalize_params(socket.assigns.pending_params)) do
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
    |> Config.changeset(normalize_params(params))
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

  # Pattern editor rows live raw in pending_params (blank rows included,
  # so a just-added row survives re-renders); anything feeding a
  # changeset or the store goes through here to drop blanks. Legacy
  # semicolon-joined strings (old persisted defaults) still split.
  defp normalize_params(params) do
    Enum.reduce(["date_patterns", "datetime_patterns"], params, fn key, params ->
      case params[key] do
        nil ->
          params

        value ->
          cleaned =
            value |> pattern_rows() |> Enum.map(&String.trim/1) |> Enum.reject(&(&1 == ""))

          Map.put(params, key, cleaned)
      end
    end)
  end

  defp pattern_rows(value) when is_binary(value), do: String.split(value, ";")
  defp pattern_rows(value) when is_list(value), do: value
  defp pattern_rows(_other), do: []

  # The rendered rows for one pattern kind: raw pending rows, the
  # Config defaults when untouched, and always at least one row (so the
  # form always submits the key — an emptied list must not resurrect
  # the defaults on the next change).
  defp patterns_of(params, key) do
    case params[key] do
      nil -> default_patterns(key)
      value -> with [] <- pattern_rows(value), do: [""]
    end
  end

  defp default_patterns("date_patterns"), do: %Config{}.date_patterns
  defp default_patterns("datetime_patterns"), do: %Config{}.datetime_patterns

  defp pattern_sections(params) do
    [
      {"date_patterns", :date_patterns, "Date patterns", patterns_of(params, "date_patterns")},
      {"datetime_patterns", :datetime_patterns, "Datetime patterns",
       patterns_of(params, "datetime_patterns")}
    ]
  end

  defp update_patterns(socket, kind, transform) do
    params = socket.assigns.pending_params
    params = Map.put(params, kind, transform.(patterns_of(params, kind)))

    {:noreply,
     socket
     |> assign(pending_params: params, form: config_form(params))
     |> assign_trial(socket.assigns.pattern_trial)}
  end

  defp assign_trial(socket, trial) do
    trial = String.trim(trial || "")

    match =
      if trial == "" do
        nil
      else
        params = socket.assigns.pending_params

        find_pattern_match("date_patterns", trial, params) ||
          find_pattern_match("datetime_patterns", trial, params) || :none
      end

    assign(socket, pattern_trial: trial, pattern_match: match)
  end

  defp find_pattern_match(kind, trial, params) do
    params
    |> patterns_of(kind)
    |> Enum.with_index()
    |> Enum.find_value(fn {pattern, index} ->
      with {:ok, compiled} <- TimeParse.compile_all([String.trim(pattern)]),
           result when result != :error <- parse_trial(kind, trial, compiled) do
        {kind, index, result}
      else
        _no_match -> nil
      end
    end)
  end

  defp parse_trial("date_patterns", trial, compiled), do: TimeParse.date(trial, compiled)
  defp parse_trial("datetime_patterns", trial, compiled), do: TimeParse.datetime(trial, compiled)

  defp pattern_matched?({kind, index, _result}, kind, index), do: true
  defp pattern_matched?(_match, _kind, _index), do: false

  defp trial_result(:none), do: "no pattern matches"

  defp trial_result({kind, index, result}) do
    label = if kind == "date_patterns", do: "date pattern", else: "datetime pattern"

    case result do
      {:ok, parsed} -> "matches #{label} ##{index + 1} → #{parsed}"
      :zero -> "matches #{label} ##{index + 1} → zero date (imported as NULL)"
    end
  end

  defp csv_count(dir) when is_binary(dir) and dir != "" do
    if File.dir?(dir) do
      length(Discovery.discover(dir))
    end
  rescue
    _unreadable -> nil
  end

  defp csv_count(_blank), do: nil

  defp deep_merge(base, override) when is_map(base) and is_map(override) do
    Map.merge(base, override, fn _key, a, b ->
      if is_map(a) and is_map(b), do: deep_merge(a, b), else: b
    end)
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
              <p :if={@csv_count} class="-mt-3 text-xs text-base-content/60" data-role="csv-count">
                {@csv_count} CSV {if @csv_count == 1, do: "file", else: "files"} found
              </p>
              <p
                :if={@csv_count == 0}
                class="-mt-3 text-xs text-warning"
                data-role="csv-count"
              >
                No CSV files in this directory
              </p>

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

                  <div class="space-y-3" data-role="pattern-editor">
                    <div class="grid gap-4 sm:grid-cols-2">
                      <div
                        :for={{kind, field, label, rows} <- pattern_sections(@pending_params)}
                        class="space-y-2"
                      >
                        <span class="label text-xs">{label}</span>
                        <div
                          :for={{pattern, index} <- Enum.with_index(rows)}
                          class="flex items-center gap-1"
                        >
                          <input
                            type="text"
                            name={"config[#{kind}][]"}
                            value={pattern}
                            placeholder="{YYYY}-{0M}-{0D}"
                            class={[
                              "input input-sm input-bordered font-mono w-full",
                              pattern_matched?(@pattern_match, kind, index) && "input-success"
                            ]}
                            data-role={"#{kind}-input"}
                          />
                          <button
                            :if={length(rows) > 1}
                            type="button"
                            phx-click="remove_pattern"
                            phx-value-kind={kind}
                            phx-value-index={index}
                            class="btn btn-ghost btn-xs px-1"
                            aria-label={"remove #{label} #{index + 1}"}
                            data-role={"remove-#{kind}"}
                          >
                            <.icon name="hero-x-mark" class="size-3.5" />
                          </button>
                        </div>
                        <button
                          type="button"
                          phx-click="add_pattern"
                          phx-value-kind={kind}
                          class="btn btn-ghost btn-xs"
                          data-role={"add-#{kind}"}
                        >
                          <.icon name="hero-plus" class="size-3.5" /> Add pattern
                        </button>
                        <p :for={{message, _opts} <- @form[field].errors} class="text-error text-sm">
                          {message}
                        </p>
                      </div>
                    </div>

                    <p class="text-xs text-base-content/60">
                      Tokens:
                      <span class="font-mono">
                        {"{YYYY} {YY} year · {0M} {M} month · {0D} {D} day · {0h24} {h24} {0h12} {h12} hour · {0m} {m} min · {0s} {s} sec · {AM} {am} meridiem (0-prefix = zero-padded)"}
                      </span>
                    </p>

                    <label class="form-control">
                      <span class="label-text text-xs">Try a sample date or datetime</span>
                      <input
                        type="text"
                        name="pattern_trial"
                        value={@pattern_trial}
                        placeholder="31/12/2023 or 2023-12-31 18:05:00"
                        class="input input-sm input-bordered font-mono"
                        phx-debounce="200"
                        data-role="pattern-trial"
                      />
                    </label>
                    <p
                      :if={@pattern_match}
                      class={[
                        "text-sm",
                        (@pattern_match == :none && "text-warning") || "text-success"
                      ]}
                      data-role="pattern-trial-result"
                    >
                      {trial_result(@pattern_match)}
                    </p>
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

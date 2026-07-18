defmodule Csv2sqlWeb.RunLive do
  @moduledoc """
  Live monitor for one run.

  The run executes independently of this process: mount **subscribes
  first, then snapshots** `Run.Server` state, so attaching mid-run (or
  navigating away and back) never loses events. Per-file updates arrive
  as throttled `FileUpdated` events feeding a LiveView stream (bounded
  DOM); retries/rejections feed a ring-buffer activity feed.
  """

  use Csv2sqlWeb, :live_view

  alias Csv2sql.Events
  alias Csv2sql.Run
  alias Csv2sqlWeb.UI

  @activity_limit 100
  @files_limit 200

  @impl true
  def mount(%{"id" => run_id}, _session, socket) do
    if connected?(socket), do: Events.subscribe(run_id)

    case Csv2sql.run_state(run_id) do
      {:ok, run} ->
        {:ok,
         socket
         |> assign(:page_title, "Run #{run_id}")
         |> assign(:run_id, run_id)
         |> assign(:filters, %{"q" => "", "status" => "all", "sort" => "name"})
         |> assign(:activity, [])
         |> assign(:activity_open, false)
         |> assign(:expanded, nil)
         |> assign(:override_params, %{})
         |> apply_snapshot(run)}

      {:error, :not_found} ->
        {:ok,
         socket
         |> put_flash(
           :error,
           "Run #{run_id} is no longer in memory — its report remains in csv2sql_runs/#{run_id}/"
         )
         |> push_navigate(to: ~p"/")}
    end
  end

  # -- Events ------------------------------------------------------------------

  @impl true
  def handle_info(%Events.FileUpdated{file: file}, socket) do
    socket =
      socket
      |> update(:file_index, &Map.put(&1, file.path, index_entry(file)))
      |> then(&assign(&1, :counters, counters(&1.assigns.file_index)))
      |> then(
        &assign(&1, :matching_count, count_matching(&1.assigns.file_index, &1.assigns.filters))
      )
      |> maybe_refresh_expanded(file)

    {:noreply, update_file_row(socket, file)}
  end

  def handle_info(%Events.PreflightCheck{check: check}, socket) do
    checks = Enum.reject(socket.assigns.preflight, &(&1.id == check.id)) ++ [check]
    {:noreply, assign(socket, :preflight, checks)}
  end

  def handle_info(%Events.ChunkRetried{} = event, socket) do
    {:noreply,
     push_activity(socket, :retry, "retrying #{Path.basename(event.path)}: #{event.reason}")}
  end

  def handle_info(%Events.RowsRejected{} = event, socket) do
    message =
      "#{event.count} row(s) rejected in #{Path.basename(event.path)}" <>
        case event.sample_reasons do
          [] -> ""
          [reason | _rest] -> " — #{reason}"
        end

    {:noreply, push_activity(socket, :rejected, message)}
  end

  def handle_info(%Events.FileFailed{} = event, socket) do
    {:noreply,
     push_activity(socket, :failed, "#{Path.basename(event.path)} failed: #{event.error.message}")}
  end

  def handle_info(%module{}, socket)
      when module in [Events.RunCompleted, Events.RunFailed, Events.RunCancelled] do
    case Csv2sql.run_state(socket.assigns.run_id) do
      {:ok, run} -> {:noreply, apply_snapshot(socket, run)}
      {:error, :not_found} -> {:noreply, socket}
    end
  end

  def handle_info(_event, socket), do: {:noreply, socket}

  defp maybe_refresh_expanded(
         %{assigns: %{expanded: %{path: path}}} = socket,
         %{path: path} = file
       ),
       do: assign(socket, :expanded, file)

  defp maybe_refresh_expanded(socket, _file), do: socket

  # -- User actions ------------------------------------------------------------

  @impl true
  def handle_event("cancel", _params, socket) do
    Csv2sql.cancel_run(socket.assigns.run_id)
    {:noreply, socket}
  end

  def handle_event("filter", params, socket) do
    filters = Map.take(params, ["q", "status", "sort"])
    filters = Map.merge(socket.assigns.filters, filters)
    socket = assign(socket, :filters, filters)

    case Csv2sql.run_state(socket.assigns.run_id) do
      {:ok, run} ->
        files = run |> Run.files_in_order() |> filter_and_sort(filters)
        {:noreply, stream_window(socket, files)}

      {:error, :not_found} ->
        {:noreply, socket}
    end
  end

  def handle_event("toggle-activity", _params, socket) do
    {:noreply, update(socket, :activity_open, &(!&1))}
  end

  def handle_event("expand", %{"path" => path}, socket) do
    case Csv2sql.run_state(socket.assigns.run_id) do
      {:ok, run} -> {:noreply, assign(socket, :expanded, run.files[path])}
      {:error, :not_found} -> {:noreply, socket}
    end
  end

  def handle_event("collapse", _params, socket) do
    {:noreply, assign(socket, :expanded, nil)}
  end

  def handle_event("edit_override", %{"override" => params}, socket) do
    file = socket.assigns.expanded

    {:noreply, update(socket, :override_params, &Map.put(&1, file.name, params))}
  end

  def handle_event("reimport", _params, socket) do
    params =
      socket.assigns.config
      |> Csv2sql.Config.to_params()
      |> Map.put("mode", "import")
      |> Map.put("overrides", override_list(socket.assigns.override_params))

    case Csv2sql.Config.new(params) do
      {:ok, config} ->
        {:ok, run_id} = Csv2sql.start_run(config)
        {:noreply, push_navigate(socket, to: ~p"/runs/#{run_id}")}

      {:error, changeset} ->
        {:noreply,
         put_flash(socket, :error, "override configuration invalid: #{inspect(changeset.errors)}")}
    end
  end

  # -- State building ----------------------------------------------------------

  defp apply_snapshot(socket, run) do
    files = Run.files_in_order(run)
    file_index = Map.new(files, &{&1.path, index_entry(&1)})
    filters = socket.assigns[:filters] || %{"q" => "", "status" => "all", "sort" => "name"}

    socket
    |> assign(:config, run.config)
    |> assign(:status, run.status)
    |> assign(:mode, run.config.mode)
    |> assign(:adapter, run.config.db && run.config.db.adapter)
    |> assign(:source_dir, run.config.source_dir)
    |> assign(:started_at, run.started_at)
    |> assign(:summary, run.summary)
    |> assign(:error, run.error)
    |> assign(:preflight, run.preflight)
    |> assign(:file_index, file_index)
    |> assign(:counters, counters(file_index))
    |> stream_window(filter_and_sort(files, filters))
  end

  # The DOM never holds more than @files_limit rows. The window is
  # snapshot-stable: visible rows update in place, rows that stop
  # matching free a slot, new matches fill spare capacity only; a full
  # re-window happens on every filter change and run snapshot.
  defp stream_window(socket, files) do
    visible = Enum.take(files, @files_limit)

    socket
    |> assign(:matching_count, length(files))
    |> assign(:visible_paths, MapSet.new(visible, & &1.path))
    |> stream(:files, visible, reset: true, dom_id: &file_dom_id/1)
  end

  defp update_file_row(socket, file) do
    %{visible_paths: visible, filters: filters} = socket.assigns

    cond do
      not matches_filters?(file, filters) ->
        socket
        |> stream_delete(:files, file)
        |> assign(:visible_paths, MapSet.delete(visible, file.path))

      MapSet.member?(visible, file.path) ->
        stream_insert(socket, :files, file)

      MapSet.size(visible) < @files_limit ->
        socket
        |> stream_insert(:files, file)
        |> assign(:visible_paths, MapSet.put(visible, file.path))

      true ->
        socket
    end
  end

  defp count_matching(file_index, filters) do
    Enum.count(file_index, fn {path, entry} ->
      matches_filters?(
        %{
          name: Path.basename(path),
          status: entry.status,
          ledger: %{rows_rejected: entry.rejected}
        },
        filters
      )
    end)
  end

  defp index_entry(file) do
    ledger = file.ledger || %{rows_inserted: 0, rows_rejected: 0, retries: 0, chunks_isolated: 0}

    %{
      status: file.status,
      inserted: ledger.rows_inserted,
      rejected: ledger.rows_rejected,
      retries: ledger.retries,
      isolated: ledger.chunks_isolated
    }
  end

  defp counters(file_index) do
    Enum.reduce(
      file_index,
      %{
        total: map_size(file_index),
        done: 0,
        failed: 0,
        inserted: 0,
        rejected: 0,
        retries: 0,
        isolated: 0
      },
      fn {_path, entry}, acc ->
        %{
          acc
          | done: acc.done + if(entry.status == :done, do: 1, else: 0),
            failed: acc.failed + if(entry.status == :failed, do: 1, else: 0),
            inserted: acc.inserted + entry.inserted,
            rejected: acc.rejected + entry.rejected,
            retries: acc.retries + entry.retries,
            isolated: acc.isolated + entry.isolated
        }
      end
    )
  end

  defp push_activity(socket, kind, message) do
    entry = %{kind: kind, message: message, at: DateTime.utc_now()}
    update(socket, :activity, &Enum.take([entry | &1], @activity_limit))
  end

  # -- Filtering ---------------------------------------------------------------

  defp filter_and_sort(files, filters) do
    files
    |> Enum.filter(&matches_filters?(&1, filters))
    |> sort_files(filters["sort"])
  end

  defp matches_filters?(file, filters) do
    query = String.downcase(filters["q"] || "")

    (query == "" or String.contains?(String.downcase(file.name), query)) and
      status_matches?(file, filters["status"] || "all")
  end

  defp status_matches?(_file, "all"), do: true
  defp status_matches?(file, "done"), do: file.status == :done
  defp status_matches?(file, "failed"), do: file.status == :failed

  defp status_matches?(file, "active"),
    do: file.status not in [:done, :failed, :skipped]

  defp status_matches?(file, "rejected"),
    do: file.ledger != nil and file.ledger.rows_rejected > 0

  defp status_matches?(_file, _other), do: true

  defp sort_files(files, "size"), do: Enum.sort_by(files, & &1.size, :desc)
  defp sort_files(files, "progress"), do: Enum.sort_by(files, &progress_percent/1, :desc)

  defp sort_files(files, "rejected"),
    do: Enum.sort_by(files, &((&1.ledger && &1.ledger.rows_rejected) || 0), :desc)

  defp sort_files(files, "status"), do: Enum.sort_by(files, & &1.status)
  defp sort_files(files, _name), do: Enum.sort_by(files, & &1.name)

  defp file_dom_id(file), do: "file-#{:erlang.phash2(file.path)}"

  defp files_limit, do: @files_limit

  defp progress_percent(%{status: :done}), do: 100

  defp progress_percent(%{row_count: rows} = file) when rows > 0 do
    ledger = file.ledger || %{rows_inserted: 0, rows_rejected: 0}
    min(round((ledger.rows_inserted + ledger.rows_rejected) * 100 / rows), 100)
  end

  defp progress_percent(_file), do: 0

  defp terminal?(status), do: status in [:completed, :completed_with_errors, :failed, :cancelled]

  # -- Validation detail -------------------------------------------------------

  defp validation_summary(%{layer: :counts, detail: %{"expected" => e, "actual" => a}}),
    do: "#{a} row(s) in the table, #{e} expected"

  defp validation_summary(%{layer: :fingerprints, detail: %{"error" => message}}),
    do: "could not verify: #{message}"

  defp validation_summary(%{layer: :fingerprints, detail: %{"columns" => columns}}) do
    case Enum.count(columns, &(!&1["ok"])) do
      0 -> "#{length(columns)} column(s) match"
      some -> "#{some} of #{length(columns)} column(s) mismatched"
    end
  end

  defp validation_summary(%{layer: :ledger, status: :passed}), do: "row ledger balanced"
  defp validation_summary(%{status: :skipped}), do: "skipped"
  defp validation_summary(_outcome), do: nil

  defp mismatched_checks(%{layer: :fingerprints, detail: %{"columns" => columns}}) do
    for %{"column" => column, "checks" => checks} <- columns,
        {check, %{"ok" => false, "expected" => sent, "actual" => db}} <- Enum.sort(checks) do
      {column, check, sent, db}
    end
  end

  defp mismatched_checks(_outcome), do: []

  defp format_check_value(nil), do: "∅"
  defp format_check_value(value), do: to_string(value)

  # -- Schema editor -----------------------------------------------------------

  @type_options [
    {"varchar", "varchar"},
    {"text", "text"},
    {"longtext", "longtext"},
    {"integer", "integer"},
    {"bigint", "bigint"},
    {"float", "float"},
    {"boolean", "boolean"},
    {"date", "date"},
    {"datetime", "datetime"}
  ]

  defp type_options, do: @type_options

  # One editor row per SOURCE column: saved edits win, else the inferred
  # spec, else raw header defaults (covers columns excluded by an earlier
  # override, which have no spec).
  defp editor_rows(file, override_params) do
    saved = Map.get(override_params, file.name, %{})

    file.source_headers
    |> Enum.with_index()
    |> Enum.map(fn {header, position} ->
      spec = Enum.find(file.columns, &(&1.source_position == position))
      saved_column = get_in(saved, ["columns", Integer.to_string(position)]) || %{}
      editor_row(header, position, spec, saved_column)
    end)
  end

  defp editor_row(header, position, spec, saved_column) do
    %{
      position: position,
      header: header,
      name: first_present([saved_column["name"], spec && spec.name, header]),
      type: first_present([saved_column["type"], spec && Atom.to_string(spec.type), "varchar"]),
      length: first_present([saved_column["length"], spec && spec.length, ""]),
      include: Map.get(saved_column, "include", if(spec, do: "true", else: "false")),
      inferred: spec
    }
  end

  defp first_present(candidates), do: Enum.find(candidates, &(&1 not in [nil, false]))

  defp saved_file_setting(override_params, file, key, default) do
    override_params |> Map.get(file.name, %{}) |> Map.get(key, default)
  end

  defp override_list(override_params) do
    Enum.map(override_params, fn {file_name, params} ->
      columns =
        params
        |> Map.get("columns", %{})
        |> Enum.map(fn {position, column} -> Map.put(column, "position", position) end)

      %{
        "file" => file_name,
        "include" => Map.get(params, "include", "true"),
        "table_name" => Map.get(params, "table_name", ""),
        "columns" => columns
      }
    end)
  end

  defp format_bytes(bytes) when bytes >= 1_073_741_824,
    do: "#{Float.round(bytes / 1_073_741_824, 1)} GB"

  defp format_bytes(bytes) when bytes >= 1_048_576, do: "#{Float.round(bytes / 1_048_576, 1)} MB"
  defp format_bytes(bytes) when bytes >= 1024, do: "#{Float.round(bytes / 1024, 1)} KB"
  defp format_bytes(bytes), do: "#{bytes} B"

  # -- Render ------------------------------------------------------------------

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <UI.card role="run-header">
        <div class="flex flex-wrap items-center gap-3">
          <UI.status_badge status={@status} role="run-status" />
          <span class="badge badge-outline badge-sm">{@mode}</span>
          <span :if={@adapter} class="badge badge-outline badge-sm">{@adapter}</span>
          <span class="font-mono text-xs text-base-content/60">{@run_id}</span>
          <span class="truncate text-sm text-base-content/70">{@source_dir}</span>
          <div class="grow"></div>
          <a
            :if={terminal?(@status)}
            href={~p"/runs/#{@run_id}/artifacts/report"}
            class="btn btn-outline btn-xs"
            data-role="report-link"
          >
            run_report.json
          </a>
          <a
            :if={terminal?(@status) and @mode in [:import, :analyze]}
            href={~p"/runs/#{@run_id}/artifacts/schema"}
            class="btn btn-outline btn-xs"
            data-role="schema-link"
          >
            schema.sql
          </a>
          <button
            :if={not terminal?(@status)}
            class="btn btn-error btn-xs"
            phx-click="cancel"
            data-role="cancel"
            data-confirm="Cancel this run?"
          >
            Cancel
          </button>
        </div>

        <div :if={@preflight != []} class="flex flex-wrap gap-2" data-role="preflight">
          <span
            :for={check <- @preflight}
            class={[
              "badge badge-xs",
              check.status == :passed && "badge-success",
              check.status == :failed && "badge-error",
              check.status == :warning && "badge-warning",
              check.status == :skipped && "badge-ghost"
            ]}
            title={check.detail}
            data-role="preflight-check"
            data-check={check.id}
            data-status={check.status}
          >
            {check.id}
          </span>
        </div>

        <div :if={@error} role="alert" class="alert alert-error text-sm" data-role="run-error">
          <span>{@error.message}</span>
        </div>

        <div class="flex flex-wrap items-end gap-6">
          <UI.stat label="files" value={"#{@counters.done}/#{@counters.total}"} />
          <UI.stat label="inserted" value={@counters.inserted} tone={:ok} />
          <UI.stat
            label="rejected"
            value={@counters.rejected}
            tone={if @counters.rejected > 0, do: :warn, else: :neutral}
          />
          <UI.stat
            label="failed files"
            value={@counters.failed}
            tone={if @counters.failed > 0, do: :error, else: :neutral}
          />
          <div class="grow"></div>
          <div class="flex flex-wrap gap-2" data-role="activity-chips">
            <UI.activity_chip label="retries" count={@counters.retries} tone={:warn} />
            <UI.activity_chip label="isolated chunks" count={@counters.isolated} tone={:warn} />
            <UI.activity_chip label="rejected rows" count={@counters.rejected} tone={:error} />
          </div>
        </div>

        <div :if={@summary} class="grid grid-cols-2 gap-4 sm:grid-cols-4" data-role="summary">
          <UI.stat label="rows read" value={@summary.rows_read} />
          <UI.stat label="rows inserted" value={@summary.rows_inserted} tone={:ok} />
          <UI.stat label="rows rejected" value={@summary.rows_rejected} />
          <UI.stat label="duration" value={"#{@summary.duration_ms} ms"} />
        </div>
      </UI.card>

      <UI.card :if={@activity != []} role="activity-card">
        <button
          type="button"
          phx-click="toggle-activity"
          class="flex w-full items-center justify-between text-sm"
          data-role="activity-toggle"
        >
          <span class="font-medium">Activity ({length(@activity)})</span>
          <span class="text-base-content/50">{if @activity_open, do: "hide", else: "show"}</span>
        </button>
        <ul
          :if={@activity_open}
          class="max-h-64 space-y-1 overflow-y-auto text-sm"
          data-role="activity-feed"
        >
          <li :for={entry <- @activity} class="flex items-start gap-2">
            <span class={[
              "badge badge-xs mt-0.5",
              entry.kind == :retry && "badge-warning",
              entry.kind == :rejected && "badge-error",
              entry.kind == :failed && "badge-error"
            ]}>
              {entry.kind}
            </span>
            <span class="text-base-content/80">{entry.message}</span>
          </li>
        </ul>
      </UI.card>

      <UI.card :if={@expanded} title={"Inspect · #{@expanded.name}"} role="editor-card">
        <:actions>
          <button
            type="button"
            class="btn btn-ghost btn-xs"
            phx-click="collapse"
            data-role="collapse-editor"
          >
            close
          </button>
        </:actions>

        <div :if={@expanded.sample_rows != []} class="space-y-1">
          <h3 class="text-xs font-semibold uppercase text-base-content/50">
            Sample ({length(@expanded.sample_rows)} rows)
          </h3>
          <div class="overflow-x-auto rounded-lg border border-base-300">
            <table class="table table-xs" data-role="sample-table">
              <thead>
                <tr>
                  <th :for={header <- @expanded.source_headers} class="whitespace-nowrap">
                    {header}
                  </th>
                </tr>
              </thead>
              <tbody>
                <tr :for={row <- @expanded.sample_rows}>
                  <td :for={cell <- row} class="max-w-40 truncate" title={cell}>{cell}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <div :if={@expanded.validation != []} class="space-y-2" data-role="validation-detail">
          <h3 class="text-xs font-semibold uppercase text-base-content/50">Validation</h3>
          <div :for={outcome <- @expanded.validation} class="space-y-1">
            <div class="flex items-center gap-2 text-sm">
              <UI.validation_pill layer={outcome.layer} status={outcome.status} />
              <span class="text-base-content/70">{validation_summary(outcome)}</span>
            </div>
            <div
              :if={mismatched_checks(outcome) != []}
              class="overflow-x-auto rounded-lg border border-base-300"
            >
              <table class="table table-xs" data-role="fingerprint-mismatches">
                <thead>
                  <tr class="text-xs uppercase text-base-content/50">
                    <th>Column</th>
                    <th>Check</th>
                    <th>Sent to DB</th>
                    <th>In database</th>
                  </tr>
                </thead>
                <tbody>
                  <tr :for={{column, check, sent, db} <- mismatched_checks(outcome)}>
                    <td class="font-mono">{column}</td>
                    <td>{check}</td>
                    <td class="font-mono">{format_check_value(sent)}</td>
                    <td class="font-mono">{format_check_value(db)}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <form id="override-form" phx-change="edit_override" class="space-y-3">
          <div class="flex flex-wrap items-end gap-4">
            <label class="flex items-center gap-2 text-sm">
              <input type="hidden" name="override[include]" value="false" />
              <input
                type="checkbox"
                name="override[include]"
                value="true"
                checked={saved_file_setting(@override_params, @expanded, "include", "true") == "true"}
                class="checkbox checkbox-sm"
                data-role="file-include"
              /> include this file
            </label>
            <label class="form-control">
              <span class="label-text text-xs">Target table</span>
              <input
                type="text"
                name="override[table_name]"
                value={
                  saved_file_setting(@override_params, @expanded, "table_name", @expanded.table_name)
                }
                class="input input-sm input-bordered w-56"
                data-role="table-name-input"
              />
            </label>
          </div>

          <div class="overflow-x-auto">
            <table class="table table-xs" data-role="column-editor">
              <thead>
                <tr class="text-xs uppercase text-base-content/50">
                  <th>Include</th>
                  <th>Source column</th>
                  <th>Name in table</th>
                  <th>Type</th>
                  <th>Varchar length</th>
                  <th>Inferred</th>
                </tr>
              </thead>
              <tbody>
                <tr :for={row <- editor_rows(@expanded, @override_params)} data-role="column-row">
                  <td>
                    <input
                      type="hidden"
                      name={"override[columns][#{row.position}][include]"}
                      value="false"
                    />
                    <input
                      type="checkbox"
                      name={"override[columns][#{row.position}][include]"}
                      value="true"
                      checked={row.include == "true"}
                      class="checkbox checkbox-xs"
                      data-role="column-include"
                    />
                  </td>
                  <td class="font-mono text-xs">{row.header}</td>
                  <td>
                    <input
                      type="text"
                      name={"override[columns][#{row.position}][name]"}
                      value={row.name}
                      class="input input-xs input-bordered w-36"
                      data-role="column-name"
                    />
                  </td>
                  <td>
                    <select
                      name={"override[columns][#{row.position}][type]"}
                      class="select select-xs select-bordered"
                      data-role="column-type"
                    >
                      <option
                        :for={{label, value} <- type_options()}
                        value={value}
                        selected={row.type == value}
                      >
                        {label}
                      </option>
                    </select>
                  </td>
                  <td>
                    <input
                      type="number"
                      name={"override[columns][#{row.position}][length]"}
                      value={row.length}
                      disabled={row.type != "varchar"}
                      class="input input-xs input-bordered w-20"
                      data-role="column-length"
                    />
                  </td>
                  <td class="text-xs text-base-content/60">
                    <span :if={row.inferred}>
                      {row.inferred.type}{if row.inferred.length, do: "(#{row.inferred.length})"} · max {row.inferred.max_length}
                    </span>
                    <span :if={!row.inferred}>excluded in this run</span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </form>

        <div class="flex items-center justify-end gap-3">
          <span class="text-xs text-base-content/50">
            Edits apply to a new import of this directory.
          </span>
          <button
            type="button"
            class="btn btn-primary btn-sm"
            phx-click="reimport"
            disabled={not terminal?(@status)}
            data-role="reimport"
          >
            Start import with these settings
          </button>
        </div>
      </UI.card>

      <UI.card title="Files" role="files-card">
        <:actions>
          <form id="file-filters" phx-change="filter" class="flex items-center gap-2">
            <input
              type="text"
              name="q"
              value={@filters["q"]}
              placeholder="Search files…"
              phx-debounce="200"
              class="input input-sm input-bordered w-40"
              data-role="file-search"
            />
            <select name="status" class="select select-sm select-bordered" data-role="status-filter">
              <option value="all" selected={@filters["status"] == "all"}>All</option>
              <option value="active" selected={@filters["status"] == "active"}>Active</option>
              <option value="done" selected={@filters["status"] == "done"}>Done</option>
              <option value="failed" selected={@filters["status"] == "failed"}>Failed</option>
              <option value="rejected" selected={@filters["status"] == "rejected"}>
                With rejects
              </option>
            </select>
            <select name="sort" class="select select-sm select-bordered" data-role="sort-select">
              <option value="name" selected={@filters["sort"] == "name"}>Name</option>
              <option value="size" selected={@filters["sort"] == "size"}>Size</option>
              <option value="progress" selected={@filters["sort"] == "progress"}>Progress</option>
              <option value="rejected" selected={@filters["sort"] == "rejected"}>Rejected</option>
              <option value="status" selected={@filters["sort"] == "status"}>Status</option>
            </select>
          </form>
        </:actions>

        <div class="overflow-x-auto">
          <table class="table table-sm">
            <thead>
              <tr class="text-xs uppercase text-base-content/50">
                <th>File</th>
                <th>Size</th>
                <th>Status</th>
                <th class="w-40">Progress</th>
                <th class="text-right">Inserted</th>
                <th class="text-right">Rejected</th>
                <th>Validation</th>
              </tr>
            </thead>
            <tbody id="files" phx-update="stream" data-role="file-rows">
              <tr :for={{dom_id, file} <- @streams.files} id={dom_id} data-role="file-row">
                <td class="max-w-60">
                  <button
                    type="button"
                    phx-click="expand"
                    phx-value-path={file.path}
                    data-role="expand-file"
                    class="truncate font-medium link link-hover text-left"
                    title={"#{file.path} — click to inspect/edit"}
                  >
                    {file.name}
                  </button>
                  <div
                    :if={file.errors_csv}
                    class="truncate text-xs text-warning"
                    title={file.errors_csv}
                  >
                    {Path.basename(file.errors_csv)}
                  </div>
                </td>
                <td class="whitespace-nowrap text-xs">{format_bytes(file.size)}</td>
                <td><UI.status_badge status={file.status} role="file-status" /></td>
                <td><UI.progress_bar percent={progress_percent(file)} /></td>
                <td class="text-right tabular-nums">
                  {(file.ledger && file.ledger.rows_inserted) || 0}
                </td>
                <td class="text-right tabular-nums">
                  {(file.ledger && file.ledger.rows_rejected) || 0}
                </td>
                <td>
                  <div class="flex gap-1">
                    <UI.validation_pill
                      :for={outcome <- file.validation}
                      layer={outcome.layer}
                      status={outcome.status}
                    />
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
          <div
            :if={@matching_count > files_limit()}
            class="mt-2 text-center text-xs text-base-content/60"
            data-role="files-window-notice"
          >
            Showing {files_limit()} of {@matching_count} matching files — refine the search or
            filters to narrow down.
          </div>
          <UI.empty_state :if={@counters.total == 0}>
            No files discovered yet.
          </UI.empty_state>
        </div>
      </UI.card>
    </Layouts.app>
    """
  end
end

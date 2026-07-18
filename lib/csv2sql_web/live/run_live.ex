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

    socket =
      if matches_filters?(file, socket.assigns.filters) do
        stream_insert(socket, :files, file)
      else
        stream_delete(socket, :files, file)
      end

    {:noreply, socket}
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
        {:noreply, stream(socket, :files, files, reset: true, dom_id: &file_dom_id/1)}

      {:error, :not_found} ->
        {:noreply, socket}
    end
  end

  def handle_event("toggle-activity", _params, socket) do
    {:noreply, update(socket, :activity_open, &(!&1))}
  end

  # -- State building ----------------------------------------------------------

  defp apply_snapshot(socket, run) do
    files = Run.files_in_order(run)
    file_index = Map.new(files, &{&1.path, index_entry(&1)})
    filters = socket.assigns[:filters] || %{"q" => "", "status" => "all", "sort" => "name"}

    socket
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
    |> stream(:files, filter_and_sort(files, filters), reset: true, dom_id: &file_dom_id/1)
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

  defp progress_percent(%{status: :done}), do: 100

  defp progress_percent(%{row_count: rows} = file) when rows > 0 do
    ledger = file.ledger || %{rows_inserted: 0, rows_rejected: 0}
    min(round((ledger.rows_inserted + ledger.rows_rejected) * 100 / rows), 100)
  end

  defp progress_percent(_file), do: 0

  defp terminal?(status), do: status in [:completed, :completed_with_errors, :failed, :cancelled]

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

      <UI.card title="Files" role="files-card">
        <:actions>
          <form phx-change="filter" class="flex items-center gap-2">
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
                  <div class="truncate font-medium" title={file.path}>{file.name}</div>
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
          <UI.empty_state :if={@counters.total == 0}>
            No files discovered yet.
          </UI.empty_state>
        </div>
      </UI.card>
    </Layouts.app>
    """
  end
end

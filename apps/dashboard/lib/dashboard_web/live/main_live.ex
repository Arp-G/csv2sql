defmodule DashboardWeb.Live.MainLive do
  use DashboardWeb, :live_view
  import Dashboard.Helpers
  alias DashBoard.Config
  alias DashBoard.DbAttribute
  alias Csv2sql.Database.ConnectionTest
  alias DashboardWeb.Live.ConfigLive
  alias DashboardWeb.Live.StartLive

  @debounce_time 1000

  @impl true
  def mount(_params, _session, socket) do
    local_storage_config = (get_connect_params(socket) || %{}) |> Map.get("localConfig", %{})

    local_storage_config =
      for {key, val} <- local_storage_config, into: %{}, do: {String.to_existing_atom(key), val}

    # Check for DB connection on config load from local storage
    timer_ref = Process.send_after(self(), :check_db_connection, @debounce_time)
    IO.inspect(Csv2sql.ProgressTracker.get_state())

    case Csv2sql.ProgressTracker.get_state().status do
      {:error, %{message: message}} -> {:ok,
      assign(socket,
        page: "start",
        modal: false,
        path_validator_debouncer: nil,
        db_connection_debouncer: timer_ref,
        db_connection_established: false,
        changeset: Config.get_defaults() |> Map.merge(local_storage_config) |> Config.changeset(),
        matching_date_time: nil,
        constraints: Csv2sql.Config.Loader.get_constraints(),
        error: true,
        reason: String.split(message, "\n") |> Enum.filter(fn s -> s not in ["",nil] end),
        state: Csv2sql.ProgressTracker.get_state()
      )}

      _ -> {:ok,
      assign(socket,
        page: "start",
        modal: false,
        path_validator_debouncer: nil,
        db_connection_debouncer: timer_ref,
        db_connection_established: false,
        changeset: Config.get_defaults() |> Map.merge(local_storage_config) |> Config.changeset(),
        matching_date_time: nil,
        constraints: Csv2sql.Config.Loader.get_constraints(),
        state: Csv2sql.ProgressTracker.get_state()
      )}
    end
  end

  def handle_event("csv-parse", _attrs, socket) do
    try do
      Csv2sql.Stages.Analyze.analyze_files()
      IO.inspect(Csv2sql.ProgressTracker.get_state())
      Process.send_after(self(), :get_status, 2000)
      {:noreply, assign(socket,page: "start",state: Csv2sql.ProgressTracker.get_state())}
    catch
      err ->
        IO.inspect(err)
      {:noreply, assign(socket,page: "start",error: true,err: err)}
    end
  end

  @impl true
  def handle_event("page-change", ~m{page}, socket) do
    {:noreply, assign(socket, ~M{page})}
  end

  @impl true
  def handle_event("open-modal", ~m{modal}, socket) do
    {:noreply, assign(socket, :modal, modal)}
  end

  @impl true
  def handle_event("close-modal", _attrs, socket) do
    {:noreply, assign(socket, :modal, false)}
  end

  @impl true
  def handle_event("validate-and-save", attrs, socket) do
    args = Map.get(attrs, "config", %{})

    socket =
      socket
      |> assign(
        page: "config",
        changeset: Config.changeset(args)
      )
      # DB connection checker is expensive and returns result to caller process with delay
      # so we don't do this validation on changeset level
      |> db_connection_checker(args)
      |> update_matching_date_time(attrs)

    {:noreply, socket |> push_event("save-config", %{config: socket.assigns.changeset})}
  end

  @impl true
  def handle_event("add-new-" <> field, _attrs, ~M{assigns} = socket)
      when field in ~w[db-attr date-pattern date-time-pattern] do
    new_field =
      field
      |> String.replace("-", "_")
      |> String.to_atom()
      |> case do
        :db_attr -> %DbAttribute{id: Nanoid.generate(), name: "", value: ""}
        :date_pattern -> %DashBoard.DatePattern{id: Nanoid.generate()}
        :date_time_pattern -> %DashBoard.DateTimePattern{id: Nanoid.generate()}
      end

    association = "#{field}s" |> String.replace("-", "_") |> String.to_atom()

    updated_association =
      assigns.changeset
      |> Ecto.Changeset.get_field(association, [])
      |> Enum.concat([new_field])

    updated_changeset =
      Ecto.Changeset.put_embed(assigns.changeset, association, updated_association)

    {:noreply,
     socket
     |> assign(changeset: updated_changeset)
     |> push_event("scroll-to-bottom", %{id: "#{field}s-container"})}
  end

  @impl true
  def handle_event("remove-" <> field, ~m{attrid}, ~M{assigns} = socket)
      when field in ~w[db-attr date-pattern date-time-pattern] do
    association = "#{field}s" |> String.replace("-", "_") |> String.to_atom()

    updated_association =
      assigns.changeset
      # For relations get_change/2 return the original changeset data with changes applied, fetch_change!/2 returns raw db_config changesets
      |> Ecto.Changeset.fetch_change!(association)
      |> Enum.reject(fn embed_changeset ->
        Ecto.Changeset.get_field(embed_changeset, :id) == attrid
      end)

    updated_changeset =
      Ecto.Changeset.put_embed(assigns.changeset, association, updated_association)

    {:noreply,
     socket
     |> assign(changeset: updated_changeset)
     |> update_matching_date_time()}
  end

  @impl true
  def handle_info(:get_status, socket) do
    IO.inspect(Csv2sql.ProgressTracker.get_state().status)
    case Csv2sql.ProgressTracker.get_state().status do
      :finish ->
       {:noreply, assign(socket,page: "start",state: Csv2sql.ProgressTracker.get_state())}

       {:error, %{message: message}} -> {:ok,
       assign(socket,
         page: "start",
         error: true,
         reason: String.split(message, "\n") |> Enum.filter(fn s -> s not in ["",nil] end),
         state: Csv2sql.ProgressTracker.get_state()
       )}
    _ ->
      Process.send_after(self(), :get_status, 2000)
    end
  end
  @impl true
  def handle_info(:check_db_connection, ~M{assigns} = socket) do
    with(
      db_url = create_db_url(assigns.changeset.changes, false),
      true <- not ("NA" == db_url),
      db_type <- Ecto.Changeset.get_field(assigns.changeset, :db_type),
      false <- is_nil(db_type),
      args = %{db_type: db_type, db_url: db_url},
      resp = ConnectionTest.check_db_connection(self(), args),
      :ok <- resp
    ) do
      socket
    else
      {:error, :on_going} ->
        Process.send_after(self(), :check_db_connection, @debounce_time)
        socket

      _ ->
        assign(socket, db_connection_established: false)
    end

    {:noreply, socket}
  end

  # DB connection callbacks
  @impl true
  def handle_info({:connected, _}, socket),
    do: {:noreply, assign(socket, db_connection_established: true)}

  @impl true
  def handle_info({:error, _}, ~M{assigns} = socket) do
    {:noreply,
     assign(
       socket,
       changeset:
         Ecto.Changeset.add_error(assigns.changeset, :db_url, "Could not connect to database"),
       db_connection_established: false
     )}
  end

  defp render_page(assigns) do
    case assigns.page do
      "config" ->
        ConfigLive.config_page(assigns)

      "start" ->
        IO.inspect(assigns.changeset.changes.source_directory)
        Map.put(assigns.changeset.changes, :dashboard, true)
        Csv2sql.Config.Loader.load(Map.put(assigns.changeset.changes,:db_url, create_db_url(assigns.changeset.changes, false)))
        StartLive.start_parse(assigns)
      "about" ->
        ~H"""
        About
        """
    end
  end

  defp db_connection_checker(~M{assigns} = socket, args) do
    if db_config_updated?(assigns, args) do
      if assigns.db_connection_debouncer,
        do: Process.cancel_timer(assigns.db_connection_debouncer)

      timer_ref = Process.send_after(self(), :check_db_connection, @debounce_time)
      assign(socket, :db_connection_debouncer, timer_ref)
    else
      socket
    end
  end

  defp db_config_updated?(~M{changeset}, args) do
    # TODO: Take into account custom db params
    Ecto.Changeset.get_field(changeset, :db_type) != Map.get(args, "db_type") ||
      Ecto.Changeset.get_field(changeset, :db_username) != Map.get(args, "db_username") ||
      Ecto.Changeset.get_field(changeset, :db_password) != Map.get(args, "db_password") ||
      Ecto.Changeset.get_field(changeset, :db_host) != Map.get(args, "db_host") ||
      Ecto.Changeset.get_field(changeset, :db_name) != Map.get(args, "db_name")
  end

  defp update_matching_date_time(~M{assigns} = socket, attrs \\ %{}) do
    date_time_sample =
      get_in(attrs, ["config", "date_time_trial"]) ||
        Ecto.Changeset.get_field(assigns.changeset, :date_time_trial)

    case match_date_time(assigns.changeset, date_time_sample) do
      {type, index} ->
        socket
        |> assign(matching_date_time: {type, index})
        |> push_event("scroll-into-view", %{
          id: "config_#{type}_patterns_#{index}_pattern"
        })

      false ->
        assign(socket, matching_date_time: nil)
    end
  end
end

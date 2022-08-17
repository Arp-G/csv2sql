defmodule DashboardWeb.Live.MainLive do
  use DashboardWeb, :live_view
  import Dashboard.Helpers
  alias DashBoard.{Config, DbAttribute}
  alias Csv2sql.Database.ConnectionTest

  @debounce_time 1000

  @impl true
  def mount(_params, _session, socket) do
    localstorage_config = (get_connect_params(socket) || %{}) |> Map.get("localConfig", %{})
    # Check for DB connection on config load from local storage
    timer_ref = Process.send_after(self(), :check_db_connection, @debounce_time)

    {:ok,
     assign(socket,
       page: "config",
       modal: false,
       path_validator_debouncer: nil,
       db_connection_debouncer: timer_ref,
       db_connection_established: false,
       changeset: Config.get_defaults() |> Config.changeset(localstorage_config),
       matching_date_time: nil
     )}
  end

  @impl true
  def handle_event("page-change", ~m{page}, socket) do
    {:noreply, assign(socket, ~M{page})}
  end

  @impl true
  def handle_event("open-modal", ~m{modal}, socket) do
    {:noreply, assign(socket, ~M{modal})}
  end

  @impl true
  def handle_event("close-modal", _attrs, socket) do
    {:noreply, assign(socket, ~M{modal: false})}
  end

  @impl true
  def handle_event("validate-and-save", attrs, ~M{assigns} = socket) do
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

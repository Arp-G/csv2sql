defmodule DashboardWeb.Live.MainLive do
  use DashboardWeb, :live_view
  alias DashBoard.{Config, DbAttribute}
  alias Csv2sql.Database.ConnectionTest

  @debounce_time 1000

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       page: "config",
       modal: false,
       path_validator_debouncer: nil,
       db_connection_debouncer: nil,
       db_connection_established: false,
       changeset: Ecto.Changeset.change(%DashBoard.Config{})
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
  def handle_event("validate-and-save", attrs, socket) do
    args = Map.get(attrs, "config", %{})

    socket =
      socket
      |> assign(
        page: "config",
        changeset: Config.changeset(args)
      )
      |> db_connection_checker(args)

    {:noreply, socket}
  end

  @impl true
  def handle_event("add-new-db-config", attrs, ~M{assigns} = socket) do
    updated_db_attrs =
      assigns.changeset.changes
      |> Map.get(:db_attrs, [])
      |> Enum.concat([%DbAttribute{id: Nanoid.generate(), name: "", value: ""}])

    updated_changeset = Ecto.Changeset.put_embed(assigns.changeset, :db_attrs, updated_db_attrs)

    {:noreply,
     socket
     |> assign(changeset: updated_changeset)
     |> push_event("scroll-to-bottom", %{id: "db-attrs-container"})}
  end

  @impl true
  def handle_event("remove-db-config", ~m{attrid}, ~M{assigns} = socket) do
    # From the top level changeset get the "db_attrs" changesets
    # Then check there "changes.id" property for matching id to remove, if its an empty db_attr then check "data.id" for id
    updated_db_attrs =
      assigns.changeset.changes
      |> Map.get(:db_attrs, [])
      |> Enum.reject(&((Map.get(&1.changes, :id) || &1.data.id) == attrid))

    updated_changeset = Ecto.Changeset.put_embed(assigns.changeset, :db_attrs, updated_db_attrs)

    {:noreply, assign(socket, changeset: updated_changeset)}
  end

  @impl true
  def handle_info(:check_db_connection, ~M{assigns} = socket) do
    with(
      db_url = Dashboard.Helpers.create_db_url(assigns.changeset.changes, false),
      "NA" != db_url,
      db_type <- assigns.changeset.changes.db_type,
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
  def handle_info({:error, _}, socket),
    do: {:noreply, assign(socket, db_connection_established: false)}

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
    changes = changeset.changes
    # TODO: Take into account custom db params
    changes.db_type != Map.get(args, "db_type") ||
      changes.db_username != Map.get(args, "db_username") ||
      changes.db_password != Map.get(args, "db_password") ||
      changes.db_host != Map.get(args, "db_host") ||
      changes.db_name != Map.get(args, "db_name")
  end
end

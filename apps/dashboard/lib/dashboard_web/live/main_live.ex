defmodule DashboardWeb.Live.MainLive do
  use DashboardWeb, :live_view
  alias DashBoard.Config
  alias Csv2sql.Database.ConnectionTest

  @debounce_time 1000

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       page: "config",
       configs: %{},
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
  def handle_event("validate-and-save", attrs, socket) do
    args = Map.get(attrs, "config", %{})
    # IO.inspect(updated_config)

    socket =
      socket
      |> db_connection_checker(args)
      |> assign(
        page: "config",
        configs: args,
        changeset: Config.changeset(args)
      )

    {:noreply, socket}
  end

  @impl true
  def handle_info(:check_db_connection, ~M{assigns} = socket) do
    with(
      db_url = Dashboard.Helpers.create_db_url(assigns.configs),
      "NA" != db_url,
      db_type <- get_in(assigns, [:configs, "db_type"]),
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

  defp db_config_updated?(~M{configs}, args) do
    # TODO: Take into account custom db params

    Map.get(configs, "db_type") != Map.get(args, "db_type") ||
      Map.get(configs, "db_username") != Map.get(args, "db_username") ||
      Map.get(configs, "db_password") != Map.get(args, "db_password") ||
      Map.get(configs, "db_host") != Map.get(args, "db_host") ||
      Map.get(configs, "db_name") != Map.get(args, "db_name")
  end
end

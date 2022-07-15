defmodule Dashboard.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DashboardWeb.Telemetry,
      {Phoenix.PubSub, name: Dashboard.PubSub},
      DashboardWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Dashboard.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    DashboardWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

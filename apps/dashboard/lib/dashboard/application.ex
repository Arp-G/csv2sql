defmodule Dashboard.Application do
  use Application

  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: Dashboard.PubSub},
      # Start the Endpoint (http/https)
      DashboardWeb.Endpoint,
      {Cachex, name: :config_cache}
    ]

    opts = [strategy: :one_for_one, name: Dashboard.Supervisor]
    sup = Supervisor.start_link(children, opts)

    # Load initial cache config
    DashboardWeb.Helper.ConfigHelper.load_initial_config()

    sup
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    DashboardWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

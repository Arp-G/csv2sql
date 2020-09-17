defmodule Dashboard.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      DashboardWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Dashboard.PubSub},
      # Start the Endpoint (http/https)
      DashboardWeb.Endpoint,
      {Cachex, name: :config_cache}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Dashboard.Supervisor]

    # Load initial cache config
    Task.start(fn ->
      :timer.sleep(500)
      DashboardWeb.Helper.ConfigHelper.load_initial_config()
    end)

    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    DashboardWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

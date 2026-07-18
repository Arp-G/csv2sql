defmodule Csv2sql.Application do
  # See https://elixir.hexdocs.pm/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Csv2sqlWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:csv2sql, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Csv2sql.PubSub},
      # Start a worker by calling: Csv2sql.Worker.start_link(arg)
      # {Csv2sql.Worker, arg},
      # Start to serve requests, typically the last entry
      Csv2sqlWeb.Endpoint
    ]

    # See https://elixir.hexdocs.pm/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Csv2sql.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Csv2sqlWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

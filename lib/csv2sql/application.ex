defmodule Csv2sql.Application do
  # See https://elixir.hexdocs.pm/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    attach_sentry()

    children = [
      Csv2sqlWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:csv2sql, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Csv2sql.PubSub},
      # Engine: per-run process names + run trees + UI connection probes
      {Registry, keys: :unique, name: Csv2sql.RunRegistry},
      {DynamicSupervisor, name: Csv2sql.RunsSupervisor, strategy: :one_for_one},
      {Task.Supervisor, name: Csv2sql.ProbeSupervisor},
      # Start to serve requests, typically the last entry
      Csv2sqlWeb.Endpoint
    ]

    # See https://elixir.hexdocs.pm/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Csv2sql.Supervisor]
    Supervisor.start_link(children ++ entry_children(), opts)
  end

  # Binary/release mode only: dispatch CLI subcommands or open the GUI.
  defp entry_children do
    if Application.get_env(:csv2sql, :boot_entry, false) do
      [Supervisor.child_spec({Task, &Csv2sql.Entry.boot/0}, id: :entry, restart: :temporary)]
    else
      []
    end
  end

  # Crash reporting is opt-in: only when a DSN was configured (runtime.exs
  # reads CSV2SQL_SENTRY_DSN). Captures crashes/exceptions, not log noise;
  # Sentry events carry stacktrace + release + OS — no file contents,
  # paths, or database URLs.
  defp attach_sentry do
    if Application.get_env(:sentry, :dsn) do
      :logger.add_handler(:sentry, Sentry.LoggerHandler, %{
        config: %{capture_log_messages: false}
      })
    end
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Csv2sqlWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

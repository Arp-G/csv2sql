defmodule Csv2sql.Application do
  @moduledoc """
    Main application module for csv2sql
  """

  use Application

  def start(_type, _args) do
    children = [
      Csv2sql.ProgressTracker,
      {Registry, keys: :unique, name: Csv2sql.Loader.ProducerRegistry},
      {Task.Supervisor, name: Csv2sql.Database.ConnectionSupervisor},
      Csv2sql.Database.ConnectionTest
    ]

    opts = [strategy: :one_for_one, name: Csv2sql.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

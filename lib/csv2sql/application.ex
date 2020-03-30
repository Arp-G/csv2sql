defmodule Csv2sql.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {MyXQL,
       name: :myxql,
       username: Application.get_env(:csv2sql, Csv2sql.DB)[:username],
       password: Application.get_env(:csv2sql, Csv2sql.DB)[:password],
       socket: Application.get_env(:csv2sql, Csv2sql.DB)[:socket]},
      Csv2sql.WorkerSupervisor,
      Csv2sql.Server
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Csv2sql.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

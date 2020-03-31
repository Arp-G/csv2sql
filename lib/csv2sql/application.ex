defmodule Csv2sql.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @source_csv_directory Application.get_env(:csv2sql, Csv2sql.Server)[:source_csv_directory]
  @worker_count Application.get_env(:csv2sql, Csv2sql.Server)[:worker_count]
  def start(_type, _args) do
    children = [
      {Csv2sql.TimerServer, Time.utc_now()},
      Csv2sql.Repo,
      {Csv2sql.FileServer, @source_csv_directory},
      Csv2sql.WorkerSupervisor,
      {Csv2sql.Server, @worker_count}
    ]

    opts = [strategy: :one_for_one, name: Csv2sql.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

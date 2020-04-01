defmodule Csv2sql.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Csv2sql.TimerServer, Time.utc_now()},
      Csv2sql.Repo,
      Csv2sql.FileServer,
      Csv2sql.JobQueueServer,
      Csv2sql.DbWorkerSupervisor,
      Csv2sql.WorkerSupervisor,
      Csv2sql.MainServer
    ]

    opts = [strategy: :one_for_one, name: Csv2sql.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

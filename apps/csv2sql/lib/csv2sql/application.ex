defmodule Csv2sql.Application do
  use Application

  def start(_type, _args) do
    repo_supervisor =
      if Application.get_env(:csv2sql, Csv2sql.MainServer)[:set_validate] ||
           Application.get_env(:csv2sql, Csv2sql.Worker)[:set_insert_schema] ||
           Application.get_env(:csv2sql, Csv2sql.Worker)[:set_insert_data],
         do: [Csv2sql.Repo],
         else: []

    children =
      repo_supervisor ++
        [
          Csv2sql.Observer,
          Csv2sql.JobQueueServer,
          Csv2sql.DbWorkerSupervisor,
          Csv2sql.WorkerSupervisor,
          Csv2sql.MainServer
        ]

    opts = [strategy: :one_for_one, name: Csv2sql.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

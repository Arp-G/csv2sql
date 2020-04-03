defmodule Csv2sql.Application do
  use Application

  def start(_type, _args) do
    set_validate = Application.get_env(:csv2sql, Csv2sql.MainServer)[:set_validate]
    set_insert_schema = Application.get_env(:csv2sql, Csv2sql.Worker)[:set_insert_schema]
    set_insert_data = Application.get_env(:csv2sql, Csv2sql.Worker)[:set_insert_data]

    repo_supervisor =
      if set_validate || set_insert_schema || set_insert_data do
        [Csv2sql.Repo]
      else
        []
      end

    children =
      [
        {Csv2sql.TimerServer, Time.utc_now()}
      ]
      |> Kernel.++(repo_supervisor)
      |> Kernel.++([
        Csv2sql.FileServer,
        Csv2sql.JobQueueServer,
        Csv2sql.DbWorkerSupervisor,
        Csv2sql.WorkerSupervisor,
        Csv2sql.MainServer
      ])

    opts = [strategy: :one_for_one, name: Csv2sql.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

defmodule Csv2sql.Repo do
  use Ecto.Repo,
    otp_app: :csv2sql,
    adapter: Ecto.Adapters.MyXQL

    # def init(_, opts) do
    #   {:ok, build_opts(opts)}
    # end

    # defp build_opts(opts) do
    #   system_opts = [
    #     database_name: System.get_env("csv2sql_database_name"),
    #     hostname: System.get_env("csv2sql_host"),
    #     password: System.get_env("csv2sql_password"),
    #     username: System.get_env("csv2sql_username"),
    #     log: System.get_env("csv2sql_log"),
    #     timeout: System.get_env("csv2sql_timeout") |> String.to_integer(),
    #     connect_timeout: System.get_env("csv2sql_connect_timeout") |> String.to_integer(),
    #     pool_size: System.get_env("csv2sql_pool_size") |> String.to_integer(),
    #     queue_target: System.get_env("csv2sql_queue_target") |> String.to_integer(),
    #     queue_interval: System.get_env("csv2sql_queue_interval") |> String.to_integer()
    #   ]

    #   system_opts
    #   |> remove_empty_opts()
    #   |> merge_opts(opts)
    # end

    # defp merge_opts(system_opts, opts) do
    #   Keyword.merge(opts, system_opts)
    # end

    # defp remove_empty_opts(system_opts) do
    #   Enum.reject(system_opts, fn {_k, value} -> is_nil(value) end)
    # end
  end

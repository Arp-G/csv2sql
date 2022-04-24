defmodule Csv2sql.Database do
  import ShorterMaps

  # def check_connection(~M{db_url, db_type}) do
  #   repo = get_repo(db_type)
  #   parent = self()

  #   Task.start(fn ->

  #   end)

  #   receive do
  #     {:connected, conn} -> {:connected, conn}
  #     {:error, e} -> {:error, e}
  #   after
  #     5000 ->
  #       {:error, :timeout}
  #   end
  # end

  # def check_connection(_), do: {:error, "Database configuration not found"}

  # def attempt_connection(~M{db_url, parent_pid}) do
  #   {:ok, conn} = repo.start_link(url: db_url, pool_size: 1)

  #   try do
  #     Ecto.Adapters.SQL.query!(repo, "SELECT 1")
  #     Process.send(parent, {:connected, conn}, [])
  #   rescue
  #     e in DBConnection.ConnectionError -> Process.send(parent, {:error, e}, [])
  #   end
  # end

  # def get_repo(:mysql), do: Csv2sql.MySQLRepo
  # def get_repo(:postgres), do: Csv2sql.PostgreSQLRepo
end

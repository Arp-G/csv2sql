defmodule Csv2sql.MySQLRepo do
  use Ecto.Repo,
    otp_app: :csv2sql,
    adapter: Ecto.Adapters.MyXQL
end

defmodule Csv2sql.PostgreSQLRepo do
  use Ecto.Repo,
    otp_app: :csv2sql,
    adapter: Ecto.Adapters.Postgres
end

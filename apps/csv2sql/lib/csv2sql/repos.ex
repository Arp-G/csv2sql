defmodule Csv2sql.MySQLRepo do
  @moduledoc """
    MySQL specific Repo definition
  """
  use Ecto.Repo,
    otp_app: :csv2sql,
    adapter: Ecto.Adapters.MyXQL
end

defmodule Csv2sql.PostgreSQLRepo do
  @moduledoc """
    Postgres specific Repo definition
  """

  use Ecto.Repo,
    otp_app: :csv2sql,
    adapter: Ecto.Adapters.Postgres
end

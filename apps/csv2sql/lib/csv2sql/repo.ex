defmodule Csv2sql.Repo do
  use Ecto.Repo,
    otp_app: :csv2sql,
    adapter: Ecto.Adapters.MyXQL
end

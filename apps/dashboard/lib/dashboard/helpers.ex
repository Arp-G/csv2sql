defmodule Dashboard.Helpers do
  def create_db_url(configs) do
    db_username = Map.get(configs, "db_username")
    db_password = Map.get(configs, "db_password")
    db_host = Map.get(configs, "db_host")
    db_name = Map.get(configs, "db_name")

    if !is_empty(db_username) &&
         !is_empty(db_password) &&
         !is_empty(db_host) &&
         !is_empty(db_name),
       do: "ecto://#{db_username}:#{db_password}@#{db_host}/#{db_name}",
       else: "NA"
  end

  def is_empty(arg) when arg in [nil, ""], do: true
  def is_empty(_), do: false
end

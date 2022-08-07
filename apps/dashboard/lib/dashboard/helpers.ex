defmodule Dashboard.Helpers do
  import ShorterMaps

  defguard present?(value) when value != nil and value != ""

  def create_db_url(configs, hide_password \\ true)

  def create_db_url(
        ~M{db_username, db_password, db_host, db_name} = config,
        hide_password
      )
      when present?(db_username) and present?(db_password) and
             present?(db_name) and present?(db_host) do
    password = hide_password(db_password, hide_password)

    "ecto://#{db_username}:#{password}@#{db_host}/#{db_name}?#{make_query_params(config)}"
    |> String.trim_trailing("?")
  end

  def create_db_url(_configs, _hide_password), do: "NA"

  # == Private helpers ==
  defp make_query_params(~M{db_attrs}) when is_list(db_attrs) do
    db_attrs
    |> Enum.map(& &1.changes)
    |> Enum.reject(fn
      ~M{name, value} when present?(name) and present?(value) -> false
      _ -> true
    end)
    |> Enum.into(%{}, fn ~M{name, value} -> {name, value} end)
    |> URI.encode_query()
  end

  defp make_query_params(_config), do: ""

  defp hide_password(password, true),
    do: password |> String.split("") |> Enum.map(fn _ -> "•" end) |> Enum.join("")

  defp hide_password(password, false), do: password
end

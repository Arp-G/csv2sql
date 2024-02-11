defmodule Dashboard.Helpers do
  import ShorterMaps

  defguard present?(value) when value != nil and value != ""

  def match_date_time(changeset, date_time_sample) do
    date_index =
      changeset
      |> Ecto.Changeset.get_field(:date_patterns, [])
      |> get_matching_pattern_index(date_time_sample)

    if is_nil(date_index) do
      date_time_index =
        changeset
        |> Ecto.Changeset.get_field(:date_time_patterns, [])
        |> get_matching_pattern_index(date_time_sample)

      if is_nil(date_time_index), do: false, else: {:date_time, date_time_index}
    else
      if is_nil(date_index), do: false, else: {:date, date_index}
    end
  end

  def create_db_url(configs, opts \\ [])

  def create_db_url(
        ~M{db_username, db_password, db_host, db_name} = config,
        opts
      )
      when present?(db_username) and present?(db_password) and
             present?(db_name) and present?(db_host) do
    hide_password? = Keyword.get(opts, :hide_password, false)
    password = if hide_password?, do: hide_password(db_password), else: db_password

    "ecto://#{db_username}:#{password}@#{db_host}/#{db_name}?#{make_query_params(config)}"
    |> String.trim_trailing("?")
    |> IO.inspect(label: "DB URL")
  end

  def create_db_url(_configs, _opts), do: "NA"

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

  defp hide_password(password) do
    password
    |> String.split("")
    |> Enum.map(fn _ -> "•" end)
    |> Enum.join("")
  end

  defp get_matching_pattern_index(patterns, string) do
    Enum.find_index(patterns, fn pattern_struct ->
      case Timex.parse(string, pattern_struct.pattern) do
        {:ok, _} -> true
        {:error, _} -> false
      end
    end)
  end
end

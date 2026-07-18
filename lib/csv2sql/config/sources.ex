defmodule Csv2sql.Config.Sources do
  @moduledoc """
  Merges configuration sources by precedence:

      CLI flags  >  CSV2SQL_* environment  >  persisted defaults  >  schema defaults

  All sources produce the same changeset-castable params map, so one
  `Config.changeset/2` validates everything. `CSV2SQL_DB_PASSWORD`
  complements password-less stored/typed URLs (the store never persists
  passwords).
  """

  alias Csv2sql.Config.Store

  @env_mapping [
    {"CSV2SQL_SOURCE_DIR", ["source_dir"]},
    {"CSV2SQL_DB_URL", ["db", "url"]},
    {"CSV2SQL_TABLE_MODE", ["table_mode"]},
    {"CSV2SQL_DELIMITER", ["delimiter"]},
    {"CSV2SQL_ENCODING", ["encoding"]},
    {"CSV2SQL_ORDERED", ["ordered"]},
    {"CSV2SQL_VARCHAR_LIMIT", ["varchar_limit"]},
    {"CSV2SQL_STRICT", ["error_policy", "strict"]}
  ]

  @doc "Builds the merged params map (CLI params win)."
  @spec build(map()) :: map()
  def build(cli_params) do
    Store.load()
    |> deep_merge(env_params())
    |> deep_merge(cli_params)
    |> inject_password(System.get_env("CSV2SQL_DB_PASSWORD"))
  end

  @doc "Params contributed by `CSV2SQL_*` environment variables."
  @spec env_params() :: map()
  def env_params do
    Enum.reduce(@env_mapping, %{}, fn {var, path}, params ->
      case System.get_env(var) do
        nil -> params
        value -> put_path(params, path, value)
      end
    end)
  end

  @doc false
  @spec deep_merge(map(), map()) :: map()
  def deep_merge(base, override) when is_map(base) and is_map(override) do
    Map.merge(base, override, fn _key, a, b ->
      if is_map(a) and is_map(b), do: deep_merge(a, b), else: b
    end)
  end

  defp put_path(params, [key], value), do: Map.put(params, key, value)

  defp put_path(params, [key | rest], value) do
    Map.put(params, key, put_path(Map.get(params, key, %{}), rest, value))
  end

  defp inject_password(params, nil), do: params
  defp inject_password(params, ""), do: params

  defp inject_password(params, password) do
    case get_in(params, ["db", "url"]) do
      url when is_binary(url) and url != "" ->
        put_in(params, ["db", "url"], url_with_password(url, password))

      _missing ->
        params
    end
  end

  defp url_with_password(url, password) do
    uri = URI.parse(url)

    case uri.userinfo do
      nil ->
        url

      userinfo ->
        case String.split(userinfo, ":", parts: 2) do
          # Password already present — explicit URL wins.
          [_user, _pass] -> url
          [user] -> URI.to_string(%{uri | userinfo: "#{user}:#{password}"})
        end
    end
  end
end

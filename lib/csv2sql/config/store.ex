defmodule Csv2sql.Config.Store do
  @moduledoc """
  Persisted default configuration (form-level params) as JSON at the
  OS-appropriate user-config location (`CSV2SQL_CONFIG_PATH` overrides —
  used by tests and portable setups).

  The database password is **never** written: the stored URL keeps the
  user but drops the secret, which is re-entered per session or supplied
  via environment.
  """

  @doc "The config file path."
  @spec path() :: Path.t()
  def path do
    System.get_env("CSV2SQL_CONFIG_PATH") ||
      :user_config
      |> :filename.basedir("csv2sql")
      |> Path.join("config.json")
  end

  @doc "Saves params as the defaults (password stripped). Best-effort."
  @spec save(map()) :: :ok | {:error, term()}
  def save(params) when is_map(params) do
    file = path()
    File.mkdir_p!(Path.dirname(file))
    File.write!(file, JSON.encode_to_iodata!(sanitize(params)))
    :ok
  rescue
    exception -> {:error, exception}
  end

  @doc "Loads the persisted defaults (empty map when absent/corrupt)."
  @spec load() :: map()
  def load do
    with {:ok, content} <- File.read(path()),
         {:ok, params} when is_map(params) <- JSON.decode(content) do
      params
    else
      _missing_or_corrupt -> %{}
    end
  end

  @doc """
  Strips the password from a database URL (kept out of the file).

  ## Examples

      iex> Csv2sql.Config.Store.strip_password("postgres://alice:secret@host:5432/db")
      "postgres://alice@host:5432/db"

      iex> Csv2sql.Config.Store.strip_password("mysql://host/db")
      "mysql://host/db"

  """
  @spec strip_password(String.t() | nil) :: String.t() | nil
  def strip_password(nil), do: nil

  def strip_password(url) do
    uri = URI.parse(url)

    case uri.userinfo do
      nil ->
        url

      userinfo ->
        user = userinfo |> String.split(":", parts: 2) |> hd()
        URI.to_string(%{uri | userinfo: user})
    end
  end

  defp sanitize(params) do
    case params do
      %{"db" => %{"url" => url} = db} when is_binary(url) ->
        Map.put(params, "db", Map.put(db, "url", strip_password(url)))

      _no_db_url ->
        params
    end
  end
end

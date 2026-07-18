defmodule Csv2sql.Config.Db do
  @moduledoc """
  Database connection settings.

  The connection is a single URL (`postgres://user:pass@host:port/database`
  or `mysql://…`; a unix socket can be given as `?socket=/path`); the
  password is never logged (the `url` field is redacted from inspection)
  and never persisted by default.

  The adapter is derived from the URL scheme when not set explicitly.
  """

  use Ecto.Schema

  import Ecto.Changeset

  @adapters [:postgres, :mysql]
  @schemes %{
    "postgres" => :postgres,
    "postgresql" => :postgres,
    "mysql" => :mysql
  }
  @default_ports %{postgres: 5432, mysql: 3306}

  @primary_key false
  embedded_schema do
    field(:adapter, Ecto.Enum, values: @adapters)
    field(:url, :string, redact: true)
    field(:pool_size, :integer)
  end

  @type adapter :: :postgres | :mysql

  @type t :: %__MODULE__{
          adapter: adapter() | nil,
          url: String.t() | nil,
          pool_size: pos_integer() | nil
        }

  @spec changeset(t(), map()) :: Ecto.Changeset.t()
  def changeset(db, params) do
    db
    |> cast(params, [:adapter, :url, :pool_size])
    |> validate_required([:url])
    |> validate_number(:pool_size, greater_than: 0, less_than_or_equal_to: 200)
    |> derive_adapter()
    |> validate_url()
  end

  @doc """
  Parses the connection URL into driver options for `Postgrex.start_link/1`
  / `MyXQL.start_link/1` (both use the same option names).

  ## Examples

      iex> Csv2sql.Config.Db.conn_opts(%Csv2sql.Config.Db{
      ...>   adapter: :postgres,
      ...>   url: "postgres://alice:secret@dbhost:6432/warehouse"
      ...> })
      [hostname: "dbhost", port: 6432, username: "alice", password: "secret", database: "warehouse"]

      iex> Csv2sql.Config.Db.conn_opts(%Csv2sql.Config.Db{
      ...>   adapter: :mysql,
      ...>   url: "mysql://root@localhost/stats?socket=/tmp/mysql.sock"
      ...> })
      [hostname: "localhost", port: 3306, username: "root", database: "stats", socket: "/tmp/mysql.sock"]

  """
  @spec conn_opts(t()) :: Keyword.t()
  def conn_opts(%__MODULE__{url: url} = db) when is_binary(url) do
    uri = URI.parse(url)
    {username, password} = split_userinfo(uri.userinfo)

    [
      hostname: uri.host || "localhost",
      port: uri.port || @default_ports[db.adapter],
      username: username,
      password: password,
      database: parse_database(uri.path),
      socket: socket_param(uri.query)
    ]
    |> Enum.reject(fn {_key, value} -> is_nil(value) end)
  end

  @doc "The database name from the URL."
  @spec database(t()) :: String.t() | nil
  def database(%__MODULE__{url: url}) when is_binary(url) do
    url |> URI.parse() |> Map.get(:path) |> parse_database()
  end

  @doc "The effective pool size: explicit setting or a worker-derived default."
  @spec pool_size(t(), Csv2sql.Config.t()) :: pos_integer()
  def pool_size(%__MODULE__{pool_size: size}, _config) when is_integer(size), do: size

  def pool_size(%__MODULE__{}, config) do
    # Enough connections that insert workers rarely queue, capped sanely.
    min(config.file_workers * config.insert_workers, 20)
  end

  defp split_userinfo(nil), do: {nil, nil}

  defp split_userinfo(userinfo) do
    case String.split(userinfo, ":", parts: 2) do
      [user] -> {URI.decode(user), nil}
      [user, pass] -> {URI.decode(user), URI.decode(pass)}
    end
  end

  defp parse_database("/" <> database) when database != "", do: database
  defp parse_database(_path), do: nil

  defp socket_param(nil), do: nil
  defp socket_param(query), do: query |> URI.decode_query() |> Map.get("socket")

  defp derive_adapter(changeset) do
    with nil <- get_field(changeset, :adapter),
         url when is_binary(url) <- get_field(changeset, :url),
         %{scheme: scheme} <- URI.parse(url),
         {:ok, adapter} <- Map.fetch(@schemes, scheme || "") do
      put_change(changeset, :adapter, adapter)
    else
      _other -> changeset
    end
  end

  defp validate_url(changeset) do
    adapter = get_field(changeset, :adapter)

    validate_change(changeset, :url, fn :url, url ->
      uri = URI.parse(url)

      cond do
        not Map.has_key?(@schemes, uri.scheme || "") ->
          [url: "must start with postgres:// or mysql://"]

        adapter && @schemes[uri.scheme] != adapter ->
          [url: "scheme does not match adapter #{adapter}"]

        is_nil(parse_database(uri.path || "")) ->
          [url: "must include a database name"]

        true ->
          []
      end
    end)
  end
end

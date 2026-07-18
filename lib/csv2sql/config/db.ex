defmodule Csv2sql.Config.Db do
  @moduledoc """
  Database connection settings.

  The connection is a single URL (`postgres://user:pass@host:port/database`);
  the password is never logged (the `url` field is redacted from inspection)
  and never persisted by default.
  """

  use Ecto.Schema

  import Ecto.Changeset

  @adapters [:postgres]

  @primary_key false
  embedded_schema do
    field(:adapter, Ecto.Enum, values: @adapters, default: :postgres)
    field(:url, :string, redact: true)
    field(:pool_size, :integer)
  end

  @type t :: %__MODULE__{
          adapter: :postgres,
          url: String.t() | nil,
          pool_size: pos_integer() | nil
        }

  @spec changeset(t(), map()) :: Ecto.Changeset.t()
  def changeset(db, params) do
    db
    |> cast(params, [:adapter, :url, :pool_size])
    |> validate_required([:url])
    |> validate_number(:pool_size, greater_than: 0, less_than_or_equal_to: 200)
    |> validate_url()
  end

  @doc """
  Parses the connection URL into driver options for `Postgrex.start_link/1`
  (and later `MyXQL.start_link/1`).

  ## Examples

      iex> Csv2sql.Config.Db.conn_opts(%Csv2sql.Config.Db{
      ...>   adapter: :postgres,
      ...>   url: "postgres://alice:secret@dbhost:6432/warehouse"
      ...> })
      [hostname: "dbhost", port: 6432, username: "alice", password: "secret", database: "warehouse"]

      iex> Csv2sql.Config.Db.conn_opts(%Csv2sql.Config.Db{
      ...>   adapter: :postgres,
      ...>   url: "postgres://localhost/analytics"
      ...> })
      [hostname: "localhost", port: 5432, database: "analytics"]

  """
  @spec conn_opts(t()) :: Keyword.t()
  def conn_opts(%__MODULE__{url: url} = db) when is_binary(url) do
    uri = URI.parse(url)
    {username, password} = split_userinfo(uri.userinfo)

    [
      hostname: uri.host || "localhost",
      port: uri.port || default_port(db.adapter),
      username: username,
      password: password,
      database: parse_database(uri.path)
    ]
    |> Enum.reject(fn {_key, value} -> is_nil(value) end)
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

  defp default_port(:postgres), do: 5432

  defp validate_url(changeset) do
    validate_change(changeset, :url, fn :url, url ->
      uri = URI.parse(url)

      cond do
        uri.scheme not in ["postgres", "postgresql"] ->
          [url: "must start with postgres://"]

        is_nil(parse_database(uri.path || "")) ->
          [url: "must include a database name"]

        true ->
          []
      end
    end)
  end
end

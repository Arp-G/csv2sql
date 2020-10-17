defmodule DashboardWeb.Helper.ConfigHelper do
  def load_initial_config do
    inital_config = get_initial_config()
    Cachex.put_many(:config_cache, convert_to_klist(inital_config))
  end

  defp convert_to_klist(map) do
    Enum.map(map, fn {key, value} -> {key, value} end)
  end

  def get_config_from_cache() do
    Cachex.export!(:config_cache)
    |> Enum.reduce(%{}, fn {:entry, key, _, _, value}, acc ->
      Map.put(acc, key, value)
    end)
  end

  def get_to_config_arg() do
    Cachex.export!(:config_cache)
    |> add_db_connection_config()
    |> Enum.reject(fn {_, _, _, _, val} -> is_nil(val) || val == "" end)
    |> Enum.map(fn {:entry, key, _, _, value} ->
      {"--" <> to_string(key), to_string(value)}
    end)
    |> Enum.reduce([], fn {key, value}, acc ->
      acc ++ [key, value]
    end)
  end

  defp add_db_connection_config(config) do
    {:entry, _, _, _, database_type} =
      Enum.find(config, fn {:entry, key, _, _, _value} -> key == :database_type end)

    {:entry, _, _, _, username} =
      Enum.find(config, fn {:entry, key, _, _, _value} -> key == :csv2sql_username end)

    {:entry, _, _, _, password} =
      Enum.find(config, fn {:entry, key, _, _, _value} -> key == :csv2sql_password end)

    {:entry, _, _, _, host} =
      Enum.find(config, fn {:entry, key, _, _, _value} -> key == :csv2sql_host end)

    {:entry, _, _, _, database_name} =
      Enum.find(config, fn {:entry, key, _, _, _value} -> key == :csv2sql_database_name end)

    config ++
      [
        {:entry, String.to_atom("db-connection-string"), nil, nil,
         "#{database_type}:#{username}:#{password}@#{host}/#{database_name}"}
      ]
  end

  defp get_initial_config do
    %{
      dashboard: true,
      database_type: "mysql",
      "schema-file-path": "",
      "source-csv-directory": "",
      "imported-csv-directory": "",
      "validated-csv-directory": "",
      "skip-make-schema": nil,
      "skip-insert-schema": nil,
      "skip-insert-data": nil,
      "skip-validate-import": nil,
      csv2sql_username: "",
      csv2sql_password: "",
      csv2sql_host: "localhost",
      csv2sql_database_name: "",
      "connection-socket": "/var/run/mysqld/mysqld.sock",
      "varchar-limit": 100,
      "schema-infer-chunk-size": 100,
      "worker-count": 10,
      "db-worker-count": 15,
      "insertion-chunk-size": 100,
      "job-count-limit": 10,
      timeout: 60_000,
      "connect-timeout": 60_000,
      "pool-size": 20,
      "queue-target": 5000,
      "queue-interval": 1000
    }
  end
end

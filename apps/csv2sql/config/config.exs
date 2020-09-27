use Mix.Config

config :csv2sql, Csv2sql.Repo,
  username: "root",
  password: "mysql",
  database: "myproject_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

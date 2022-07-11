import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :csv2sql_web, Csv2sqlWebWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "cu0Fx71B7By/xacjIjBj0qG6lqDoayzhRMnmCA076ciJoIiw2zgzWTxgG5awjE0X",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :dashboard, DashboardWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "pYynG2vS41aV9IF+H/nexIqwuWGvQ5q6OtGkfyB7XLpX7oqj5RW0ClgL3G4sHw++",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

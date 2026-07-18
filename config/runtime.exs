import Config

# config/runtime.exs is executed for all environments, including
# during releases. It is executed after compilation and before the
# system starts, so it is typically used to load production configuration
# and secrets from environment variables or elsewhere. Do not define
# any compile-time configuration in here, as it won't be applied.
# The block below contains prod specific runtime configuration.

# ## Using releases
#
# If you use `mix release`, you need to explicitly enable the server
# by passing the PHX_SERVER=true when you start it:
#
#     PHX_SERVER=true bin/csv2sql start
#
# Alternatively, you can use `mix phx.gen.release` to generate a `bin/server`
# script that automatically sets the env var above.
if System.get_env("PHX_SERVER") do
  config :csv2sql, Csv2sqlWeb.Endpoint, server: true
end

config :csv2sql, Csv2sqlWeb.Endpoint,
  http: [port: String.to_integer(System.get_env("PORT", "4000"))]

if config_env() == :dev do
  # Reload browser tabs when matching files change.
  config :csv2sql, Csv2sqlWeb.Endpoint,
    live_reload: [
      web_console_logger: true,
      patterns: [
        # Static assets, except user uploads
        ~r"priv/static/(?!uploads/).*\.(js|css|png|jpeg|jpg|gif|svg)$"E,
        # Router, Controllers, LiveViews and LiveComponents
        ~r"lib/csv2sql_web/router\.ex$"E,
        ~r"lib/csv2sql_web/(controllers|live|components)/.*\.(ex|heex)$"E
      ]
    ]
end

if config_env() == :prod do
  # Prod is the desktop binary (Burrito) or a self-managed release.
  # Inside the Burrito wrapper the real CLI args are available; anywhere
  # else this safely resolves to [].
  args =
    try do
      Burrito.Util.Args.argv()
    rescue
      _ -> []
    catch
      _, _ -> []
    end

  cli? = match?([cmd | _] when cmd in ~w(import analyze --help -h --version -v), args)

  # Desktop tool defaults: ephemeral secret (sessions reset per start),
  # loopback bind, no server when running a headless CLI subcommand.
  # SECRET_KEY_BASE / PHX_HOST / PORT still override for hosted setups.
  secret_key_base =
    System.get_env("SECRET_KEY_BASE") || Base.encode64(:crypto.strong_rand_bytes(48))

  host = System.get_env("PHX_HOST") || "localhost"
  port = String.to_integer(System.get_env("PORT", "4000"))

  config :csv2sql, :dns_cluster_query, System.get_env("DNS_CLUSTER_QUERY")
  config :csv2sql, :boot_entry, true

  config :csv2sql, Csv2sqlWeb.Endpoint,
    url: [host: host, port: port],
    http: [ip: {127, 0, 0, 1}, port: port],
    secret_key_base: secret_key_base,
    server: not cli? or System.get_env("PHX_SERVER") != nil

  # Crash reporting is strictly opt-in: no DSN, no Sentry.
  if sentry_dsn = System.get_env("CSV2SQL_SENTRY_DSN") do
    config :sentry,
      dsn: sentry_dsn,
      client: Csv2sql.SentryClient,
      environment_name: "prod",
      release: "csv2sql@#{Application.spec(:csv2sql, :vsn)}"
  end

  # ## SSL Support
  #
  # To get SSL working, you will need to add the `https` key
  # to your endpoint configuration:
  #
  #     config :csv2sql, Csv2sqlWeb.Endpoint,
  #       https: [
  #         ...,
  #         port: 443,
  #         cipher_suite: :strong,
  #         keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
  #         certfile: System.get_env("SOME_APP_SSL_CERT_PATH")
  #       ]
  #
  # The `cipher_suite` is set to `:strong` to support only the
  # latest and more secure SSL ciphers. This means old browsers
  # and clients may not be supported. You can set it to
  # `:compatible` for wider support.
  #
  # `:keyfile` and `:certfile` expect an absolute path to the key
  # and cert in disk or a relative path inside priv, for example
  # "priv/ssl/server.key". For all supported SSL configuration
  # options, see https://plug.hexdocs.pm/Plug.SSL.html#configure/1
  #
  # We also recommend setting `force_ssl` in your config/prod.exs,
  # ensuring no data is ever sent via http, always redirecting to https:
  #
  #     config :csv2sql, Csv2sqlWeb.Endpoint,
  #       force_ssl: [hsts: true]
  #
  # Check `Plug.SSL` for all available options in `force_ssl`.
end

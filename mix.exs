defmodule Csv2sql.MixProject do
  use Mix.Project

  def project do
    [
      app: :csv2sql,
      version: "5.0.0-dev",
      elixir: "~> 1.18",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      compilers: [:phoenix_live_view] ++ Mix.compilers(),
      listeners: [Phoenix.CodeReloader],
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"},
        plt_add_apps: [:ex_unit]
      ],
      releases: releases()
    ]
  end

  # One binary per OS via Burrito: GUI (opens the browser) with no args,
  # headless CLI via `csv2sql import|analyze`. Build a single target with
  # e.g. BURRITO_TARGET=macos_arm.
  defp releases do
    [
      csv2sql: [
        steps: release_steps(),
        burrito: [
          targets: [
            macos_arm: [os: :darwin, cpu: :aarch64],
            macos_intel: [os: :darwin, cpu: :x86_64],
            linux: [os: :linux, cpu: :x86_64],
            windows: [os: :windows, cpu: :x86_64]
          ]
        ]
      ]
    ]
  end

  # Machines where Burrito's pinned zig cannot link (macOS 26 SDK needs
  # zig >= 0.16) can still build the standard OTP release:
  #
  #     CSV2SQL_PLAIN_RELEASE=1 MIX_ENV=prod mix release csv2sql
  #
  # Same app, same entry dispatch — a directory + bin script under
  # _build/prod/rel/csv2sql instead of one wrapped binary.
  defp release_steps do
    if System.get_env("CSV2SQL_PLAIN_RELEASE"),
      do: [:assemble],
      else: [:assemble, &Burrito.wrap/1]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Csv2sql.Application, []},
      # :inets/:ssl power the zero-dep Sentry HTTP client.
      extra_applications: [:logger, :runtime_tools, :inets, :ssl]
    ]
  end

  def cli do
    [
      preferred_envs: [precommit: :test]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.8.9"},
      {:phoenix_html, "~> 4.1"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 1.2.0"},
      {:lazy_html, ">= 0.1.0", only: :test},
      {:phoenix_live_dashboard, "~> 0.8.3"},
      {:esbuild, "~> 0.10", runtime: Mix.env() == :dev},
      {:tailwind, "~> 0.5", runtime: Mix.env() == :dev},
      {:heroicons,
       github: "tailwindlabs/heroicons",
       tag: "v2.2.0",
       sparse: "optimized",
       app: false,
       compile: false,
       depth: 1},
      {:daisyui,
       github: "saadeghi/daisyui",
       tag: "v5.5.20",
       sparse: "packages/bundle",
       app: false,
       compile: false,
       depth: 1},
      {:telemetry_metrics, "~> 1.0"},
      {:telemetry_poller, "~> 1.0"},
      {:jason, "~> 1.2"},
      {:dns_cluster, "~> 0.2.0"},
      {:bandit, "~> 1.5"},
      # Engine
      {:nimble_csv, "~> 1.3"},
      {:postgrex, "~> 0.22"},
      {:myxql, "~> 0.9"},
      # Core ecto only (embedded schemas + changesets); no ecto_sql/repos.
      # phoenix_ecto bridges changesets to LiveView forms (FormData).
      {:ecto, "~> 3.14"},
      {:phoenix_ecto, "~> 4.6"},
      # Quality / test tooling
      # Packaging & crash reporting (stage 8). Sentry's HTTP transport is
      # our own tiny :httpc client (Csv2sql.SentryClient) — no hackney.
      {:sentry, "~> 10.1 or ~> 11.0"},
      {:burrito, "~> 1.5"},
      # Quality / test tooling
      {:stream_data, "~> 1.2", only: [:dev, :test]},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "assets.setup", "assets.build"],
      "assets.setup": ["tailwind.install --if-missing", "esbuild.install --if-missing"],
      "assets.build": ["compile", "tailwind csv2sql", "esbuild csv2sql"],
      "assets.deploy": [
        "tailwind csv2sql --minify",
        "esbuild csv2sql --minify",
        "phx.digest"
      ],
      precommit: ["compile --warnings-as-errors", "deps.unlock --unused", "format", "test"]
    ]
  end
end

defmodule Csv2sql.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "3.0.0",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: releases()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Dashboard.Application, []}
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.5.0-rc.2", only: [:dev, :test], runtime: false},
      {:burrito, github: "burrito-elixir/burrito"}
    ]
  end

  def releases do
    [
      # csv2sql_only: [
      #   applications: [csv2sql: :permanent],
      #   steps: [:assemble, &Burrito.wrap/1],
      #   burrito: [
      #     targets: [
      #       macos: [os: :darwin, cpu: :x86_64],
      #       linux: [os: :linux, cpu: :x86_64],
      #       windows: [os: :windows, cpu: :x86_64]
      #     ]
      #   ]
      # ],
      csv2sql_and_dashboard: [
        applications: [
          csv2sql: :permanent,
          dashboard: :permanent
        ],
        steps: [:assemble, &Burrito.wrap/1],
        burrito: [
          targets: [
            macos: [os: :darwin, cpu: :x86_64],
            linux: [os: :linux, cpu: :x86_64],
            windows: [os: :windows, cpu: :x86_64]
          ]
        ]
      ]
    ]
  end
end

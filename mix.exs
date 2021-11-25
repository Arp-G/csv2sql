defmodule Csv2sql.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "2.0.1",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [
        csv2sql_and_dashboard: [
          applications: [
            csv2sql: :permanent,
            dashboard: :permanent
          ]
        ],
        csv2sql_only: [
          applications: [csv2sql: :permanent]
        ]
      ]
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:credo, "~> 1.5.0-rc.2", only: [:dev, :test], runtime: false}
    ]
  end
end

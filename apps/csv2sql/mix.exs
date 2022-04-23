defmodule Csv2sql.MixProject do
  use Mix.Project

  def project do
    [
      app: :csv2sql,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
      # Comment this out to avoid application start before loading config when running the app from escript
      # mod: {Csv2sql.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nimble_csv, "~> 1.2"},
      {:myxql, "~> 0.6.1"},
      {:postgrex, "~> 0.16.2"},
      {:ecto, "~> 3.7"},
      {:ecto_sql, "~> 3.7"},
      {:sizeable, "~> 1.0"},
      {:timex, "~> 3.7"},

      # For dev
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false}
    ]
  end
end

defmodule Csv2sql.MixProject do
  use Mix.Project

  def project do
    [
      app: :csv2sql,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [
        demo: [
          include_executables_for: [:unix],
          applications: [runtime_tools: :permanent]
        ]
      ],
      escript: [main_module: Csv2sql]
    ]
  end

  def escript do
    [main_module: Csv2sql]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      # Comment this out to avoid application start before loading config when running the app from escript
      # mod: {Csv2sql.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nimble_csv, "~> 0.7.0"},
      {:myxql, "~> 0.3.4"},
      {:postgrex, ">= 0.0.0"},
      {:ecto, "~> 3.4"},
      {:ecto_sql, "~> 3.1"},
      {:cli_spinners, "~> 0.1.0"},
      {:sizeable, "~> 1.0"}
    ]
  end
end

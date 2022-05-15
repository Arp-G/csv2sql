defmodule Csv2sql.MixProject do
  use Mix.Project

  def project do
    [
      app: :csv2sql,
      version: "0.1.0",
      elixir: "~> 1.13",
      # directories to find source files
      elixirc_path: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      compilers: [:unused] ++ Mix.compilers(),
      test_coverage: [tool: ExCoveralls]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Csv2sql.Application, []}
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
      {:shorter_maps, "~> 2.2"},
      {:timex, "~> 3.7"},
      {:typed_struct, "~> 0.3.0"},
      {:flow, "~> 1.2"},

      # For dev and/or test
      {:dotenv, github: "avdi/dotenv_elixir", only: [:test]},
      {:benchee, "~> 1.1", only: :dev},
      {:excoveralls, "~> 0.14.4", only: [:dev, :test]},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:mix_unused, "~> 0.3.0", only: [:dev, :test], runtime: false}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp aliases do
    [
      ctest: &custom_test_command/1
    ]
  end

  def custom_test_command(_) do
    # System.shell("source .env.test && MIX_ENV=test mix test --trace --warnings-as-errors --cover", into: IO.stream())
    System.cmd("mix", ["coveralls.html", "--trace", "--warnings-as-errors"],
      env: [{"MIX_ENV", "test"}],
      into: IO.stream()
    )
  end
end

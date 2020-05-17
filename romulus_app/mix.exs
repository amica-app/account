defmodule RomulusApp.Mixfile do
  use Mix.Project

  def project do
    [
      app: :romulus_app,
      version: "1.0.0",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(), # ++ [:phoenix_swagger]
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],

      # Docs
      name: "RomulusApp",
      source_url: "https://github.com/haighis/romulus_app",
      homepage_url: "https://github.com/haighis/romulus_app",
      # The main page in the docs
      docs: [main: "README", extras: ["README.md"]]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {RomulusApp.Application, []}, extra_applications: [:logger, :runtime_tools, :comeonin, :romulus, :que, :httpoison]] # :wobserver :toniq, :phoenix_pubsub
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support", "test/factories"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  # 
  # https://hexdocs.pm/mix/Mix.Tasks.Deps.html
  defp deps do
    [
      {:phoenix, "~> 1.3.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, "~> 0.13.3"},
      {:gettext, "~> 0.11"},
      {:proper_case, "~> 1.0.0"},
      {:cowboy, "~> 1.1"},
      {:plug_cowboy, "~> 1.0.0"},
      {:comeonin, "~> 3.2"},
      {:guardian, "~> 1.0"},
      {:excoveralls, "~> 0.7", only: [:dev, :test]},
      {:credo, "~> 0.8.5", only: [:dev, :test]},
      {:ex_machina, "~> 2.0", only: :test},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:plug, "~> 1.0"},
      {:romulus, path: "../romulus_repo"}, # Local path
    #  {:toniq, "~> 1.2"},
      {:que, "~> 0.10.1"},
      {:poison, "~> 3.1"},
      {:httpoison, "~> 1.6"},
    #  {:wobserver, "~> 0.1"},
      {:corsica, "~> 1.0"} #,
      #{:phoenix_swagger, "~> 0.8"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end

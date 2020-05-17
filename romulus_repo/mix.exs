defmodule Romulus.Mixfile do
  use Mix.Project

  def project do
    [app: :romulus,
     version: "0.1.0",
     elixir: "~> 1.9",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :ecto, :postgrex],
     mod: {Romulus, []}]
  end

  defp deps do
    [
      {:ecto, "~> 2.2"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end

use Mix.Config

config :romulus, :ecto_repos, [Romulus.Repo]

import_config "#{Mix.env}.exs"

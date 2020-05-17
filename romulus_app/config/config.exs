# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
#config :romulus_app, ecto_repos: [Forms.Repo2]
config :romulus, :ecto_repos, [Romulus.Repo]

# config :toniq, redis_url: "redis://localhost:6379/0"
# todo if we want to recover jobs on restart enable below line
# config :mnesia, dir: 'mnesia/#{Mix.env}/#{node()}'

# config :romulus_app, MyApp.Endpoint,
#   pubsub: [adapter: Phoenix.PubSub.PG2,
#            pool_size: 1,
#            name: MyApp.PubSub]

# Configures the endpoint
config :romulus_app, RomulusWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9ueg5YcX8/LKzVUcDrXp5xpYuaBCUfZZAJ3/udC1LCoabotR3O1CJyf/u/6RLJ/N",
  render_errors: [view: RomulusWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: RomulusApp.PubSub, adapter: Phoenix.PubSub.PG2]

# config :romulus_app, :phoenix_swagger,
#   swagger_files: %{
#     "priv/static/swagger.json" => [
#       router: MyAppWeb.Router,     # phoenix routes will be converted to swagger paths
#       endpoint: MyAppWeb.Endpoint  # (optional) endpoint config used to set host, port and https schemes.
#     ]
#   }

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :romulus_app, RomulusWeb.Guardian,
  issuer: "RomulusApp",
  secret_key: "MDLMflIpKod5YCnkdiY7C4E3ki2rgcAAMwfBl0+vyC5uqJNgoibfQmAh7J3uZWVK",
  # optional
  allowed_algos: ["HS256"],
  ttl: {30, :days},
  allowed_drift: 2000,
  verify_issuer: true

# Configure bcrypt for passwords
config :comeonin, :bcrypt_log_rounds, 4

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

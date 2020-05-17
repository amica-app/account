use Mix.Config

config :romulus, Romulus.Repo,[
  adapter: Ecto.Adapters.Postgres,
  database: "todos_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
]

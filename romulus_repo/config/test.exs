use Mix.Config

config :romulus, Romulus.Repo,[
  adapter: Ecto.Adapters.Postgres,
  database: "todos_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
]

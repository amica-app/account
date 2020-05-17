defmodule Romulus do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(Romulus.Repo, []),
    ]

    opts = [strategy: :one_for_one, name: Romulus.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

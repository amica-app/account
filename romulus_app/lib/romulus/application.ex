defmodule RomulusApp.Application do
  @moduledoc false
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      #supervisor(Phoenix.PubSub.PG2, [:pubsub_spike, []]), Correct syntax
    
      # Start the endpoint when the application starts
      supervisor(RomulusWeb.Endpoint, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RomulusApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RomulusWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

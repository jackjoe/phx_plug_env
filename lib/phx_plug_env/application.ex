defmodule PhxPlugEnv.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhxPlugEnvWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhxPlugEnv.PubSub},
      # Start the Endpoint (http/https)
      PhxPlugEnvWeb.Endpoint
      # Start a worker by calling: PhxPlugEnv.Worker.start_link(arg)
      # {PhxPlugEnv.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxPlugEnv.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhxPlugEnvWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

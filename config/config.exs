# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tt8l_gatekeeper,
  ecto_repos: [Tt8lGatekeeper.Repo]

# Configures the endpoint
config :tt8l_gatekeeper, Tt8lGatekeeperWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fG4XQF+WIETFZac/md3jZFd1v9uYhv81SLMNpJWvlewHa6e7+os+Mr8NycZgSF+m",
  render_errors: [view: Tt8lGatekeeperWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Tt8lGatekeeper.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT, # optional
  issuer: "Tt8lGatekeeper",
  ttl: {30, :days},
  allowed_drift: 2000,
  verify_issuer: true, # optional
  secret_key: System.get_env("GUARDIAN_SECRET_KEY"),
  serializer: Tt8lGatekeeper.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

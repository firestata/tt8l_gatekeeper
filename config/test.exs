use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tt8l_gatekeeper, Tt8lGatekeeperWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :tt8l_gatekeeper, Tt8lGatekeeper.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "tt8l_gatekeeper_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

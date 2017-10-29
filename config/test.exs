use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :osm_points, OsmPointsWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :osm_points, OsmPoints.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "osm_points_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

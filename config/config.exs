# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :osm_points, OsmPoints.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "osm_points_repo",
  username: "user",
  password: "pass",
  hostname: "localhost",
  types: OsmPoints.PostgresTypes

# General application configuration
config :osm_points,
  ecto_repos: [OsmPoints.Repo]

# Configures the endpoint
config :osm_points, OsmPointsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IZcTcelxUFg6dvUmcclws9q3UGVp7boUEa58fYuekaqfhUY+ofwYz5M94rFsWNvj",
  render_errors: [view: OsmPointsWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: OsmPoints.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :bugsnag, notify_release_stages: ["dev", "prod"]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

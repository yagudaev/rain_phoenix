# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rain_phoenix,
  ecto_repos: [RainPhoenix.Repo]

# Configures the endpoint
config :rain_phoenix, RainPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7ZUHfBJxaC0ydipUN+HHSBI/L/IQvHaPHdS/PJPMBhtHPh4J3L6NJCTyuY+tIb8d",
  render_errors: [view: RainPhoenixWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: RainPhoenix.PubSub,
  live_view: [signing_salt: "fh5/bdMY"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :scrivener_html,
  routes_helper: RainPhoenix.Router.Helpers,
  view_style: :bootstrap

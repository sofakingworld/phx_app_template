# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :phx_app_template,
  ecto_repos: [PhxAppTemplate.Repo]

# Configures the endpoint
config :phx_app_template, PhxAppTemplateWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KdeSnT8VXd4QUlCusPXSCGW82l5MlKQxn0wtmuKHwL0OZ6qJ4A6tG1vn9ohuMHwp",
  render_errors: [view: PhxAppTemplateWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhxAppTemplate.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:pid, :request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

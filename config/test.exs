use Mix.Config

# Configure your database
config :phx_app_template, PhxAppTemplate.Repo,
  username: "postgres",
  password: "postgres",
  database: "phx_app_template_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phx_app_template, PhxAppTemplateWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

defmodule PhxAppTemplate do
  @moduledoc """
  PhxAppTemplate keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  @version Mix.Project.config()[:version]
  @app_key :phx_app_template
  @app_mode Mix.env()

  def version do
    @version
  end

  def env do
    @app_mode
  end

  def fetch_config(external_key, internal_key) do
    Application.fetch_env!(@app_key, external_key)[internal_key]
  end
end

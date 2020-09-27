defmodule DashboardWeb.Router do
  use DashboardWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {DashboardWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DashboardWeb do
    pipe_through :browser

    live "/", PageLive, :index
    live "/config", ConfigLive, :index
    live "/main", MainLive, :index
    live "/about", AboutLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", DashboardWeb do
  #   pipe_through :api
  # end
end

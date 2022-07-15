defmodule DashboardWeb.PageController do
  use DashboardWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

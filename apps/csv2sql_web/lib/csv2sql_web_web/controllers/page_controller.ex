defmodule Csv2sqlWebWeb.PageController do
  use Csv2sqlWebWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

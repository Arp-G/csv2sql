defmodule Csv2sqlWeb.PageController do
  use Csv2sqlWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end

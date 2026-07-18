defmodule Csv2sqlWeb.ErrorJSONTest do
  use Csv2sqlWeb.ConnCase, async: true

  test "renders 404" do
    assert Csv2sqlWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Csv2sqlWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end

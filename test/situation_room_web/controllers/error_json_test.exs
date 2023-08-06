defmodule SituationRoomWeb.ErrorJSONTest do
  use SituationRoomWeb.ConnCase, async: true

  test "renders 404" do
    assert SituationRoomWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert SituationRoomWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end

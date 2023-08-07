defmodule SituationRoomWeb.ErrorHTMLTest do
  use SituationRoomWeb.ConnCase, async: true

  # Bring render_to_string/4 for testing custom views
  import Phoenix.Template

  test "renders 404.html" do
    assert render_to_string(SituationRoomWeb.ErrorHTML, "404", "html", []) == "Not Found"
  end

  test "renders 500.html" do
    assert render_to_string(SituationRoomWeb.ErrorHTML, "500", "html", []) ==
             "Internal Server Error"
  end
end

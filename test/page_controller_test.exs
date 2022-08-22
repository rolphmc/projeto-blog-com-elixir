defmodule TechChallengeWeb.PageControllerTest do
  use TechChallengeWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "<h1>Welcome to My Blog!</h1>"
  end

end

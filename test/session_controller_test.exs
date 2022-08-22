defmodule TechChallengeWeb.SessionControllerTest do
  use TechChallengeWeb.ConnCase

  test "GET /session/new", %{conn: conn} do
    conn = get(conn, "/session/new")
    assert html_response(conn, 200) =~ "<h1>Enter the challenge</h1>"
  end

end

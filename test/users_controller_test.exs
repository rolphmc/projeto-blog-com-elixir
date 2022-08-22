defmodule TechChallengeWeb.UsersControllerTest do
  use TechChallengeWeb.ConnCase

  test "GET /users/signup", %{conn: conn} do
    conn = get(conn, "/users/signup")
    assert html_response(conn, 200) =~ "<h1>Join the challenge</h1>"
  end

end

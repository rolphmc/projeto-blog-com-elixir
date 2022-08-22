defmodule TechChallengeWeb.SessionController do
  use TechChallengeWeb, :controller

  alias TechChallenge.Users
  alias TechChallengeWeb.Auth

  def create(conn, %{"username" => username, "password" => password}) do
    case Users.authenticate_by_username_and_pass(username, password) do
      {:ok, user} ->
        conn
        |> Auth.login(user)
        |> put_flash(:info, "Thanks for returning!")
        |> redirect(to: Routes.page_path(conn, :index))
      {:error, _reason} ->
        conn
        |> put_flash(:error, "The username and password combination does not match, please try again!")
        |> render("new.html")
    end
  end

  #enter
  def new(conn, _params) do
    render(conn, "new.html")
  end

  def delete(conn, _) do
    conn
    |> Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end

defmodule TechChallengeWeb.UsersController do
  use TechChallengeWeb, :controller

  alias TechChallengeWeb.Auth
  alias TechChallenge.Users
  alias TechChallenge.Users.User

  #join
  def signup(conn, _params) do
    user = User.register_changeset(%User{}, %{})
    render(conn, "signup.html", user: user)
  end

  def register(conn, %{"user" => user_params}) do
    case Users.register_user(user_params) do
      {:ok, user} ->
        conn
        |> Auth.login(user)
        |> put_flash(:info, "#{user.username} username created successfully, thanks for joining the challenge")
        |> redirect(to: Routes.page_path(conn, :index))
      {:error, user_error} ->
        render(conn, "signup.html", user: user_error)
    end
  end

end

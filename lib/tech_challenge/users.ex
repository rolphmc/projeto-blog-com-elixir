defmodule TechChallenge.Users do
  alias TechChallenge.Repo
  alias TechChallenge.Users.User

  def register_user(user_params \\ %{}) do
    %User{}
    |> User.register_changeset(user_params)
    |> Repo.insert()
  end

  def authenticate_by_username_and_pass(username, given_password) do
    user = get_user_by(username: username)
    cond do
      user && Pbkdf2.verify_pass(given_password, user.encrypted_password) ->
        {:ok, user}
      user ->
        {:error, :unauthorized}
      true ->
        Pbkdf2.no_user_verify()
        {:error, :not_found}
    end
  end

  def get_user_by(params) do
    Repo.get_by(User, params)
  end

end

defmodule TechChallengeWeb.Auth do
  import Plug.Conn

  alias TechChallenge.Users

  def init(opts), do: opts

  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)
    user = user_id && Users.get_user_by(id: user_id)
    assign(conn, :current_user, user)
  end

  #session create
  def login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end

  def logout (conn) do
    configure_session(conn, drop: true)
  end
end

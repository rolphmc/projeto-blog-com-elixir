defmodule TechChallengeWeb.CommentsController do
  use TechChallengeWeb, :controller

  alias TechChallenge.Posts

  def create(conn, %{"comment" => comment_params, "posts_id" => post_id}) do
    user = conn.assigns.current_user
    post = Posts.get_post!(post_id)

    case Posts.create_comment(user, post, comment_params) do
      {:ok, _comment} ->
        conn
        |> put_flash(:info, "Comment created successfully.")
        |> redirect(to: Routes.posts_path(conn, :show, post_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

end

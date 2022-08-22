defmodule TechChallengeWeb.PostsController do
  use TechChallengeWeb, :controller

  alias TechChallenge.Posts
  alias TechChallenge.Posts.Post
  alias TechChallenge.Posts.Comment

  plug :load_categories when action in [:new, :edit]

  def new(conn, _params) do
    changeset = Posts.change_post(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    post = Posts.get_post!(id)
    changeset = Posts.change_post(post)
    render(conn, "edit.html", post: post, changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    case Posts.create_post(conn.assigns.current_user, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post #{post.title} created successfully.")
        |> redirect(to: Routes.page_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
      render(conn, "new.html", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "post" => post_params}) do

    post = Posts.get_post!(id)

    case Posts.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post #{post.title} updated successfully.")
        |> redirect(to: Routes.page_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Posts.get_post!(id)
    changeset = Posts.change_comments(%Comment{})

    render(conn, "show.html", post: post, changeset: changeset)
  end

  def delete(conn, %{"id" => id}) do
    {:ok, _post} = Posts.delete_post(Posts.get_post!(id))
      conn
      |> put_flash(:info, "Post deleted successfully.")
      |> redirect(to: Routes.page_path(conn, :index))
  end

  def load_categories(conn, _) do
    assign conn, :categories, Posts.list_alphabetical_categories()
  end

end

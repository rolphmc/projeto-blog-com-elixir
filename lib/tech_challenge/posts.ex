defmodule TechChallenge.Posts do
  import Ecto.Query

  alias TechChallenge.Repo
  alias TechChallenge.Users.User
  alias TechChallenge.Posts.{Post, Category, Comment}

  @moduledoc """
  This is the context responsible for dealing with posts in our application.
  """

  @doc """
  Returns the list of posts.
  We can use this function to display all posts in our blog's home page.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]
  """
  def list_posts() do
    Post
    |> Post.list_all_posts()
    |> Repo.all()
  end

  @doc """
  Gets a single post by its id.
  We can use this function to visualize a post's content.
  """
  def get_post!(id) do
    Post |> Repo.get!(id) |> Repo.preload([[comments: :user], :user])
    |> handle_categories()
  end

  @doc """
  Creates a post.
  We can use this function to create posts.
  """
  def create_post(%User{} = user, attrs) do
    %Post{}
    |> Post.insert_changeset(attrs)
    |> Ecto.Changeset.put_assoc(:user, user)
    |> Repo.insert()
  end

  @doc """
  Updates a post.
  We can use this function to update posts.
  """
  def update_post(%Post{} = post, attrs) do
    post
    |> Post.insert_changeset(attrs)
    |> Repo.update
  end

  @doc """
  Deletes a table.
  We can use this function to delete posts.
  """
  def delete_post(%Post{} = post), do: Repo.delete(post)

  def change_post(%Post{} = post), do: Post.changeset(post, %{})


  #|------------------- Categories

  def create_category(params) do
    %Category{}
    |> Category.insert_changeset(params)
    |> Repo.insert()
  end

  def list_alphabetical_categories do
    Category
    |> alphabetical()
    |> Repo.all()
  end

  #|------------------- comments

  def get_comment!(id) do
    Comment |> Repo.get!(id)
  end

  def create_comment(%User{} = user, %Post{} = post, attrs \\ %{}) do
    %Comment{}
    |> Comment.insert_changeset(attrs)
    |> Ecto.Changeset.put_assoc(:user, user)
    |> Ecto.Changeset.put_assoc(:post, post)
    |> Repo.insert()
  end

  def delete_comment(%Comment{} = comment), do: Repo.delete(comment)

  def update_comment(%Comment{} = comment, attrs) do
    comment
    |> Comment.changeset(attrs)
    |> Repo.update()
  end

  def list_comments(), do: Repo.all(Comment)

  def change_comments(%Comment{} = comment, attrs \\ %{}) do
    Comment.changeset(comment, attrs)
  end

  #|------------------- General

  def alphabetical(query) do
    from c in query, order_by: c.category
  end

  def handle_categories(%Post{} = post) do
    Map.put(post, :categories, ["#{post.category1}", "#{post.category2}"])
  end

end

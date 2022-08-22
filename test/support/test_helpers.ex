defmodule TechChallenge.TestHelpers do

  alias TechChallenge.Users
  alias TechChallenge.Users.User
  alias TechChallenge.Posts
  alias TechChallenge.Posts.Post

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        image: "https://cdn",
        username: "admin",
        email: "admin@admin.com",
        password: attrs[:password] || "supersecret"
      })
      |> Users.register_user()
    user
  end

  def post_fixture(%User{} = user, attrs \\ %{}) do
    attrs =
      Enum.into(attrs, %{
        image: "https://teste.com",
        anonymouns: false,
        description: "Loren ipsun text",
        title: "Build faster websites tests",
        category1: 8,
        category2: 12,
      })
    {:ok, post} = Posts.create_post(user, attrs)
    post
  end

  def comment_fixture(%User{} = user, %Post{} = post, attrs \\ %{}) do
    attrs =
      Enum.into(attrs, %{
        anonymouns: true,
        content: "Per lectus eget ipsum"
      })
    {:ok, comment} = Posts.create_comment(user, post, attrs)
    comment
  end
end

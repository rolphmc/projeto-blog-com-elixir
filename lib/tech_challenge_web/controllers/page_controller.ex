defmodule TechChallengeWeb.PageController do
  use TechChallengeWeb, :controller

  alias TechChallenge.Posts

  def index(conn, _params) do
    posts = Posts.list_posts()
    categories = Posts.list_alphabetical_categories()
    render(conn, "index.html", posts: posts, categories: categories)
  end

end

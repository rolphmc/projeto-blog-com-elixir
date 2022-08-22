defmodule TechChallengeWeb.PostsView do
  use TechChallengeWeb, :view

  def category_select_options(categories) do
    for category <- categories, do: {category.category, category.id}
  end

end

defmodule TechChallengeWeb.PostsView do
  use TechChallengeWeb, :view

  alias TechChallenge.AlchemistMarkdown

  def category_select_options(categories) do
    for category <- categories, do: {category.category, category.id}
  end

  def convert_mkdw(params) do
    AlchemistMarkdown.to_html(params)
  end

end

defmodule TechChallengeWeb.PageView do
  use TechChallengeWeb, :view

  alias TechChallenge.Posts
  alias TechChallenge.AlchemistMarkdown

    def category_name(id) do
      Posts.get_category(id)
    end

    def truncate(text, opts \\ []) do
      max_length  = opts[:max_length] || 230
      omission    = opts[:omission] || "..."

      cond do
        not String.valid?(text) ->
          text
        String.length(text) < max_length ->
          text
        true ->
          length_with_omission = max_length - String.length(omission)

          "#{String.slice(text, 0, length_with_omission)}#{omission}"
      end
    end

    def convert_mkdw(params) do
      AlchemistMarkdown.to_html(params)
    end
end

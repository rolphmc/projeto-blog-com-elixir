defmodule TechChallenge.RegExp do
  def email, do: ~r/^\S+@\S+\.\S+$/

  def slug, do: ~r/\A[a-z|0-9]+\z/

  def slug_message, do: "just chars: a-z, 0-9, -, _"

  def http, do: ~r/^https?:\/\//

  def http_message, do: "Necessary include http(s)://"

  def max_char_40_message, do: "Max. 40 chars"

  def max_char_30_message, do: "Max. 30 chars"
end

defmodule TechChallenge.Posts.Category do
  use Ecto.Schema
  import Ecto.Changeset

  alias TechChallenge.RegExp


  @fields ~w(category)a

  schema "categories" do
    field :category, :string

    timestamps()
  end

  def changeset(category, attrs) do
    category
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end

  def insert_changeset(post, attrs) do
    post
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> unique_constraint(:category)
    |> validate_length(:category, max: 30, message: RegExp.max_char_30_message)
  end
end

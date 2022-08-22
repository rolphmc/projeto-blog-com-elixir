defmodule TechChallenge.Posts.Comment do
  use Ecto.Schema
  import Ecto.Changeset


  alias TechChallenge.Users.User
  alias TechChallenge.Posts.Post

  @fields ~w(anonymouns content)a

  schema "comments" do
    field :anonymouns, :boolean, default: false
    field :content, :string

    #relationships
    belongs_to :user, User
    belongs_to :post, Post

    timestamps()
  end

  def changeset(comment, params \\ %{}) do
    comment
    |> cast(params, @fields)
    |> validate_required(@fields)
  end

  def insert_changeset(comment, params \\ %{}) do
    comment
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end

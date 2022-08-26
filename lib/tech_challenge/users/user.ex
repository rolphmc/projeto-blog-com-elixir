defmodule TechChallenge.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias TechChallenge.Posts.Post
  alias TechChallenge.Posts.Comment

  @fields ~w(username email password)a

  schema "users" do
    field :image, :string
    field :username, :string
    field :email, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true

    #relationships
    has_many :comments, Comment
    has_many :posts, Post

    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, @fields)
    |> validate_required(@fields)
  end

  def register_changeset(user, params \\ %{}) do
    user
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_format(:username, ~r/\A[a-z|0-9]+\z/, message: "just chars: a-z, 0-9, -, _")
    |> validate_length(:username, max: 40, message: "Max. 40 chars")
    |> validate_format(:email, ~r/^\S+@\S+\.\S+$/, message: "email already exist")
    |> unique_constraint(:username, message: "Username already exist")
    |> validate_length(:password, min: 4, message: "Max. 40 chars")
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :encrypted_password, Pbkdf2.hash_pwd_salt(pass))
      _ ->
        changeset
    end
  end

end

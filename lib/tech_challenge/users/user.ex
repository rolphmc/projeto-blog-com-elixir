defmodule TechChallenge.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias TechChallenge.RegExp
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
    |> validate_format(:username, RegExp.slug(), message: RegExp.slug_message)
    |> validate_length(:username, max: 40, message: RegExp.max_char_40_message)
    |> validate_format(:email, RegExp.email(), message: "email already exist") #show error when email is not exclusive
    |> unique_constraint(:username)
    |> validate_length(:password, min: 4)
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

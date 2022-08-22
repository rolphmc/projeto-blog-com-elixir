defmodule TechChallenge.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :image, :string
      add :username, :string, null: false
      add :email, :string, null: false
      add :encrypted_password, :string

      timestamps()
    end
    create unique_index(:users, [:username])
    create unique_index(:users, [:email])
  end
end

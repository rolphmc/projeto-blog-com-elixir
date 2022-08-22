defmodule TechChallenge.Repo.Migrations.Posts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :image, :string
      add :anonymouns, :boolean
      add :description, :text, null: false
      add :title, :string, null: false
      add :category1, :integer
      add :category2, :integer
      add :user_id, references(:users)

      timestamps()
    end

    create unique_index(:posts, [:title])
  end
end

defmodule RainPhoenix.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :size, :string
      add :price, :decimal
      add :description, :text

      timestamps()
    end

  end
end

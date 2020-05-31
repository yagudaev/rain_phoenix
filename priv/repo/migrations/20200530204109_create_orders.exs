defmodule RainPhoenix.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :reference_nubmer, :integer
      add :seller, :string
      add :buyer, :string
      add :status, :string
      add :total, :decimal

      timestamps()
    end

  end
end

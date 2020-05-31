defmodule RainPhoenix.Repo.Migrations.CreateLineItems do
  use Ecto.Migration

  def change do
    create table(:line_items) do
      add :product, :string
      add :size, :string
      add :unit_price, :decimal
      add :quantity, :integer
      add :subtotal, :decimal
      add :order_id, references(:orders, on_delete: :delete_all)

      timestamps()
    end

    create index(:line_items, [:order_id])
  end
end

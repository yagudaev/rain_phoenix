defmodule RainPhoenix.Sales.LineItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "line_items" do
    field :product, :string
    field :quantity, :integer
    field :size, :string
    field :subtotal, :decimal
    field :unit_price, :decimal
    belongs_to :order, RainPhoenix.Sales.Order

    timestamps()
  end

  @doc false
  def changeset(line_item, attrs) do
    line_item
    |> cast(attrs, [:product, :size, :unit_price, :quantity, :subtotal, :order_id])
    |> validate_required([:product, :size, :unit_price, :quantity, :subtotal, :order_id])
  end
end

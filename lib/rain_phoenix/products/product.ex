defmodule RainPhoenix.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :description, :string
    field :name, :string
    field :price, :decimal
    field :size, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :size, :price, :description])
    |> validate_required([:name, :size, :price, :description])
  end
end

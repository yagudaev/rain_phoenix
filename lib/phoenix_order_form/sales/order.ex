defmodule PhoenixOrderForm.Sales.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :buyer, :string
    field :reference_nubmer, :integer
    field :seller, :string
    field :status, :string
    field :total, :decimal

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:reference_nubmer, :seller, :buyer, :status, :total])
    |> validate_required([:reference_nubmer, :seller, :buyer, :status, :total])
  end
end

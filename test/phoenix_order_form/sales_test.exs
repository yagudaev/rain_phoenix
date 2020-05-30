defmodule PhoenixOrderForm.SalesTest do
  use PhoenixOrderForm.DataCase

  alias PhoenixOrderForm.Sales

  describe "orders" do
    alias PhoenixOrderForm.Sales.Order

    @valid_attrs %{buyer: "some buyer", reference_nubmer: 42, seller: "some seller", status: "some status", total: "120.5"}
    @update_attrs %{buyer: "some updated buyer", reference_nubmer: 43, seller: "some updated seller", status: "some updated status", total: "456.7"}
    @invalid_attrs %{buyer: nil, reference_nubmer: nil, seller: nil, status: nil, total: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Sales.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Sales.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Sales.create_order(@valid_attrs)
      assert order.buyer == "some buyer"
      assert order.reference_nubmer == 42
      assert order.seller == "some seller"
      assert order.status == "some status"
      assert order.total == Decimal.new("120.5")
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = Sales.update_order(order, @update_attrs)
      assert order.buyer == "some updated buyer"
      assert order.reference_nubmer == 43
      assert order.seller == "some updated seller"
      assert order.status == "some updated status"
      assert order.total == Decimal.new("456.7")
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_order(order, @invalid_attrs)
      assert order == Sales.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Sales.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Sales.change_order(order)
    end
  end
end

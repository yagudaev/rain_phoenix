defmodule RainPhoenix.SalesTest do
  use RainPhoenix.DataCase

  alias RainPhoenix.Sales

  describe "orders" do
    alias RainPhoenix.Sales.Order

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

  describe "line_items" do
    alias RainPhoenix.Sales.LineItem

    @valid_attrs %{product: "some product", quantity: 42, size: "some size", subtotal: "120.5", unit_price: "120.5"}
    @update_attrs %{product: "some updated product", quantity: 43, size: "some updated size", subtotal: "456.7", unit_price: "456.7"}
    @invalid_attrs %{product: nil, quantity: nil, size: nil, subtotal: nil, unit_price: nil}

    def line_item_fixture(attrs \\ %{}) do
      {:ok, line_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_line_item()

      line_item
    end

    test "list_line_items/0 returns all line_items" do
      line_item = line_item_fixture()
      assert Sales.list_line_items() == [line_item]
    end

    test "get_line_item!/1 returns the line_item with given id" do
      line_item = line_item_fixture()
      assert Sales.get_line_item!(line_item.id) == line_item
    end

    test "create_line_item/1 with valid data creates a line_item" do
      assert {:ok, %LineItem{} = line_item} = Sales.create_line_item(@valid_attrs)
      assert line_item.product == "some product"
      assert line_item.quantity == 42
      assert line_item.size == "some size"
      assert line_item.subtotal == Decimal.new("120.5")
      assert line_item.unit_price == Decimal.new("120.5")
    end

    test "create_line_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_line_item(@invalid_attrs)
    end

    test "update_line_item/2 with valid data updates the line_item" do
      line_item = line_item_fixture()
      assert {:ok, %LineItem{} = line_item} = Sales.update_line_item(line_item, @update_attrs)
      assert line_item.product == "some updated product"
      assert line_item.quantity == 43
      assert line_item.size == "some updated size"
      assert line_item.subtotal == Decimal.new("456.7")
      assert line_item.unit_price == Decimal.new("456.7")
    end

    test "update_line_item/2 with invalid data returns error changeset" do
      line_item = line_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_line_item(line_item, @invalid_attrs)
      assert line_item == Sales.get_line_item!(line_item.id)
    end

    test "delete_line_item/1 deletes the line_item" do
      line_item = line_item_fixture()
      assert {:ok, %LineItem{}} = Sales.delete_line_item(line_item)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_line_item!(line_item.id) end
    end

    test "change_line_item/1 returns a line_item changeset" do
      line_item = line_item_fixture()
      assert %Ecto.Changeset{} = Sales.change_line_item(line_item)
    end
  end
end

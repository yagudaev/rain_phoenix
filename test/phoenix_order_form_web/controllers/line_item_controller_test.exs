defmodule PhoenixOrderFormWeb.LineItemControllerTest do
  use PhoenixOrderFormWeb.ConnCase

  alias PhoenixOrderForm.Sales

  @create_attrs %{product: "some product", quantity: 42, size: "some size", subtotal: "120.5", unit_price: "120.5"}
  @update_attrs %{product: "some updated product", quantity: 43, size: "some updated size", subtotal: "456.7", unit_price: "456.7"}
  @invalid_attrs %{product: nil, quantity: nil, size: nil, subtotal: nil, unit_price: nil}

  def fixture(:line_item) do
    {:ok, line_item} = Sales.create_line_item(@create_attrs)
    line_item
  end

  describe "index" do
    test "lists all line_items", %{conn: conn} do
      conn = get(conn, Routes.line_item_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Line items"
    end
  end

  describe "new line_item" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.line_item_path(conn, :new))
      assert html_response(conn, 200) =~ "New Line item"
    end
  end

  describe "create line_item" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.line_item_path(conn, :create), line_item: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.line_item_path(conn, :show, id)

      conn = get(conn, Routes.line_item_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Line item"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.line_item_path(conn, :create), line_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Line item"
    end
  end

  describe "edit line_item" do
    setup [:create_line_item]

    test "renders form for editing chosen line_item", %{conn: conn, line_item: line_item} do
      conn = get(conn, Routes.line_item_path(conn, :edit, line_item))
      assert html_response(conn, 200) =~ "Edit Line item"
    end
  end

  describe "update line_item" do
    setup [:create_line_item]

    test "redirects when data is valid", %{conn: conn, line_item: line_item} do
      conn = put(conn, Routes.line_item_path(conn, :update, line_item), line_item: @update_attrs)
      assert redirected_to(conn) == Routes.line_item_path(conn, :show, line_item)

      conn = get(conn, Routes.line_item_path(conn, :show, line_item))
      assert html_response(conn, 200) =~ "some updated product"
    end

    test "renders errors when data is invalid", %{conn: conn, line_item: line_item} do
      conn = put(conn, Routes.line_item_path(conn, :update, line_item), line_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Line item"
    end
  end

  describe "delete line_item" do
    setup [:create_line_item]

    test "deletes chosen line_item", %{conn: conn, line_item: line_item} do
      conn = delete(conn, Routes.line_item_path(conn, :delete, line_item))
      assert redirected_to(conn) == Routes.line_item_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.line_item_path(conn, :show, line_item))
      end
    end
  end

  defp create_line_item(_) do
    line_item = fixture(:line_item)
    %{line_item: line_item}
  end
end

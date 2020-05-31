defmodule RainPhoenixWeb.OrderController do
  use RainPhoenixWeb, :controller

  alias RainPhoenix.Sales
  alias RainPhoenix.Sales.Order
  alias RainPhoenix.Sales.LineItem

  def index(conn, _params) do
    orders = Sales.list_orders()
    render(conn, "index.html", orders: orders)
  end

  def new(conn, _params) do
    changeset = Sales.change_order(%Order{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"order" => order_params}) do
    case Sales.create_order(order_params) do
      {:ok, order} ->
        conn
        |> put_flash(:info, "Order created successfully.")
        |> redirect(to: Routes.order_path(conn, :show, order))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id, }) do
    order = Sales.get_order!(id)
    line_item_changeset = LineItem.changeset(%LineItem{}, %{})
    render(conn, "show.html", order: order, line_item_changeset: line_item_changeset)
  end

  def edit(conn, %{"id" => id}) do
    order = Sales.get_order!(id)
    changeset = Sales.change_order(order)
    render(conn, "edit.html", order: order, changeset: changeset)
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = Sales.get_order!(id)

    case Sales.update_order(order, order_params) do
      {:ok, order} ->
        conn
        |> put_flash(:info, "Order updated successfully.")
        |> redirect(to: Routes.order_path(conn, :show, order))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", order: order, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    order = Sales.get_order!(id)
    {:ok, _order} = Sales.delete_order(order)

    conn
    |> put_flash(:info, "Order deleted successfully.")
    |> redirect(to: Routes.order_path(conn, :index))
  end
end

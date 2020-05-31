defmodule PhoenixOrderFormWeb.LineItemController do
  use PhoenixOrderFormWeb, :controller

  alias PhoenixOrderForm.Sales
  alias PhoenixOrderForm.Sales.LineItem

  def index(conn, %{"order_id" => order_id}) do
    order = Sales.get_order!(order_id)
    line_items = Sales.list_line_items(order_id)
    render(conn, "index.html", line_items: line_items, order: order, order_id: order_id)
  end

  def new(conn, %{"order_id" => order_id}) do
    order = Sales.get_order!(order_id)
    changeset = Sales.change_line_item(%LineItem{})
    render(conn, "new.html", changeset: changeset, order: order, order_id: order_id)
  end

  def create(conn, %{"line_item" => line_item_params, "order_id" => order_id}) do
    order = Sales.get_order!(order_id)

    case Sales.create_line_item(order_id, line_item_params) do
      {:ok, _line_item} ->
        conn
        |> put_flash(:info, "Line item created successfully.")
        |> redirect(to: Routes.order_path(conn, :show, order))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, order_id: order_id, order: order)
    end
  end

  def show(conn, %{"id" => id, "order_id" => order_id}) do
    order = Sales.get_order!(order_id)
    line_item = Sales.get_line_item!(id)
    render(conn, "show.html", line_item: line_item, order: order, order_id: order_id)
  end

  def edit(conn, %{"id" => id, "order_id" => order_id}) do
    order = Sales.get_order!(order_id)
    line_item = Sales.get_line_item!(id)
    changeset = Sales.change_line_item(line_item)
    render(conn, "edit.html", line_item: line_item, changeset: changeset, order: order, order_id: order_id)
  end

  def update(conn, %{"id" => id, "line_item" => line_item_params, "order_id" => order_id}) do
    order = Sales.get_order!(order_id)
    line_item = Sales.get_line_item!(id)

    case Sales.update_line_item(line_item, line_item_params) do
      {:ok, _line_item} ->
        conn
        |> put_flash(:info, "Line item updated successfully.")
        |> redirect(to: Routes.order_path(conn, :show, order))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", line_item: line_item, changeset: changeset, order: order, order_id: order_id)
    end
  end

  def delete(conn, %{"id" => id, "order_id" => order_id}) do
    order = Sales.get_order!(order_id)
    line_item = Sales.get_line_item!(id)
    {:ok, _line_item} = Sales.delete_line_item(line_item)

    conn
    |> put_flash(:info, "Line item deleted successfully.")
    |> redirect(to: Routes.order_path(conn, :show, order))
  end
end

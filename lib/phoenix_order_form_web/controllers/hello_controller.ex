defmodule PhoenixOrderFormWeb.HelloController do
  use PhoenixOrderFormWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end

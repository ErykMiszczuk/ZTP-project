defmodule HelloWeb.StockController do
  use HelloWeb, :controller

  alias Hello.Shop
  alias Hello.Shop.Stock

  action_fallback HelloWeb.FallbackController

  def index(conn, _params) do
    stock = Shop.list_stock()
    render(conn, "index.json", stock: stock)
  end

  def create(conn, %{"stock" => stock_params}) do
    with {:ok, %Stock{} = stock} <- Shop.create_stock(stock_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.stock_path(conn, :show, stock))
      |> render("show.json", stock: stock)
    end
  end

  def show(conn, %{"id" => id}) do
    stock = Shop.get_stock!(id)
    render(conn, "show.json", stock: stock)
  end

  def update(conn, %{"id" => id, "stock" => stock_params}) do
    stock = Shop.get_stock!(id)

    with {:ok, %Stock{} = stock} <- Shop.update_stock(stock, stock_params) do
      render(conn, "show.json", stock: stock)
    end
  end

  def delete(conn, %{"id" => id}) do
    stock = Shop.get_stock!(id)

    with {:ok, %Stock{}} <- Shop.delete_stock(stock) do
      send_resp(conn, :no_content, "")
    end
  end
end

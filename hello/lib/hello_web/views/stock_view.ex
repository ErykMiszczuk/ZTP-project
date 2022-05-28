defmodule HelloWeb.StockView do
  use HelloWeb, :view
  alias HelloWeb.StockView

  def render("index.json", %{stock: stock}) do
    %{data: render_many(stock, StockView, "stock.json")}
  end

  def render("show.json", %{stock: stock}) do
    %{data: render_one(stock, StockView, "stock.json")}
  end

  def render("stock.json", %{stock: stock}) do
    %{
      id: stock.id,
      name: stock.name,
      dateShipped: stock.dateShipped,
      dateSelled: stock.dateSelled
    }
  end
end

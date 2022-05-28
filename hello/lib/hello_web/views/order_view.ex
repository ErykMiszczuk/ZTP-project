defmodule HelloWeb.OrderView do
  use HelloWeb, :view
  alias HelloWeb.OrderView

  def render("index.json", %{order: order}) do
    %{data: render_many(order, OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{
      id: order.id,
      dateCreated: order.dateCreated,
      dateFinished: order.dateFinished,
      amount: order.amount,
      discount: order.discount
    }
  end
end

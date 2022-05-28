defmodule HelloWeb.ItemView do
  use HelloWeb, :view
  alias HelloWeb.ItemView

  def render("index.json", %{items: items}) do
    %{data: render_many(items, ItemView, "item.json")}
  end

  def render("show.json", %{item: item}) do
    %{data: render_one(item, ItemView, "item.json")}
  end

  def render("item.json", %{item: item}) do
    %{
      id: item.id,
      name: item.name,
      price: item.price,
      discount: item.discount,
      images: item.images,
      description: item.description,
      size: item.size,
      color: item.color
    }
  end
end

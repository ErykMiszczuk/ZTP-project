defmodule Hello.Shop.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :color, :string
    field :description, :string
    field :discount, :decimal
    field :images, {:array, :string}
    field :name, :string
    field :price, :decimal
    field :size, :decimal

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :price, :discount, :images, :description, :size, :color])
    |> validate_required([:name, :price, :discount, :images, :description, :size, :color])
  end
end

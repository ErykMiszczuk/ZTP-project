defmodule Hello.Shop.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :amount, :decimal
    field :dateCreated, :naive_datetime
    field :dateFinished, :naive_datetime
    field :discount, :decimal
    has_many :items, Hello.Shop.Item
    belongs_to :customer, Hello.Shop.Customer


    timestamps()
  end

  @doc false
  def changeset(order, attrs \\ :{}) do
    order
    |> cast(attrs, [:dateCreated, :dateFinished, :amount, :discount])
    |> validate_required([:dateCreated, :dateFinished, :amount, :discount])
  end
end

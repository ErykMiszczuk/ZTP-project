defmodule Hello.Shop.Stock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stock" do
    field :dateSelled, :naive_datetime
    field :dateShipped, :naive_datetime
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(stock, attrs) do
    stock
    |> cast(attrs, [:name, :dateShipped, :dateSelled])
    |> validate_required([:name, :dateShipped, :dateSelled])
  end
end

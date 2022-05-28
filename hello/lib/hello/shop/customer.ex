defmodule Hello.Shop.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customer" do
    field :city, :string
    field :email, :string
    field :firstName, :string
    field :lastName, :string
    field :password, :string
    field :phoneNumber, :string
    field :postCode, :string
    field :state, :string
    field :street, :string
    field :orders, :id

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:firstName, :lastName, :city, :state, :phoneNumber, :email, :street, :postCode, :password])
    |> validate_required([:firstName, :lastName, :city, :state, :phoneNumber, :email, :street, :postCode, :password])
  end
end

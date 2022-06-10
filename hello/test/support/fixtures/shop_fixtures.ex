defmodule Hello.ShopFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Hello.Shop` context.
  """

  @doc """
  Generate a customer.
  """
  def customer_fixture(attrs \\ %{}) do
    {:ok, customer} =
      attrs
      |> Enum.into(%{
        city: "some city",
        email: "some email",
        firstName: "some firstName",
        lastName: "some lastName",
        password: "some password",
        phoneNumber: "some phoneNumber",
        postCode: "some postCode",
        state: "some state",
        street: "some street"
      })
      |> Hello.Shop.create_customer()

    customer
  end

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        color: "some color",
        description: "some description",
        discount: "120.5",
        images: [],
        name: "some name",
        price: "120.5",
        size: "120.5"
      })
      |> Hello.Shop.create_item()

    item
  end

  @doc """
  Generate a order.
  """
  def order_fixture(attrs \\ %{}) do
    {:ok, order} =
      attrs
      |> Enum.into(%{
        amount: "120.5",
        dateCreated: ~N[2022-06-04 17:59:00],
        dateFinished: ~N[2022-06-04 17:59:00],
        discount: "120.5"
      })
      |> Hello.Shop.create_order()

    order
  end

  @doc """
  Generate a stock.
  """
  def stock_fixture(attrs \\ %{}) do
    {:ok, stock} =
      attrs
      |> Enum.into(%{
        dateSelled: ~N[2022-06-04 19:36:00],
        dateShipped: ~N[2022-06-04 19:36:00],
        name: "some name"
      })
      |> Hello.Shop.create_stock()

    stock
  end
end

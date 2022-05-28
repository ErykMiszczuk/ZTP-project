defmodule Hello.ShopTest do
  use Hello.DataCase

  alias Hello.Shop

  describe "items" do
    alias Hello.Shop.Item

    import Hello.ShopFixtures

    @invalid_attrs %{color: nil, description: nil, discount: nil, id: nil, images: nil, name: nil, price: nil, size: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Shop.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Shop.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{color: "some color", description: "some description", discount: "120.5", id: 42, images: [], name: "some name", price: "120.5", size: %{}}

      assert {:ok, %Item{} = item} = Shop.create_item(valid_attrs)
      assert item.color == "some color"
      assert item.description == "some description"
      assert item.discount == Decimal.new("120.5")
      assert item.id == 42
      assert item.images == []
      assert item.name == "some name"
      assert item.price == Decimal.new("120.5")
      assert item.size == %{}
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shop.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{color: "some updated color", description: "some updated description", discount: "456.7", id: 43, images: [], name: "some updated name", price: "456.7", size: %{}}

      assert {:ok, %Item{} = item} = Shop.update_item(item, update_attrs)
      assert item.color == "some updated color"
      assert item.description == "some updated description"
      assert item.discount == Decimal.new("456.7")
      assert item.id == 43
      assert item.images == []
      assert item.name == "some updated name"
      assert item.price == Decimal.new("456.7")
      assert item.size == %{}
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Shop.update_item(item, @invalid_attrs)
      assert item == Shop.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Shop.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Shop.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Shop.change_item(item)
    end
  end

  describe "items" do
    alias Hello.Shop.Item

    import Hello.ShopFixtures

    @invalid_attrs %{color: nil, description: nil, discount: nil, images: nil, name: nil, price: nil, size: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Shop.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Shop.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{color: "some color", description: "some description", discount: "120.5", images: [], name: "some name", price: "120.5", size: %{}}

      assert {:ok, %Item{} = item} = Shop.create_item(valid_attrs)
      assert item.color == "some color"
      assert item.description == "some description"
      assert item.discount == Decimal.new("120.5")
      assert item.images == []
      assert item.name == "some name"
      assert item.price == Decimal.new("120.5")
      assert item.size == %{}
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shop.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{color: "some updated color", description: "some updated description", discount: "456.7", images: [], name: "some updated name", price: "456.7", size: %{}}

      assert {:ok, %Item{} = item} = Shop.update_item(item, update_attrs)
      assert item.color == "some updated color"
      assert item.description == "some updated description"
      assert item.discount == Decimal.new("456.7")
      assert item.images == []
      assert item.name == "some updated name"
      assert item.price == Decimal.new("456.7")
      assert item.size == %{}
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Shop.update_item(item, @invalid_attrs)
      assert item == Shop.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Shop.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Shop.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Shop.change_item(item)
    end
  end

  describe "order" do
    alias Hello.Shop.Order

    import Hello.ShopFixtures

    @invalid_attrs %{amount: nil, dateCreated: nil, dateFinished: nil, discount: nil}

    test "list_order/0 returns all order" do
      order = order_fixture()
      assert Shop.list_order() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Shop.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      valid_attrs = %{amount: "120.5", dateCreated: ~N[2022-05-26 20:16:00], dateFinished: ~N[2022-05-26 20:16:00], discount: "120.5"}

      assert {:ok, %Order{} = order} = Shop.create_order(valid_attrs)
      assert order.amount == Decimal.new("120.5")
      assert order.dateCreated == ~N[2022-05-26 20:16:00]
      assert order.dateFinished == ~N[2022-05-26 20:16:00]
      assert order.discount == Decimal.new("120.5")
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shop.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      update_attrs = %{amount: "456.7", dateCreated: ~N[2022-05-27 20:16:00], dateFinished: ~N[2022-05-27 20:16:00], discount: "456.7"}

      assert {:ok, %Order{} = order} = Shop.update_order(order, update_attrs)
      assert order.amount == Decimal.new("456.7")
      assert order.dateCreated == ~N[2022-05-27 20:16:00]
      assert order.dateFinished == ~N[2022-05-27 20:16:00]
      assert order.discount == Decimal.new("456.7")
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Shop.update_order(order, @invalid_attrs)
      assert order == Shop.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Shop.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Shop.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Shop.change_order(order)
    end
  end

  describe "customer" do
    alias Hello.Shop.Customer

    import Hello.ShopFixtures

    @invalid_attrs %{city: nil, email: nil, firstName: nil, lastName: nil, password: nil, phoneNumber: nil, postCode: nil, state: nil, street: nil}

    test "list_customer/0 returns all customer" do
      customer = customer_fixture()
      assert Shop.list_customer() == [customer]
    end

    test "get_customer!/1 returns the customer with given id" do
      customer = customer_fixture()
      assert Shop.get_customer!(customer.id) == customer
    end

    test "create_customer/1 with valid data creates a customer" do
      valid_attrs = %{city: "some city", email: "some email", firstName: "some firstName", lastName: "some lastName", password: "some password", phoneNumber: "some phoneNumber", postCode: "some postCode", state: "some state", street: "some street"}

      assert {:ok, %Customer{} = customer} = Shop.create_customer(valid_attrs)
      assert customer.city == "some city"
      assert customer.email == "some email"
      assert customer.firstName == "some firstName"
      assert customer.lastName == "some lastName"
      assert customer.password == "some password"
      assert customer.phoneNumber == "some phoneNumber"
      assert customer.postCode == "some postCode"
      assert customer.state == "some state"
      assert customer.street == "some street"
    end

    test "create_customer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shop.create_customer(@invalid_attrs)
    end

    test "update_customer/2 with valid data updates the customer" do
      customer = customer_fixture()
      update_attrs = %{city: "some updated city", email: "some updated email", firstName: "some updated firstName", lastName: "some updated lastName", password: "some updated password", phoneNumber: "some updated phoneNumber", postCode: "some updated postCode", state: "some updated state", street: "some updated street"}

      assert {:ok, %Customer{} = customer} = Shop.update_customer(customer, update_attrs)
      assert customer.city == "some updated city"
      assert customer.email == "some updated email"
      assert customer.firstName == "some updated firstName"
      assert customer.lastName == "some updated lastName"
      assert customer.password == "some updated password"
      assert customer.phoneNumber == "some updated phoneNumber"
      assert customer.postCode == "some updated postCode"
      assert customer.state == "some updated state"
      assert customer.street == "some updated street"
    end

    test "update_customer/2 with invalid data returns error changeset" do
      customer = customer_fixture()
      assert {:error, %Ecto.Changeset{}} = Shop.update_customer(customer, @invalid_attrs)
      assert customer == Shop.get_customer!(customer.id)
    end

    test "delete_customer/1 deletes the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{}} = Shop.delete_customer(customer)
      assert_raise Ecto.NoResultsError, fn -> Shop.get_customer!(customer.id) end
    end

    test "change_customer/1 returns a customer changeset" do
      customer = customer_fixture()
      assert %Ecto.Changeset{} = Shop.change_customer(customer)
    end
  end

  describe "stock" do
    alias Hello.Shop.Stock

    import Hello.ShopFixtures

    @invalid_attrs %{dateSelled: nil, dateShipped: nil, name: nil}

    test "list_stock/0 returns all stock" do
      stock = stock_fixture()
      assert Shop.list_stock() == [stock]
    end

    test "get_stock!/1 returns the stock with given id" do
      stock = stock_fixture()
      assert Shop.get_stock!(stock.id) == stock
    end

    test "create_stock/1 with valid data creates a stock" do
      valid_attrs = %{dateSelled: ~N[2022-05-26 20:26:00], dateShipped: ~N[2022-05-26 20:26:00], name: "some name"}

      assert {:ok, %Stock{} = stock} = Shop.create_stock(valid_attrs)
      assert stock.dateSelled == ~N[2022-05-26 20:26:00]
      assert stock.dateShipped == ~N[2022-05-26 20:26:00]
      assert stock.name == "some name"
    end

    test "create_stock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shop.create_stock(@invalid_attrs)
    end

    test "update_stock/2 with valid data updates the stock" do
      stock = stock_fixture()
      update_attrs = %{dateSelled: ~N[2022-05-27 20:26:00], dateShipped: ~N[2022-05-27 20:26:00], name: "some updated name"}

      assert {:ok, %Stock{} = stock} = Shop.update_stock(stock, update_attrs)
      assert stock.dateSelled == ~N[2022-05-27 20:26:00]
      assert stock.dateShipped == ~N[2022-05-27 20:26:00]
      assert stock.name == "some updated name"
    end

    test "update_stock/2 with invalid data returns error changeset" do
      stock = stock_fixture()
      assert {:error, %Ecto.Changeset{}} = Shop.update_stock(stock, @invalid_attrs)
      assert stock == Shop.get_stock!(stock.id)
    end

    test "delete_stock/1 deletes the stock" do
      stock = stock_fixture()
      assert {:ok, %Stock{}} = Shop.delete_stock(stock)
      assert_raise Ecto.NoResultsError, fn -> Shop.get_stock!(stock.id) end
    end

    test "change_stock/1 returns a stock changeset" do
      stock = stock_fixture()
      assert %Ecto.Changeset{} = Shop.change_stock(stock)
    end
  end

  describe "order" do
    alias Hello.Shop.Order

    import Hello.ShopFixtures

    @invalid_attrs %{amount: nil, dateCreated: nil, dateFinished: nil, discount: nil}

    test "list_order/0 returns all order" do
      order = order_fixture()
      assert Shop.list_order() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Shop.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      valid_attrs = %{amount: "120.5", dateCreated: ~N[2022-05-26 20:31:00], dateFinished: ~N[2022-05-26 20:31:00], discount: "120.5"}

      assert {:ok, %Order{} = order} = Shop.create_order(valid_attrs)
      assert order.amount == Decimal.new("120.5")
      assert order.dateCreated == ~N[2022-05-26 20:31:00]
      assert order.dateFinished == ~N[2022-05-26 20:31:00]
      assert order.discount == Decimal.new("120.5")
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shop.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      update_attrs = %{amount: "456.7", dateCreated: ~N[2022-05-27 20:31:00], dateFinished: ~N[2022-05-27 20:31:00], discount: "456.7"}

      assert {:ok, %Order{} = order} = Shop.update_order(order, update_attrs)
      assert order.amount == Decimal.new("456.7")
      assert order.dateCreated == ~N[2022-05-27 20:31:00]
      assert order.dateFinished == ~N[2022-05-27 20:31:00]
      assert order.discount == Decimal.new("456.7")
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Shop.update_order(order, @invalid_attrs)
      assert order == Shop.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Shop.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Shop.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Shop.change_order(order)
    end
  end
end

defmodule HelloWeb.CustomerControllerTest do
  use HelloWeb.ConnCase

  import Hello.ShopFixtures

  alias Hello.Shop.Customer

  @create_attrs %{
    city: "some city",
    email: "some email",
    firstName: "some firstName",
    lastName: "some lastName",
    password: "some password",
    phoneNumber: "some phoneNumber",
    postCode: "some postCode",
    state: "some state",
    street: "some street"
  }
  @update_attrs %{
    city: "some updated city",
    email: "some updated email",
    firstName: "some updated firstName",
    lastName: "some updated lastName",
    password: "some updated password",
    phoneNumber: "some updated phoneNumber",
    postCode: "some updated postCode",
    state: "some updated state",
    street: "some updated street"
  }
  @invalid_attrs %{city: nil, email: nil, firstName: nil, lastName: nil, password: nil, phoneNumber: nil, postCode: nil, state: nil, street: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all customers", %{conn: conn} do
      conn = get(conn, Routes.customer_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create customer" do
    test "renders customer when data is valid", %{conn: conn} do
      conn = post(conn, Routes.customer_path(conn, :create), customer: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.customer_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "city" => "some city",
               "email" => "some email",
               "firstName" => "some firstName",
               "lastName" => "some lastName",
               "password" => "some password",
               "phoneNumber" => "some phoneNumber",
               "postCode" => "some postCode",
               "state" => "some state",
               "street" => "some street"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.customer_path(conn, :create), customer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update customer" do
    setup [:create_customer]

    test "renders customer when data is valid", %{conn: conn, customer: %Customer{id: id} = customer} do
      conn = put(conn, Routes.customer_path(conn, :update, customer), customer: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.customer_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "city" => "some updated city",
               "email" => "some updated email",
               "firstName" => "some updated firstName",
               "lastName" => "some updated lastName",
               "password" => "some updated password",
               "phoneNumber" => "some updated phoneNumber",
               "postCode" => "some updated postCode",
               "state" => "some updated state",
               "street" => "some updated street"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, customer: customer} do
      conn = put(conn, Routes.customer_path(conn, :update, customer), customer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete customer" do
    setup [:create_customer]

    test "deletes chosen customer", %{conn: conn, customer: customer} do
      conn = delete(conn, Routes.customer_path(conn, :delete, customer))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.customer_path(conn, :show, customer))
      end
    end
  end

  defp create_customer(_) do
    customer = customer_fixture()
    %{customer: customer}
  end
end

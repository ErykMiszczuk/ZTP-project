defmodule HelloWeb.ItemControllerTest do
  use HelloWeb.ConnCase

  import Hello.ShopFixtures

  alias Hello.Shop.Item

  @create_attrs %{
    color: "some color",
    description: "some description",
    discount: "120.5",
    images: [],
    name: "some name",
    price: "120.5",
    size: "120.5"
  }
  @update_attrs %{
    color: "some updated color",
    description: "some updated description",
    discount: "456.7",
    images: [],
    name: "some updated name",
    price: "456.7",
    size: "456.7"
  }
  @invalid_attrs %{color: nil, description: nil, discount: nil, images: nil, name: nil, price: nil, size: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all items", %{conn: conn} do
      conn = get(conn, Routes.item_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create item" do
    test "renders item when data is valid", %{conn: conn} do
      conn = post(conn, Routes.item_path(conn, :create), item: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.item_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "color" => "some color",
               "description" => "some description",
               "discount" => "120.5",
               "images" => [],
               "name" => "some name",
               "price" => "120.5",
               "size" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.item_path(conn, :create), item: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update item" do
    setup [:create_item]

    test "renders item when data is valid", %{conn: conn, item: %Item{id: id} = item} do
      conn = put(conn, Routes.item_path(conn, :update, item), item: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.item_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "color" => "some updated color",
               "description" => "some updated description",
               "discount" => "456.7",
               "images" => [],
               "name" => "some updated name",
               "price" => "456.7",
               "size" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, item: item} do
      conn = put(conn, Routes.item_path(conn, :update, item), item: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete item" do
    setup [:create_item]

    test "deletes chosen item", %{conn: conn, item: item} do
      conn = delete(conn, Routes.item_path(conn, :delete, item))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.item_path(conn, :show, item))
      end
    end
  end

  defp create_item(_) do
    item = item_fixture()
    %{item: item}
  end
end

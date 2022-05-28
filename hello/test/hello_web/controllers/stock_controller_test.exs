defmodule HelloWeb.StockControllerTest do
  use HelloWeb.ConnCase

  import Hello.ShopFixtures

  alias Hello.Shop.Stock

  @create_attrs %{
    dateSelled: ~N[2022-05-26 20:26:00],
    dateShipped: ~N[2022-05-26 20:26:00],
    name: "some name"
  }
  @update_attrs %{
    dateSelled: ~N[2022-05-27 20:26:00],
    dateShipped: ~N[2022-05-27 20:26:00],
    name: "some updated name"
  }
  @invalid_attrs %{dateSelled: nil, dateShipped: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all stock", %{conn: conn} do
      conn = get(conn, Routes.stock_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create stock" do
    test "renders stock when data is valid", %{conn: conn} do
      conn = post(conn, Routes.stock_path(conn, :create), stock: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.stock_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "dateSelled" => "2022-05-26T20:26:00",
               "dateShipped" => "2022-05-26T20:26:00",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.stock_path(conn, :create), stock: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update stock" do
    setup [:create_stock]

    test "renders stock when data is valid", %{conn: conn, stock: %Stock{id: id} = stock} do
      conn = put(conn, Routes.stock_path(conn, :update, stock), stock: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.stock_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "dateSelled" => "2022-05-27T20:26:00",
               "dateShipped" => "2022-05-27T20:26:00",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, stock: stock} do
      conn = put(conn, Routes.stock_path(conn, :update, stock), stock: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete stock" do
    setup [:create_stock]

    test "deletes chosen stock", %{conn: conn, stock: stock} do
      conn = delete(conn, Routes.stock_path(conn, :delete, stock))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.stock_path(conn, :show, stock))
      end
    end
  end

  defp create_stock(_) do
    stock = stock_fixture()
    %{stock: stock}
  end
end

defmodule HelloWeb.CustomerView do
  use HelloWeb, :view
  alias HelloWeb.CustomerView

  def render("index.json", %{customer: customer}) do
    %{data: render_many(customer, CustomerView, "customer.json")}
  end

  def render("show.json", %{customer: customer}) do
    %{data: render_one(customer, CustomerView, "customer.json")}
  end

  def render("customer.json", %{customer: customer}) do
    %{
      id: customer.id,
      firstName: customer.firstName,
      lastName: customer.lastName,
      city: customer.city,
      state: customer.state,
      phoneNumber: customer.phoneNumber,
      email: customer.email,
      street: customer.street,
      postCode: customer.postCode,
      password: customer.password
    }
  end
end

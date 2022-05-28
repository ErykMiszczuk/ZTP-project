defmodule Hello.Repo.Migrations.CreateCustomer do
  use Ecto.Migration

  def change do
    create table(:customer) do
      add :firstName, :string
      add :lastName, :string
      add :city, :string
      add :state, :string
      add :phoneNumber, :string
      add :email, :string
      add :street, :string
      add :postCode, :string
      add :password, :string

      timestamps()
    end
  end
end

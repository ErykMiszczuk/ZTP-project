defmodule Hello.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :firstName, :string
      add :lastName, :string
      add :city, :string
      add :state, :string
      add :phoneNumber, :string
      add :email, :string
      add :street, :string
      add :postCode, :string
      add :password, :string
      add :orders, references(:orders, on_delete: :nothing)

      timestamps()
    end

    create index(:customers, [:orders])
  end
end

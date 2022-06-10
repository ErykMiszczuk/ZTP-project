defmodule Hello.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :dateCreated, :naive_datetime
      add :dateFinished, :naive_datetime
      add :amount, :decimal
      add :discount, :decimal
      add :items, references(:items, on_delete: :nothing)

      timestamps()
    end

    create index(:orders, [:items])
  end
end

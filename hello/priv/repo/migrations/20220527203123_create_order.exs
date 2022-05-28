defmodule Hello.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:order) do
      add :dateCreated, :naive_datetime
      add :dateFinished, :naive_datetime
      add :amount, :decimal
      add :discount, :decimal
      add :item_id, references(:items, on_delete: :nothing)

      timestamps()
    end

    create index(:order, [:item_id])
  end
end

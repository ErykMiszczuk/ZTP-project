defmodule Hello.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:order) do
      add :dateCreated, :naive_datetime
      add :dateFinished, :naive_datetime
      add :amount, :decimal
      add :discount, :decimal

      timestamps()
    end
  end
end

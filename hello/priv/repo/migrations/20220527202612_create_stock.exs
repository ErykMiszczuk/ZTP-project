defmodule Hello.Repo.Migrations.CreateStock do
  use Ecto.Migration

  def change do
    create table(:stock) do
      add :name, :string
      add :dateShipped, :naive_datetime
      add :dateSelled, :naive_datetime

      timestamps()
    end
  end
end

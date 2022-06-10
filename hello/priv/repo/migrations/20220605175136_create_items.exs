defmodule Hello.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :price, :decimal
      add :discount, :decimal
      add :images, {:array, :string}
      add :description, :text
      add :size, :decimal
      add :color, :string

      timestamps()
    end
  end
end

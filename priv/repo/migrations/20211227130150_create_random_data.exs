defmodule StreamPractice.Repo.Migrations.CreateRandomData do
  use Ecto.Migration

  def change do
    create table(:random_data) do
      add :data, :map
      timestamps()
    end
  end
end

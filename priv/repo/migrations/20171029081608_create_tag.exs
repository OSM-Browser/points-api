defmodule OsmPoints.Repo.Migrations.CreateTag do
  use Ecto.Migration

  def change do
    create table(:tags, primary_key: false) do
      add :point_id, references(:points), primary_key: true
      add :key, :string, primary_key: true
      add :value, :string, null: false
    end
  end
end

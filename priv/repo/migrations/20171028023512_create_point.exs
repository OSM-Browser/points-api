defmodule OsmPoints.Repo.Migrations.CreatePoint do
  use Ecto.Migration

  def change do
    execute("create type point_type as enum ('amenity', 'shop')")

    create table(:points) do
      add :location, :geometry, null: false
      add :type, :point_type, null: false
      add :subtype, :string, null: false
      add :name, :string
      add :email, :string
      add :phone, :string
      add :website, :string
      add :opening_hours, :string
      add :operator, :string
    end
  end
end

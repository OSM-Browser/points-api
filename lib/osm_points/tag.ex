defmodule OsmPoints.Tag do
  @derive {Poison.Encoder, only: [:key, :value]}

  use Ecto.Schema
  import Ecto.Changeset
  alias OsmPoints.Tag

  @primary_key false
  schema "tags" do
    belongs_to :point, OsmPoints.Point, primary_key: true
    field :key, :string, primary_key: true
    field :value, :string
  end

  @doc false
  def changeset(%Tag{} = point, attrs) do
    point
    |> cast(attrs, [])
    |> validate_required([])
  end
end

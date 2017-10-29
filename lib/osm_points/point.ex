defmodule OsmPoints.Point do
  @derive {Poison.Encoder, only: [:id, :location, :type, :subtype, :name, :email, :phone, :website, :opening_hours, :operator, :tags]}

  use Ecto.Schema
  import Ecto.Changeset
  alias OsmPoints.Point

  schema "points" do
    field :location, Geo.Geometry
    field :type, :string
    field :subtype, :string
    field :name, :string
    field :email, :string
    field :phone, :string
    field :website, :string
    field :opening_hours, :string
    field :operator, :string
    has_many :tags, OsmPoints.Tag
  end

  @doc false
  def changeset(%Point{} = point, attrs) do
    point
    |> cast(attrs, [])
    |> validate_required([])
  end
end

defmodule OsmPointsWeb.Schema.PointType do
  use Absinthe.Schema.Notation

  object :point do
    field :id, :id
    field :name, :string
    field :location, :coordinates
    field :type, :string
    field :subtype, :string
    field :email, :string
    field :phone, :string
    field :website, :string
    field :opening_hours, :string
    field :operator, :string
  end
end

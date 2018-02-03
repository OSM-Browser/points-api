defmodule OsmPointsWeb.Schema do
  use Absinthe.Schema
  use ApolloTracing

  import_types OsmPointsWeb.Schema.PointType
  import_types OsmPointsWeb.Schema.CoordinatesType

  alias OsmPointsWeb.Resolvers

  query do
    @desc "Get points"
    field :points, list_of(:point) do
      resolve &Resolvers.Point.list_points/3
    end
  end
end

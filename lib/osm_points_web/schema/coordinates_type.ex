defmodule OsmPointsWeb.Schema.CoordinatesType do
  use Absinthe.Schema.Notation

  @desc """
  The `Coordinates` scalar type represents a geographical location.
  """
  scalar :coordinates do
    serialize fn(coordinates) -> coordinates end
    parse fn(coordinates) -> coordinates end
  end
end

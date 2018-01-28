defmodule OsmPointsWeb.Resolvers.Point do
  import Ecto.Query

  def list_points(_parent, _args, _resolution) do
    {:ok, OsmPoints.Point |> limit(10) |> OsmPoints.Repo.all}
  end
end

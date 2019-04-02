defmodule OsmPointsWeb.PointController do
  use OsmPointsWeb, :controller
  import Ecto.Query
  import Geo.PostGIS

  def index(conn, params) do
    points = OsmPoints.Point
      |> preload(:tags)
      |> filter_by_bbox(params)
      |> filter_by_query(params)
      |> filter_by_type(params)
      |> filter_by_subtype(params)
      |> limit(100)
      |> OsmPoints.Repo.all

    json conn, points
  end

  defp filter_by_bbox(query, params) do
    params["bbox"]
    |> case do
      nil  -> query
      ""   -> query
      text -> query |> where([p], st_intersects(p.location, ^to_polygon(text)))
    end
  end

  defp filter_by_query(query, params) do
    params["query"]
    |> case do
      nil  -> query
      ""   -> query
      text -> query |> where([p], fragment("name_tokens @@ to_tsquery(?)", ^text))
    end
  end

  defp filter_by_type(query, params) do
    params["type"]
    |> case do
      nil  -> query
      ""   -> query
      text -> query |> where([p], p.type == ^text)
    end
  end

  defp filter_by_subtype(query, params) do
    params["subtype"]
    |> case do
      nil  -> query
      ""   -> query
      text -> query |> where([p], p.subtype == ^text)
    end
  end

  defp to_polygon(text) do
    [minX, minY, maxX, maxY] = text |> String.split(",")

    %Geo.Polygon{ coordinates: [ [
      {minX, minY}, {minX, maxY}, {maxX, maxY}, {maxX, minY}, {minX, minY}
    ] ] }
  end
end

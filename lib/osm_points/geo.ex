Postgrex.Types.define(
  OsmPoints.PostgresTypes,
  [Geo.PostGIS.Extension] ++ Ecto.Adapters.Postgres.extensions(),
  json: Poison
)

defimpl Poison.Encoder, for: Geo.Point do
  def encode(model, options) do
    model
      |> Map.fetch!(:coordinates)
      |> Poison.Encoder.encode(options)
  end
end

defimpl Poison.Encoder, for: Tuple do
  def encode(tuple, options) do
    tuple
    |> Tuple.to_list
    |> Poison.Encoder.encode(options)
  end
end

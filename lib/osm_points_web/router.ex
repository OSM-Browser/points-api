defmodule OsmPointsWeb.Router do
  use OsmPointsWeb, :router
  use Plugsnag

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    get "/points", OsmPointsWeb.PointController, :index

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: OsmPointsWeb.Schema

    forward "/", Absinthe.Plug,
      schema: OsmPointsWeb.Schema,
      pipeline: {ApolloTracing.Pipeline, :plug}
  end
end

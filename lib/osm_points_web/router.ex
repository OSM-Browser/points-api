defmodule OsmPointsWeb.Router do
  use OsmPointsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", OsmPointsWeb do
    pipe_through :api

    get "/points", PointController, :index
  end
end

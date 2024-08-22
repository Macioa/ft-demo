defmodule FtDemoWeb.Router do
  use FtDemoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FtDemoWeb do
    pipe_through :api

    get "/trucks", TruckController, :index
  end
end

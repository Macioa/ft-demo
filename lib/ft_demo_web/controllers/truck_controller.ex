defmodule FtDemoWeb.TruckController do
  use FtDemoWeb, :controller
  alias FtDemo.Truck

  def index(conn, %{"longitude" => longitude, "latitude" => latitude, "distance" => distance}) do
    longitude = String.to_float(longitude)
    latitude = String.to_float(latitude)
    distance = String.to_float(distance)

    trucks = Truck.Query.by_location(longitude, latitude, distance)
    json(conn, trucks)
  end
end

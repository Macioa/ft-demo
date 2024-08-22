defmodule FtDemo.Truck.Query do
  import Ecto.Query
  alias FtDemo.Repo
  alias FtDemo.Truck

  def by_location(longitude, latitude, distance_in_meters) do
    query = from t in Truck,
            where: fragment("ST_DWithin(geom, ST_SetSRID(ST_MakePoint(?, ?), 4326), ?)", ^longitude, ^latitude, ^distance_in_meters),
            select: t

    Repo.all(query)
  end
end

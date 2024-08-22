defmodule FtDemo.Repo.Migrations.AddGeomToTrucks do
  use Ecto.Migration

  def change do
    alter table(:trucks) do
      add :geom, :geometry
    end

    execute("UPDATE trucks SET geom = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)")
    execute("CREATE INDEX trucks_geom_index ON trucks USING GIST (geom)")
  end
end

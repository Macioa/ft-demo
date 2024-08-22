defmodule FtDemo.Repo.Migrations.CreateTrucks do
  use Ecto.Migration

  def up do
    create table(:trucks) do
      add :locationid, :string
      add :applicant, :string
      add :facilitytype, :string
      add :cnn, :string
      add :locationdescription, :string, size: 500
      add :address, :string
      add :blocklot, :string
      add :block, :string
      add :lot, :string
      add :permit, :string
      add :status, :string
      add :fooditems, :string, size: 500
      add :x, :float
      add :y, :float
      add :latitude, :float
      add :longitude, :float
      add :schedule, :string, size: 500
      add :dayshours, :string, size: 500
      add :noisent, :string
      add :approved, :utc_datetime
      add :received, :string
      add :priorpermit, :boolean
      add :expirationdate, :utc_datetime
      add :location, :string
      add :firepreventiondistricts, :string
      add :policedistricts, :string
      add :supervisordistricts, :string
      add :zipcodes, :string
      add :neighborhoodsold, :string
    end
  end

  def down do
    execute("DROP TABLE IF EXISTS trucks")
  end

  def change do
    alter table(:trucks) do
      add :geom, :geometry
    end

    execute("UPDATE trucks SET geom = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)")
    execute("CREATE INDEX trucks_geom_index ON trucks USING GIST (geom)")
  end
end

defmodule FtDemo.Repo.Migrations.Postgis do
  use Ecto.Migration

  def up do
    execute("CREATE EXTENSION IF NOT EXISTS postgis")

    execute("""
    CREATE OR REPLACE FUNCTION get_nearby_trucks(longitude double precision, latitude double precision, distance_in_meters double precision)
    RETURNS TABLE(id integer, name text, geom geometry) AS $$
    BEGIN
      RETURN QUERY
      SELECT *
      FROM trucs
      WHERE ST_DistanceSphere(geom, ST_MakePoint(longitude, latitude)) < distance_in_meters;
    END;
    $$ LANGUAGE plpgsql;
    """)
  end

  def down do
    execute(
      "DROP FUNCTION IF EXISTS get_nearby_companies(double precision, double precision, double precision)"
    )
  end
end

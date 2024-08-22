defmodule FtDemo.Truck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trucks" do
    field :locationid, :string
    field :applicant, :string
    field :facilitytype, :string
    field :cnn, :string
    field :locationdescription, :string
    field :address, :string
    field :blocklot, :string
    field :block, :string
    field :lot, :string
    field :permit, :string
    field :status, :string
    field :fooditems, :string
    field :x, :float
    field :y, :float
    field :latitude, :float
    field :longitude, :float
    field :schedule, :string
    field :dayshours, :string
    field :noisent, :string
    field :approved, :utc_datetime
    field :received, :string
    field :priorpermit, :boolean
    field :expirationdate, :utc_datetime
    field :location, :string
    field :firepreventiondistricts, :string
    field :policedistricts, :string
    field :supervisordistricts, :string
    field :zipcodes, :string
    field :neighborhoodsold, :string

    timestamps()
  end

  @doc false
  def changeset(truck, attrs) do
    truck
    |> cast(attrs, [
      :locationid,
      :applicant,
      :facilitytype,
      :cnn,
      :locationdescription,
      :address,
      :blocklot,
      :block,
      :lot,
      :permit,
      :status,
      :fooditems,
      :x,
      :y,
      :latitude,
      :longitude,
      :schedule,
      :dayshours,
      :noisent,
      :approved,
      :received,
      :priorpermit,
      :expirationdate,
      :location,
      :firepreventiondistricts,
      :policedistricts,
      :supervisordistricts,
      :zipcodes,
      :neighborhoodsold
    ])
    |> validate_required([
      :locationid,
      :applicant,
      :facilitytype,
      :cnn,
      :locationdescription,
      :address,
      :blocklot,
      :block,
      :lot,
      :permit,
      :status,
      :fooditems,
      :x,
      :y,
      :latitude,
      :longitude,
      :schedule,
      :dayshours,
      :noisent,
      :approved,
      :received,
      :priorpermit,
      :expirationdate,
      :location,
      :firepreventiondistricts,
      :policedistricts,
      :supervisordistricts,
      :zipcodes,
      :neighborhoodsold
    ])
  end
end

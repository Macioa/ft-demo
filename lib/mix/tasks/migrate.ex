defmodule Mix.Tasks.MigrateCsv do
  alias NimbleCSV.RFC4180, as: CSV
  alias FtDemo.Repo
  alias FtDemo.Truck

  @keys [
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
  ]

  def run(_args) do
    Mix.Task.run("app.start")
    migrate()

    Ecto.Adapters.SQL.query!(Repo, """
    UPDATE trucks
    SET geom = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)
    WHERE latitude IS NOT NULL AND longitude IS NOT NULL;
    """)

    {:ok, nil}
  end

  def migrate do
    res = process_csv("Mobile_Food_Facility_Permit.csv")
    {:ok, res}
  end

  def process_csv(file_path) do
    file_path
    |> File.stream!()
    |> CSV.parse_stream()
    |> Stream.chunk_every(60)
    |> Stream.each(&process_chunk/1)
    |> Stream.run()
  end

  defp process_chunk(chunk) do
    data = chunk |> Enum.map(&transform_row/1)

    {count, _} = Repo.insert_all(Truck, data)
    IO.puts("Inserted #{count} trucks")
  end

  defp transform_row(row) do
    row
    |> Enum.with_index()
    |> Enum.map(fn {value, index} ->
      key = Enum.at(@keys, index)

      value =
        case key do
          :approved -> parse_datetime(value)
          :expirationdate -> parse_datetime(value)
          :priorpermit -> parse_boolean(value)
          :y -> parse_float(value)
          :x -> parse_float(value)
          :latitude -> parse_float(value)
          :longitude -> parse_float(value)
          _ -> value
        end

      {key, value}
    end)
    |> Enum.into(%{})
  end

  defp parse_datetime(value) do
    case NaiveDateTime.from_iso8601(value) do
      {:ok, naive_dt} -> DateTime.from_naive!(naive_dt, "Etc/UTC")
      _ -> nil
    end
  end

  defp parse_boolean(value), do: !!value

  defp parse_float(value) do
    case Float.parse(value) do
      {float, _} -> float
      :error -> nil
    end
  end
end

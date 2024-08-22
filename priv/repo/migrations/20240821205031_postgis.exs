defmodule FtDemo.Repo.Migrations.Postgis do
  use Ecto.Migration

  def up do
    execute("CREATE EXTENSION IF NOT EXISTS postgis")
  end

  def down, do: nil
end

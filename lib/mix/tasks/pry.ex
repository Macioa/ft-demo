defmodule Mix.Tasks.Pry do
  alias FtDemo.Repo
  alias FtDemo.Truck

  require IEx

  def run(_args) do
    Mix.Task.run("app.start")
    IEx.pry()
    {:ok, nil}
  end
end

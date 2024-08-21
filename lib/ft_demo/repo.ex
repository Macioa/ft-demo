defmodule FtDemo.Repo do
  use Ecto.Repo,
    otp_app: :ft_demo,
    adapter: Ecto.Adapters.Postgres
end

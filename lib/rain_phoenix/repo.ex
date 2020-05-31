defmodule RainPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :rain_phoenix,
    adapter: Ecto.Adapters.Postgres
end

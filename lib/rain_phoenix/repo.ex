defmodule RainPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :rain_phoenix,
    adapter: Ecto.Adapters.Postgres

  use Scrivener, page_size: 4
end

defmodule PhoenixOrderForm.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_order_form,
    adapter: Ecto.Adapters.Postgres
end

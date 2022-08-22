defmodule TechChallenge.Repo do
  use Ecto.Repo,
    otp_app: :tech_challenge,
    adapter: Ecto.Adapters.Postgres
end

defmodule PhxPlugEnv.Repo do
  use Ecto.Repo,
    otp_app: :phx_plug_env,
    adapter: Ecto.Adapters.Postgres
end

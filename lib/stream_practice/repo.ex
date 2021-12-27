defmodule StreamPractice.Repo do
  use Ecto.Repo,
    otp_app: :stream_practice,
    adapter: Ecto.Adapters.Postgres
end

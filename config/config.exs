import Config

config :stream_practice, StreamPractice.Repo,
  database: "stream_practice",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :stream_practice, ecto_repos: [StreamPractice.Repo]

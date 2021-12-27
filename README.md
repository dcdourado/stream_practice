# StreamPractice

Use `StreamPractice.Seeds.generate_some_random_data/1` inside iex to generate some data so we can
easily evaluate the difference between working with Enums and Streams (100k units is a suggestion).

Check out `StreamPractice.Streams` module functions and debug it to see the results.

## Installation

```
docker-compose up -d
mix deps.get
mix ecto.create
iex -S mix
```
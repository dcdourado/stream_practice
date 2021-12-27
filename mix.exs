defmodule StreamPractice.MixProject do
  use Mix.Project

  def project do
    [
      app: :stream_practice,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {StreamPractice.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.7.1"},
      {:postgrex, ">= 0.0.0"},
      {:jason, "~> 1.3"}
    ]
  end
end

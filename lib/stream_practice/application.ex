defmodule StreamPractice.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      StreamPractice.Repo
    ]

    opts = [strategy: :one_for_one, name: StreamPractice.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

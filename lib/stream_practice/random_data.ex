defmodule StreamPractice.RandomData do
  use Ecto.Schema

  schema "random_data" do
    field :data, :map

    timestamps()
  end
end

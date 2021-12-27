defmodule StreamPractice.Seeds do
  require Logger

  alias StreamPractice.RandomData

  def generate_some_random_data(n) when is_integer(n) and n > 0 do
    Logger.info("Inserting #{n} random data.")

    random_data =
      Enum.map(1..n, fn _ ->
        %{
          data: %{random_code: Ecto.UUID.generate()},
          inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
          updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
        }
      end)

    StreamPractice.Repo.insert_all(RandomData, random_data)
  end
end

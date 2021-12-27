defmodule StreamPractice.Streams do
  import Ecto.Query, only: [from: 2]

  require Logger

  alias StreamPractice.{RandomData, Repo}

  @doc """
  Here we keep data processing inside the stream on operations.

  From logs we can perceive operations keep the order for each element and after 10 fetches more
  results from the `Repo.stream/2`.
  """
  def practice do
    Repo.transaction(
      fn ->
        query =
          from(rd in RandomData,
            where: not is_nil(rd.inserted_at)
          )

        query
        |> Repo.stream(max_rows: 10)
        |> Stream.map(fn _random_data ->
          Logger.info("Step ONE")
          # new_random_data = %{
          #   random_data
          #   | data: %{
          #       random_code: Ecto.UUID.generate()
          #     },
          #     updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
          # }

          # Repo.update(RandomData, new_random_data)
        end)
        |> Stream.map(fn _random_data ->
          Logger.info("Step TWO")
        end)
        |> Enum.each(fn random_data ->
          Logger.info("Result: #{inspect(random_data)}")
        end)
      end,
      timeout: 5 * 60 * 1000
    )
  end

  @doc """
  When applying a Enum function we get out of the stream and proccess all data together.
  """
  def practice_v2 do
    Repo.transaction(
      fn ->
        query =
          from(rd in RandomData,
            where: not is_nil(rd.inserted_at)
          )

        query
        |> Repo.stream(max_rows: 10)
        |> Enum.to_list()
        |> Enum.map(fn _random_data ->
          Logger.info("Step ONE")
        end)
        |> Enum.map(fn _random_data ->
          Logger.info("Step TWO")
        end)
        |> Enum.each(fn random_data ->
          Logger.info("Result: #{inspect(random_data)}")
        end)
      end,
      timeout: 5 * 60 * 1000
    )
  end
end

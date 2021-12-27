defmodule StreamPracticeTest do
  use ExUnit.Case
  doctest StreamPractice

  test "greets the world" do
    assert StreamPractice.hello() == :world
  end
end

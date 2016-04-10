defmodule StatsTest do
  use ExUnit.Case
  doctest Stats

  defp list do
    [5.1, 3, 8, -2.3, 1, 12.5, -5, 2]
  end

  test "returns the smallest value in a list" do
    assert Stats.minimum(list) == -5
  end

  test "returns the largest value in a list" do
    assert Stats.maximum(list) == 12.5
  end

  test "returns the range between the smallest and largest number in a list" do
    assert Stats.range(list) == [-5, 12.5]
  end
end

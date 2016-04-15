defmodule CityTest do
  use ExUnit.Case
  doctest City

  test "derives the correct value given a delta" do
    f1 = fn(x) -> x * x end
    assert_in_delta Calculus.derivative(f1, 3), 6.0000004, 0.0000001
  end
end

defmodule PowersTest do
  use ExUnit.Case
  doctest Powers

  test "powers of 0^0" do
    assert Powers.raise(0, 0) == 1
  end

  test "powers of 0^2" do
    assert Powers.raise(0, 2) == 0
  end

  test "powers of 2^0" do
    assert Powers.raise(2, 0) == 1
  end

  test "powers of 2^1" do
    assert Powers.raise(2, 1) == 2
  end

  test "powers of 2^8" do
    assert Powers.raise(2, 8) == 256
  end

  test "powers of 4^-4" do
    assert Powers.raise(4, -4) == 0.00390625
  end
end

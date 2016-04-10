defmodule GeomTest do
  use ExUnit.Case
  doctest Geom

  test "returns 0 for negative and invalid inputs" do
    assert Geom.area({:rectangle, -1, -1}) == 0

    assert Geom.area({:rectangle, -1, 10}) == 0

    assert Geom.area({:rectangle, 10, -1}) == 0
  end

  test "return 0 for invalid shapes" do
    assert Geom.area({:square, 3, 1}) == 0
  end

  test "computes the area of a 2x2 square" do
    assert Geom.area({:rectangle, 2,2}) == 4
  end

  test "computes the area of a 5x3 rectangle" do
    assert Geom.area({:rectangle, 5,3}) == 15
  end

  test "computes the area of a 2x4 rectangle" do
    assert Geom.area({:rectangle, 2,4}) == 8
  end

  test "computes the area of a 2x2 triangle" do
    assert Geom.area({:triangle, 2, 2}) == 2
  end

  test "computes the area of a 4x3 triangle" do
    assert Geom.area({:triangle, 4, 3}) == 6
  end

  test "computes the area of a 4x3 ellipse" do
    assert Geom.area({:ellipse, 4, 3}) == :math.pi() * 4 * 3
  end
end

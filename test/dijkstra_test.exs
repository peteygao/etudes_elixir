defmodule DijkstraTest do
  use ExUnit.Case
  doctest Dijkstra

  test "cannot compute the GCD of numbers smaller than 1" do
    assert_raise FunctionClauseError, fn ->
      Dijkstra.gcd(0,0)
    end

    assert_raise FunctionClauseError, fn ->
      Dijkstra.gcd(-2,0)
    end

    assert_raise FunctionClauseError, fn ->
      Dijkstra.gcd(0,-5)
    end

    assert_raise FunctionClauseError, fn ->
      Dijkstra.gcd(-10,-5)
    end
  end

  test "computes the GCD of two of the same numbers" do
    assert Dijkstra.gcd(1,1) == 1
  end

  test "computes the GCD of two primes" do
    assert Dijkstra.gcd(3,7) == 1
  end

  test "computes the GCD of 2,8" do
    assert Dijkstra.gcd(2,8) == 2
  end

  test "computes the GCD of 125,46" do
    assert Dijkstra.gcd(125,46) == 1
  end
end

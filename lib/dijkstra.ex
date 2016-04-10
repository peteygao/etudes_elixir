defmodule Dijkstra do
  @moduledoc """
    Functions for algorithms devised by Edsgar W. Dijkstra
  """

  @doc """
    Returns the greatest common divisor of two positive integers
  """
  @spec gcd(number(), number()) :: number()

  def gcd(a, b) when a > 0 and b > 0 do
    cond do
      a == b ->
        a
      b < a ->
        gcd(a - b, b)
      a < b ->
        gcd(a, b - a)
    end
  end
end

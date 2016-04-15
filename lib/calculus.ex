defmodule Calculus do
  @moduledoc """
  Functions for performing rudimentary calculus operations
  """

  @doc """
  Determine the derivative of a function with a delta
  Etudes 8-1
  """

  @spec derivative(fun, number) :: number

  def derivative function, point do
    delta = 1.0e-10
    (function.(point + delta) - function.(point)) / delta
  end
end

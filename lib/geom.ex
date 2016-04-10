defmodule Geom do
  @moduledoc """
    Functions for calculating areas of geometric shapes.
  """

  @doc """
    Returns the area of a geometric shape
    given the shape and two measurements.

    Valid shapes include:
    :rectangle,
    :triangle,
    :ellipse

    For rectangle and triangle, the first and second number
    arguments refers to width and height, respectively.

    For ellipse, the first number refers to the major radius
    and second number refers to the minor radius.
  """

  @spec area({atom(), number(), number()}) :: number()

  def area({shape, dim1, dim2}) do
    area(shape, dim1, dim2)
  end

  defp area(shape, dim1, dim2) when dim1 > 0 and dim2 > 0 do
    case shape do
      :rectangle ->
        dim1 * dim2
      :triangle ->
        dim1 * dim2 / 2.0
      :ellipse ->
        :math.pi() * dim1 * dim2
      _ ->
        0
    end
  end

  defp area(_, _, _) do
    0
  end
end

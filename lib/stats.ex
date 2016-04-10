defmodule Stats do

  @moduledoc """
    Functions that deal with lists of numbers
  """

  @doc """
    Etudes 6-1
    Returns the smallest number in a list.
  """
  @spec minimum([number()]) :: number()

  def minimum list do
    minimum tl(list), hd(list)
  end

  defp minimum list, min do
    cond do
      [] == list     -> min
      hd(list) < min -> minimum tl(list), hd(list)
      true -> minimum tl(list), min
    end
  end

  @doc """
    Etudes 6-1
    Returns the largest number in a list.
  """
  @spec maximum([number()]) :: number()

  def maximum list do
    maximum tl(list), hd(list)
  end

  defp maximum list, max do
    cond do
      [] == list     -> max
      max < hd(list) -> maximum tl(list), hd(list)
      true -> maximum tl(list), max
    end
  end

  @doc """
    Etudes 6-1
    Returns a list containing the smallest and largest number in the input list.
  """
  @spec range([number()]) :: [number()]

  def range list do
    [minimum(list), maximum(list)]
  end
end

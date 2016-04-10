defmodule Powers do
  import Kernel, except: [raise: 2, raise: 3]

  @moduledoc """
    Functions for calculating powers and roots
  """

  @doc """
    Tail recursion optimized raise to the power method
  """
  @spec raise(number(), number()) :: number()

  def raise(num, pow) do
    cond do
      0 == pow ->
        1
      0 == num ->
        0
      0 < pow ->
        raise(num, pow, 1)
      pow < 0 ->
        1 / raise(num, -pow)
    end
  end

  def raise(num, pow, acc) do
    cond do
      0 == pow ->
        acc
      true ->
        raise(num, pow - 1, num * acc)
    end
  end

  """
  def raise(_, 0) do
    1
  end

  def raise(num, 1) do
    num
  end

  def raise(num, pow) when pow > 0 do
    num * raise(num, pow - 1)
  end

  def raise(num, pow) when pow < 0 do
    1 / raise(num, -pow)
  end
  """

  """
  def raise(num, pow) do
    cond do
      0 == pow ->
        1
      1 == pow ->
        num
      1 < pow ->
        num * raise(num, pow - 1)
      pow < 1 ->
        1 / raise(num, -pow)
    end
  end
  """
end

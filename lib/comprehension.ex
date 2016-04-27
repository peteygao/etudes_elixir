defmodule Comprehension do
  @moduledoc """
  Functions for performing list comprehensions
  """

  @doc """
  Return a list of all male that are over age 40
  """
  @spec male_over_40(list) :: list(tuple)

  def male_over_40 people do
    for {name, gender, age} <- people,
        is_male?(gender),
        over_40?(age),
        do: {name, gender, age}
  end

  @doc """
  Returns a list of people that are either male _or_ are over 40
  """
  @spec male_or_over_40(list) :: list(tuple)

  def male_or_over_40 people do
    for {name, gender, age} <- people,
        is_male_or_over_40?(gender, age),
        do: {name, gender, age}
  end

  defp is_male? gender do
    gender == "M"
  end

  defp over_40? age do
    age > 40
  end

  defp is_male_or_over_40? gender, age do
    is_male?(gender) or over_40?(age)
  end
end

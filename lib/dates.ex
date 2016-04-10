defmodule Dates do

  @moduledoc """
    Functions that deal with dates
  """

  @doc """
    Etudes 5-3
    Takes in an ISO date string (e.g. "2015-01-15") and returns
    a list of its three integer components (e.g. [2015, 1, 15]).
  """
  @spec date_parts(String.t()) :: [integer()]

  def date_parts(string) do
    String.split(string, "-")
      |> Enum.map(&(:erlang.binary_to_integer &1))
  end

  @doc """
    Etudes 6-2
    Returns the date of the year (taking into account leap years).
  """
  @spec julian(String.t()) :: number()

  def julian(string) do
    [year, month, day] = date_parts(string)

    month_total(month, year) + day
  end

  @doc """
    Etudes 6-2
    Returns the total number of dates in preceding months,
    including leap days where applicable.
    Requires the month and year as inputs.
  """
  @spec month_total(integer(), integer()) :: integer()

  def month_total(month, year) do
    date_list = cond do
      is_leap_year(year) -> [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
      true               -> [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    end

    month_total month, date_list, 0
  end

  defp month_total(months, date_list, acc) do
    cond do
      1 == months -> acc
      true -> month_total months - 1, tl(date_list), hd(date_list) + acc
    end
  end

  @doc """
    Etudes 6-2
    Returns true if the year is a leap year, which is calculated
    according to this logic:
    Year is divisible by 4 AND year is NOT divisible by 100
    OR
    Year is divisible by 400
  """
  @spec is_leap_year(integer()) :: boolean()

  def is_leap_year(year) do
    (rem(year, 4) == 0 and rem(year, 100) != 0)
    or (rem(year, 400) == 0)
  end
end

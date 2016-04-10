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
end

defmodule DatesTest do
  use ExUnit.Case
  doctest Dates

  test "date_parts splits 2016-04-10" do
    assert Dates.date_parts("2016-04-10") == [2016, 4, 10]
  end
end

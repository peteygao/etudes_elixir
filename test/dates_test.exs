defmodule DatesTest do
  use ExUnit.Case
  doctest Dates

  test "date_parts splits 2016-04-10" do
    assert Dates.date_parts("2016-04-10") == [2016, 4, 10]
  end

  test "get the date of the year in a regular year" do
    assert Dates.julian("2013-12-31") == 365
  end

  test "get the date of the year in a leap year" do
    assert Dates.julian("2012-12-31") == 366
  end

  test "get the number of days in a leap year if it's after Feb 29" do
    assert Dates.julian("2000-03-01") == 61
  end

  test "get the number of days in a leap year if it's before Feb 29" do
    assert Dates.julian("2000-02-01") == 32
  end

  test "new years!" do
    assert Dates.julian("2016-01-01") == 1
  end

  test "leap year is every 4 years, except if it's a new century." do
    assert Dates.is_leap_year(1904)
    refute Dates.is_leap_year(1900)
  end

  test "leap year is every 400 years, even if it's a new century." do
    assert Dates.is_leap_year(2000)
    assert Dates.is_leap_year(400)
  end

  test "get the number of days in preceding months" do
    assert Dates.month_total(4, 2013) == 90
  end

  test "get the number of days in preceding months in a leap year" do
    assert Dates.month_total(4, 2012) == 91
  end
end

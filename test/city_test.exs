defmodule CityTest do
  use ExUnit.Case
  doctest City

  test "creates a valid city by default" do
    assert Valid.valid?(%City{}) === true
  end

  test "invalidates cities with negative population" do
    refute Valid.valid?(%City{population: -10}) === true
  end

  test "latitude must be between -90 and 90 (inclusive)" do
    refute Valid.valid?(%City{latitude: -91}) === true
    refute Valid.valid?(%City{latitude: 91}) === true
    assert Valid.valid?(%City{latitude: -90}) === true
    assert Valid.valid?(%City{latitude: 0}) === true
    assert Valid.valid?(%City{latitude: 90}) === true
  end

  test "longitude must be between -180 and 180 (inclusive)" do
    refute Valid.valid?(%City{longitude: -181}) === true
    refute Valid.valid?(%City{longitude: 181}) === true
    assert Valid.valid?(%City{longitude: -180}) === true
    assert Valid.valid?(%City{longitude: 0}) === true
    assert Valid.valid?(%City{longitude: 180}) === true
  end

  test "inspect returns a pretty formatted string" do
    city = %City{
      name:       "Andytown",
      population: 123,
      latitude:   50,
      longitude:  -120,
    }
    assert inspect(city) === "Andytown (123) 50.0°N -120.0°W"
  end
end

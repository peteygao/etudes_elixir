defmodule GeographyTest do
  use ExUnit.Case
  doctest Geography

  test "returns a list of %Country{}" do
    assert Geography.make_geo_list("test/data/geography_test.csv") == [
      %Country{
        language: "German",
        name:     "Germany",
        cities: [
          %City{
            latitude:   53.57532,
            longitude:  10.01534,
            name:       "Hamburg",
            population: 1739117,
          },
          %City{
            latitude:   51.05089,
            longitude:  13.73832,
            name:       "Dresden",
            population: 486854,
          }
        ]
      },
      %Country{
        language: "Spanish",
        name:     "Spain",
        cities: [
          %City{
            latitude:   40.4165,
            longitude:  -3.70256,
            name:       "Madrid",
            population: 3255944,
          }
        ]
      }
    ]
  end
end

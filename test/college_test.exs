defmodule CollegeTest do
  use ExUnit.Case
  doctest College

  test "parse CSV and return a map of rooms to course list" do
    assert College.make_room_list("test/data/courses_test.csv") === %{
      "RF141" => ["ENGL 033", "LA 033"],
      "RD312" => ["ESL 091"]
    }
  end
end

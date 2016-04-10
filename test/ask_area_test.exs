defmodule AskAreaTest do
  use ExUnit.Case
  doctest AskArea

  test "calculates the area of a rectangle" do
    assert AskArea.calculate(:rectangle, {2, 3}) == 6
  end

  test "displays an error on unknown shape" do
    assert_raise RuntimeError, "Unknown shape.", fn ->
      AskArea.calculate(:unknown, {2, 3})
    end
  end

  test "displays an error on negative dimensions" do
    assert_raise RuntimeError, "Invalid dimensions.", fn ->
      AskArea.calculate(:rectangle, {2, -3})
    end
  end

  test "Input of r or R should return :rectangle" do
    assert AskArea.char_to_shape("r\n") == :rectangle
    assert AskArea.char_to_shape("R\n") == :rectangle
  end

  test "string_to_number \"4.5\" returns a float" do
    assert AskArea.string_to_number("4.5\n") == 4.5
  end

  test "string_to_number \"50\" returns an integer" do
    assert AskArea.string_to_number("50\n") == 50
  end

  test "string_to_number catches invalid input and errors" do
    assert_raise RuntimeError, "Invalid input for a number.", fn ->
      AskArea.string_to_number("bozo")
    end
  end
end

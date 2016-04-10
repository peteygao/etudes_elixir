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

  test "Input of r or R should return :rectangle" do
    assert AskArea.char_to_shape("r\n") == :rectangle
    assert AskArea.char_to_shape("R\n") == :rectangle
  end
end

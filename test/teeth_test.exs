defmodule TeethTest do
  use ExUnit.Case
  doctest Teeth

  test "warns of bad gum pocket" do
    assert Teeth.alert(Teeth.pocket_depths) == [9,11,25,26,29]
  end
end

defmodule ComprehensionTest do
  use ExUnit.Case
  doctest Comprehension

  test "#male_over_40 should return only male over 40" do
    list = [{"Alice", "F", 39}, {"Bob", "M", 38},
            {"Charlie", "M", 42}, {"Diana", "F", 41}]
    assert Comprehension.male_over_40(list) == [{"Charlie", "M", 42}]
  end

  test "#male_or_over_40 should return a mixed list of all males and females over 40" do
    list = [{"Alice", "F", 39}, {"Bob", "M", 38},
            {"Charlie", "M", 42}, {"Diana", "F", 41}]
    assert Comprehension.male_or_over_40(list) == [{"Bob", "M", 38},
                                                   {"Charlie", "M", 42},
                                                   {"Diana", "F", 41}]
  end
end

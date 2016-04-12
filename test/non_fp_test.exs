defmodule NonFPTest do
  use ExUnit.Case
  doctest NonFP

  test "it should generate a list of gum depths" do
    tooth_list = 'FTTTTTTTTTTTTTTFTTTTTTTTTTTTTTTT'
    probability = 0.75
    gum_depths = [
      [0], [1, 1, 1, 3, 1, 3], [2, 2, 1, 3, 3, 1], [3, 1, 1, 2, 3, 1],
      [1, 1, 3, 3, 3, 2], [2, 1, 3, 2, 2, 3], [3, 2, 1, 2, 3, 1], [1, 2, 1, 1, 2, 1],
      [2, 4, 2, 2, 4, 4], [1, 3, 3, 1, 3, 2], [2, 2, 3, 2, 1, 3], [2, 3, 2, 3, 3, 1],
      [1, 3, 3, 2, 1, 2], [1, 1, 3, 2, 2, 1], [1, 2, 3, 3, 1, 2], [0],
      [2, 3, 3, 1, 3, 3], [1, 2, 3, 2, 3, 3], [2, 2, 1, 2, 3, 1], [2, 2, 2, 2, 2, 1],
      [3, 1, 2, 2, 1, 1], [3, 2, 3, 3, 3, 1], [2, 3, 2, 1, 2, 2], [2, 1, 2, 1, 3, 3],
      [3, 1, 1, 1, 3, 1], [3, 2, 2, 1, 3, 3], [4, 4, 3, 4, 3, 3], [1, 3, 2, 1, 3, 2],
      [3, 3, 2, 3, 2, 3], [2, 1, 1, 1, 2, 3], [2, 1, 2, 3, 3, 1], [3, 3, 3, 3, 3, 1]
    ]

    :random.seed(0)
    assert NonFP.generate_pockets(tooth_list, probability) == gum_depths
  end
end

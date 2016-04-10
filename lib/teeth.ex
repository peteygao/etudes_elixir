defmodule Teeth do
  @moduledoc """
  Functions for finding out whether or not any teeth requires dental attention.
  """

  @doc """
  Alert if any of the gum has a pocket depth greater than or equal to 4mm.
  """
  @spec alert([[integer()]]) :: [integer()]

  def alert teeth do
    alert teeth, 1, []
  end

  defp alert [], teeth_num, acc do
    Enum.reverse acc
  end

  defp alert teeth, teeth_num, acc do
    cond do
      4 <= Stats.maximum(hd(teeth)) ->
        alert tl(teeth), teeth_num + 1, [teeth_num | acc]
      true ->
        alert tl(teeth), teeth_num + 1, acc
    end
  end

  @doc """
  A person who has had her upper wisdom teeth, numbers 1 and 16, removed.
  """
  @spec pocket_depths() :: [[integer()]]

  def pocket_depths do
    [[0], [2,2,1,2,2,1], [3,1,2,3,2,3],
    [3,1,3,2,1,2], [3,2,3,2,2,1], [2,3,1,2,1,1],
    [3,1,3,2,3,2], [3,3,2,1,3,1], [4,3,3,2,3,3],
    [3,1,1,3,2,2], [4,3,4,3,2,3], [2,3,1,3,2,2],
    [1,2,1,1,3,2], [1,2,2,3,2,3], [1,3,2,1,3,3], [0],
    [3,2,3,1,1,2], [2,2,1,1,3,2], [2,1,1,1,1,2],
    [3,3,2,1,1,3], [3,1,3,2,3,2], [3,3,1,2,3,3],
    [1,2,2,3,3,3], [2,2,3,2,3,3], [2,2,2,4,3,4],
    [3,4,3,3,3,4], [1,1,2,3,1,2], [2,2,3,2,1,3],
    [3,4,2,4,4,3], [3,3,2,1,2,3], [2,2,2,2,3,3],
    [3,2,3,2,3,2]]
  end
end

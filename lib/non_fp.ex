defmodule NonFP do
  @moduledoc """
  Functions that are not "pure" (e.g. random number generators).
  RNG's are not pure because they have to mutate the seed every time.
  """

  @doc """
  Generates a list of teeth with their corresponding gum depth based
  on input teeth list (T for teeth, F for no teeth) and probability
  that the teeth is a good teeth.
  """
  @spec generate_pockets([char()], [number()]) :: [[integer()]]

  def generate_pockets(teeth_presence, probability) do
    generate_pockets teeth_presence, probability, []
  end

  defp generate_pockets([], _, acc) do
    Enum.reverse acc
  end

  defp generate_pockets(
    [tooth | rest_of_teeth],
    probability,
    acc
  ) when
    tooth == ?T
  do
    generate_pockets(
      rest_of_teeth,
      probability,
      [generate_tooth(probability) | acc]
    )
  end

  defp generate_pockets(
    [_| rest_of_teeth],
    probability,
    acc
  ) do
    generate_pockets(
      rest_of_teeth,
      probability,
      [ [0] | acc ]
    )
  end

  defp generate_tooth probability do
    cond do
      :random.uniform() < probability ->
        generate_tooth 2, 6, []
      true ->
        generate_tooth 3, 6, []
    end
  end

  defp generate_tooth _, 0, acc do
    acc
  end

  defp generate_tooth base_depth, depths_left, acc do
    generate_tooth(
      base_depth,
      depths_left - 1,
      [base_depth + (:random.uniform(3) - 2) | acc]
    )
  end
end

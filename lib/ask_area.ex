defmodule AskArea do

  @moduledoc """
    Module that takes user input and computes areas of shapes
  """

  @doc """
    Etudes 5-1
    Asks the user for a shape, and its measurements and computes
    its area based on the Geom module.
  """
  @spec area() :: number()

  def area do
    shape = char_to_shape(
      IO.gets("R)ectangle, T)riangle, E)llipse: ")
        |> String.strip
    )
    calculate shape, get_dimensions("dimension 1", "dimension 2")
  end

  @doc """
    Etudes 5-1
    Takes in a char string and returns an atom representing the
    shape (:rectangle, :triangle, :ellipse, :unknown).
  """
  @spec char_to_shape(String.t()) :: atom()

  def char_to_shape(char) do
    cond do
      String.downcase(char) |> String.strip == "r" -> :rectangle
      String.downcase(char) |> String.strip == "t" -> :triangle
      String.downcase(char) |> String.strip == "e" -> :ellipse
      true -> :unknown
    end
  end

  @doc """
    Etudes 5-1
    Takes in a prompt string and prints an input prompt.
    Returns a number from the input.
  """
  @spec get_number(String.t()) :: number()

  def get_number(prompt) do
    IO.gets("Enter #{prompt}: ") |> string_to_number
  end

  @doc """
    Etudes 5-2
    Takes in a string and converts it to an integer or float
    if the input is a valid number.
    Returns a number from the input.
  """
  @spec string_to_number(String.t()) :: number()

  def string_to_number(string) do
    candidate_string = string |> String.strip
    cond do
      Regex.match?(~r/\d\.\d/, candidate_string) ->
        :erlang.binary_to_float candidate_string
      Regex.match?(~r/\d/, candidate_string) ->
        :erlang.binary_to_integer candidate_string
      true ->
        raise "Invalid input for a number."
    end
  end

  @doc """
    Etudes 5-1
    Takes in two prompt strings and returns a tuple with the
    dimensions {dim1, dim2}.
  """
  @spec get_dimensions(String.t(), String.t()) :: {number(), number()}

  def get_dimensions(prompt1, prompt2) do
    { get_number(prompt1), get_number(prompt2) }
  end

  @doc """
    Etudes 5-1
    Takes in a shape atom and two dimensions (as a single tuple).
    If the shape and dimensions are invalid, display an error.
  """
  @spec calculate(atom(), {number(), number()}) :: number()

  def calculate(shape, {dim1, dim2}) when 0 < dim1 and 0 < dim2 do
    cond do
      :triangle == shape  -> Geom.area shape, dim1, dim2
      :rectangle == shape -> Geom.area shape, dim1, dim2
      :ellipse == shape   -> Geom.area shape, dim1, dim2
      :unknown == shape   -> raise "Unknown shape."
    end
  end

  def calculate(_, {_, _}) do
    raise "Invalid dimensions."
  end
end

defmodule College do
  @moduledoc """
  Functions for getting course names and rooms they're taught in.
  """

  @doc """
  Makes a map of rooms to the courses that takes place there.
  Returns a map where the room is the key and a list of courses that takes place
  within it.
  Etudes 7-1
  """
  @spec make_room_list(String.t()) :: %{ atom() => list() }

  def make_room_list file_name do
    {result, file} = File.open file_name, [:read, :utf8]

    lines = case result do
      :ok    -> process_line(file, [])
      :error -> raise "Could not read file because: #{file}"
    end

    lines_to_rooms lines, %{}
  end

  defp process_line file, lines do
    data = IO.read(file, :line)

    case data do
      :eof -> Enum.reverse(lines)
      _    ->
        process_line(
          file,
          [String.split(data, ",") |> Enum.map(&String.strip/1) | lines]
        )
    end
  end

  defp lines_to_rooms [], rooms_map do
    rooms_map
  end

  defp lines_to_rooms [line | lines], rooms_map do
    [_course_id, course_name, room_number] = line

    new_map = Map.update(rooms_map, room_number, [course_name],
      fn(course_list) ->
        List.insert_at(course_list, -1, course_name)
      end
    )

    lines_to_rooms lines, new_map
  end
end

defmodule City do
  defstruct name: "", population: 0, latitude: 0.0, longitude: 0.0
end

defimpl Inspect, for: City do
  import Inspect.Algebra

  def inspect city, _opts do
    latitude = city.latitude
      |> int_to_float
      |> Float.round(2)
      |> determine_cardinal_directions(["N","S"])

    longitude = city.longitude
      |> int_to_float
      |> Float.round(2)
      |> determine_cardinal_directions(["E","W"])

    concat([
      city.name,
      break,
      "(", to_string(city.population), ")",
      break,
      latitude,
      break,
      longitude
    ])
  end

  defp determine_cardinal_directions lat_or_long, [greater|less] do
    cond do
      0 < lat_or_long -> "#{lat_or_long}°#{greater}"
      lat_or_long < 0 -> "#{lat_or_long}°#{less}"
      true -> "#{lat_or_long}°"
    end
  end

  defp int_to_float int do
    int + 0.0
  end
end

defimpl Valid, for: City do
  def valid? city do
    0    <= city.population &&
    -90  <= city.latitude   && city.latitude  <= 90 &&
    -180 <= city.longitude  && city.longitude <= 180
  end
end

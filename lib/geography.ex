defmodule Geography do
  @moduledoc """
  Functions for generating Geographic structured data
  """

  @doc """
  Return a list of Countries. Countries is a struct with the keys
  name, language and a list of Cities. Cities is a struct with keys
  for name, population, latitude and longitude.
  Etudes 7-2
  """
  @spec make_geo_list(String.t()) :: list(Country.t())

  def make_geo_list file_name do
    {result, file} = File.open(file_name, [:read, :utf8])

    case result do
      :ok    -> process_lines file, []
      :error -> raise "Could not open file '#{file_name}' because #{file}"
    end
  end

  defp process_lines file, countries_list do
    case line = IO.read(file, :line) do
      :eof ->
        Enum.reverse(countries_list)
          |> Enum.map(fn(country) ->
            Map.update! country, :cities, fn(cities) ->
              Enum.reverse cities
            end
          end)
      _    ->
        line = String.strip(line) |> String.split(",")

        process_lines file, parse_line(line, countries_list)
    end
  end

  defp parse_line [country_name, language], countries_list do
    country = %Country{
      name:     country_name,
      language: language,
    }

    [country | countries_list]
  end

  defp parse_line(
    [city_name, population, latitude, longitude],
    [current_country | countries_list]
  ) do
    city = %City{
      name:       city_name,
      population: String.to_integer(population),
      latitude:   String.to_float(latitude),
      longitude:  String.to_float(longitude),
    }

    updated_country = Map.update! current_country, :cities, fn(cities) ->
      [city | cities]
    end

    [updated_country | countries_list]
  end
end

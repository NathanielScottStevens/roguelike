defmodule Grid do
  def create({width, height}, default \\ nil) do
    width = if (width < 0), do: 0, else: width
    height = if (height < 0), do: 0, else: height

    List.duplicate(default, width) 
    |> List.duplicate(height)
  end

  def at(grid, {x, y}) do
    y_inverted = Enum.count(grid) - 1 - y

    grid
    |> Enum.at(y_inverted)
    |> Enum.at(x)
  end
end


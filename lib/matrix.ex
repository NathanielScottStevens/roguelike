defmodule Matrix do
  def create({width, height}, default \\ nil) do
    width = if (width < 0), do: 0, else: width
    height = if (height < 0), do: 0, else: height

    List.duplicate(default, width) 
    |> List.duplicate(height)
  end

  def at(matrix, {x, y}) do
    y_inverted = Enum.count(matrix) - 1 - y

    matrix
    |> Enum.at(y_inverted)
    |> Enum.at(x)
  end
end


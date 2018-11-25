defmodule Grid do
  @moduledoc """
  Grid provides easy generation and manipulation
  of two dimensional lists.
  """

  @doc """
  Generate a new grid.

  Returns a two dimensional list

  If width or height are negative,
  the grid will return with a corresponding
  width or height of 0

  ## Examples

      iex> Grid.create(2, 2)
      [[nil, nil], [nil, nil]]

      iex> Grid.create(2, 2, 5)
      [[5, 5], [5, 5]]
  """ 
  def create(width, height, default \\ nil) do
    width = if (width < 0), do: 0, else: width
    height = if (height < 0), do: 0, else: height

    List.duplicate(default, width) 
    |> List.duplicate(height)
  end

  @doc """
  Get grid value at position.

  * The origin of the grid is the bottom left corner.
  * Negative positions will wrap backwards.
  * If position is out of bounds, returns `nil`.

  ## Examples

    iex> Grid.at([[1, 2], [3, 4]], {1, 1})
    2 
  """
  def at(grid, position)
  def at(grid, {x, y}) do
    y_inverted = Enum.count(grid) - 1 - y

    grid
    |> Enum.at(y_inverted)
    |> Enum.at(x)
  end
end


defmodule Grid do
  @moduledoc """
  Grid provides easy generation and manipulation
  of two dimensional lists.

  * The origin of the grid is the bottom left corner.
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

  @doc """
  Set grid value at position

  * If the position is out of bounds, the unmodified grid will be returned.

  ## Examples

  XXX iex> Grid.replace_at([[1, 2], [3, 4]], {1, 1}, 999)
  [[1, 999], [3, 4]]
  """
  def replace_at(grid, position, value)
  def replace_at(grid, {x, y}, value) do
  end

  @doc """
  Returns a subset of the given grid.

  * `max` and `min` are inclusive
  * `max` and `min` are bounded by 0 and the grid's size.

  ## Examples

  XXX iex> Grid.slice([[1, 2, 3], [3, 4, 5]], {0, 0}, {1, 1})
  [[1, 2], [3, 4]]
  """
  def slice(grid, min_pos, max_pos) do
  end

  @doc """
  Returns given grid as a string.

  * Rows are separated by newline characters.

  ## Examples

  XXX iex> Grid.to_string([[1, 2], [3, 4]])
  "12\n34"
  """
  def to_string(grid) do
  end

  @doc """
  Creates grid from string.

  * Rows are delimited by newline characters.

  ## Examples

  XXX iex> Grid.from_string("12\n34")
  [[1, 2], [3, 4]]
  """
  def from_string(string) do
  end
end


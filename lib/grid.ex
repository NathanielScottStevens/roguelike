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

  iex> Grid.replace_at([[1, 2], [3, 4]], {1, 1}, 999)
  [[1, 999], [3, 4]]
  """
  def replace_at(grid, position, value)
  def replace_at(grid, {x, y}, value) do
    if in_bounds?(grid, {x, y}) do
      y_inverted = Enum.count(grid) - 1 - y

      new_row = Enum.at(grid, y_inverted)
                |> List.replace_at(x, value)

      List.replace_at(grid, y_inverted, new_row)
    else
      grid
    end
  end

  @doc """
  Returns dimensions of grid.

  ## Examples

  iex> Grid.get_dimensions([[1, 2], [3, 4], [5, 6]])
  {2, 3}
  """
  def get_dimensions(grid) do
    x = Enum.at(grid, 0)
        |> Enum.count()
    y = Enum.count(grid)
    {x, y}
  end

  @doc """
  Returns true if position is greater than or equal to 0
  and less than the axis' length.

  ## Examples

  iex> Grid.in_bounds?([[1, 2], [3, 4]], {0, 0})
  true
  """
  def in_bounds?(grid, position)
  def in_bounds?(grid, {x, y}) do
    {x_size, y_size} = get_dimensions(grid)
    x_in_bounds = x >= 0 and x < x_size
    y_in_bounds = y >= 0 and y < y_size

    x_in_bounds and y_in_bounds
  end

  @doc """
  Returns a subset of the given grid.

  If start is out of bounds, it returns [].

  If amount is greater than enumerable length, it returns as many elements as
  possible. If amount is zero, then [] is returned.

  ## Examples

  iex> Grid.slice([[1, 2, 3], [3, 4, 5]], {0, 0}, {2, 2})
  [[1, 2], [3, 4]]

  # amount greater than the number of elements
  iex> Grid.slice([[1, 2, 3], [3, 4, 5]], {0, 0}, {5, 5})
  [[1, 2, 3], [3, 4, 5]]

  # out of bound start position
  iex> Grid.slice([[1, 2, 3], [3, 4, 5]], {9, 9}, {2, 2})
  []
  """
  def slice(grid, min_pos, size)
  def slice(grid, {min_x, min_y}, {width, height}) do
    grid
    |> Enum.slice(min_y, height)
    |> Enum.map(fn row -> Enum.slice(row, min_x, width) end)
  end

  @doc """
  Returns given grid as a string.

  * Rows are separated by newline characters.

  ## Examples

  iex> Grid.to_string([[1, 2], [3, 4]])
  "12\n34\n"
  """
  def to_string(grid) do
    grid
    |> Enum.map(fn row -> row ++ ["\n"] end)
    |> Enum.concat
    |> Enum.join
  end

  @doc ~S"""
  Creates grid from string.

  * Rows are delimited by newline characters.

  ## Examples

  iex> Grid.from_string("ab\ncd")
  [["a", "b"], ["c", "d"]]
  """
  def from_string(string) do
    string
    |> String.split("\n")
    |> Enum.map(&String.graphemes/1)
  end
end


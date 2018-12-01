defmodule GridTest do
  use ExUnit.Case
  doctest Grid

  describe "create" do
    test "makes correct number of rows" do
      subject = Grid.create(2, 3) 
      assert Enum.count(subject) == 3
    end

    test "makes correct number of columns" do
      subject = Grid.create(2, 3) 
      actual = Enum.at(subject, 0)
      |> Enum.count() 

      assert actual == 2
    end

    test "sets correct default value" do
      subject = Grid.create(2, 3, 1) 
      assert subject |> Enum.all?()
    end

    test "returns an empty list when rows are less than 1" do
      assert [] == Grid.create(5, -1) 
    end

    test "returns an list with empty columns when columns are less than 1" do
      assert [[], []] == Grid.create(-1, 2) 
    end
  end

  describe "at" do
    test "gets element" do
      grid = [[1, 2],
              [3, 4]]
      assert 2 == Grid.at(grid, {1, 1})
    end

    test "returns nil if out of bounds" do
      grid = [[1, 2],
                [3, 4]]
      assert nil == Grid.at(grid, {100, 0})
    end
  end

  describe "replace_at" do
    test "replaces element" do
      grid = [[1, 2],
              [3, 4]]

      expected = [[1, 999],
                  [3, 4]]

      assert expected == Grid.replace_at(grid, {1, 1}, 999)
    end

    test "returns grid unmodified when position is out of bounds" do
      grid = [[1, 2],
              [3, 4]]

      assert grid == Grid.replace_at(grid, {100, 100}, 999)
    end
  end

  describe "in_bounds?" do
    test "returns true if in bounds" do
      grid = Grid.create(2, 2)

      assert Grid.in_bounds?(grid, {1, 1})
    end

    test "returns false if greater than length" do
      grid = Grid.create(2, 2)

      assert not Grid.in_bounds?(grid, {2, 2})
    end

    test "returns false if less than 0" do
      grid = Grid.create(2, 2)

      assert not Grid.in_bounds?(grid, {-1, -1})
    end
  end

  describe "get_dimensions" do
    test "gets dimensions" do
      assert {2, 3} == Grid.get_dimensions([[1, 2], [3, 4], [5, 6]])
    end
  end

  describe "slice" do
    test "returns slice of grid" do
      grid = [[1, 2, 3], [3, 4, 5]]
      expected = [[1, 2], [3, 4]]
      assert expected == Grid.slice(grid, {0, 0}, {2, 2})
    end

    test "when amount is greater than number of elements returns to end of list" do
      grid = [[1, 2, 3], [3, 4, 5]]
      assert grid == Grid.slice(grid, {0, 0}, {5, 5})
    end

    test "when given an out of bound start position returns empty grid" do
      grid = [[1, 2, 3], [3, 4, 5]]
      expected = [[1, 2], [3, 4]]
      assert expected == Grid.slice(grid, {0, 0}, {2, 2})
    end
  end

  describe "to_string" do
    test "returns string separated by newlines" do
      assert "12\n34\n" == Grid.to_string([[1, 2], [3, 4]])
    end
  end
end


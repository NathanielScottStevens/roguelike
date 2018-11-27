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
  end
end


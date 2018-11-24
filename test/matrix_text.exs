defmodule MatrixTest do
  use ExUnit.Case
  doctest Matrix

  describe "create" do
    test "makes correct number of rows" do
      subject = Matrix.create({2, 3}) 
      assert Enum.count(subject) == 3
    end

    test "makes correct number of columns" do
      subject = Matrix.create({2, 3}) 
      actual = Enum.at(subject, 0)
      |> Enum.count() 

      assert actual == 2
    end

    test "sets correct default value" do
      subject = Matrix.create({2, 3}, 1) 
      assert subject |> Enum.all?()
    end
  end
end

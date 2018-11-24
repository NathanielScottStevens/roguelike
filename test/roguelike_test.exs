defmodule RoguelikeTest do
  use ExUnit.Case
  doctest Roguelike

  test "greets the world" do
    assert Roguelike.hello() == :world
  end
end

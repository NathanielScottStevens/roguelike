defmodule Matrix do
  def create({width, height}, default \\ nil) do
    List.duplicate(default, width) 
    |> List.duplicate(height)
  end
end

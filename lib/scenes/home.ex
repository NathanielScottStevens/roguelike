defmodule Roguelike.Scene.Home do
  use Scenic.Scene
  alias Scenic.Graph
  import Scenic.Primitives
  alias Roguelike.Tiles

  @graph Graph.build(font_size: 40)

  def init(_, _) do
    state = %{
      graph: @graph
    }

    corner = Tiles.get_tile(:corner)
    vertical = Tiles.get_tile(:vertical)

    state.graph
    |> rect({50, 50}, fill: {:image, corner}, translate: {50, 50})
    |> rect({50, 50}, fill: {:image, vertical}, translate: {50, 100})
    |> rect({50, 50}, fill: {:image, vertical}, translate: {50, 150})
    |> push_graph()

    {:ok, state}
  end
end

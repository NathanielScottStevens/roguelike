defmodule Roguelike.Scene.Home do
  use Scenic.Scene
  alias Scenic.Graph
  import Scenic.Primitives
  alias Roguelike.Tiles

  # @file :code.priv_dir(:roguelike) |> Path.join("/static/fonts/typewriter.ttf")
  # @hash Scenic.Cache.Hash.file!(@file, :sha)

  @graph Graph.build(font_size: 40)
  # @graph Graph.build(font_size: 40, font: @hash)

  def init(_, _) do
    # Scenic.Cache.File.load(@file, @hash)

    state = %{
      graph: @graph
    }


    grass = Tiles.get_tile(:grass)
    path = Tiles.get_tile(:path)

    state.graph
    |> rect({32, 32}, fill: {:image, grass}, translate: {100, 100})
    |> rect({64, 64}, fill: {:image, grass}, translate: {164, 100})
    |> rect({64, 64}, fill: {:image, grass}, translate: {228, 100})
    |> rect({64, 64}, fill: {:image, grass}, translate: {100, 164})
    |> rect({64, 64}, fill: {:image, path}, translate: {164, 164})
    |> rect({64, 64}, fill: {:image, grass}, translate: {228, 164})
    # |> text("Hello", translate: {300, 300})
    |> push_graph()

    {:ok, state}
  end
end

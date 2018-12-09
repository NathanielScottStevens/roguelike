defmodule Roguelike.Tiles do
  use GenServer

  def init(_) do
    image_dir = :code.priv_dir(:roguelike) |> Path.join("/static/images/")
    
    state =
      %{}
      |> add_tile("line")
      |> add_tile("corner")

    {:ok, state}
  end

  defp add_tile(map, name) do
    file = :code.priv_dir(:roguelike) |> Path.join("/static/images/#{name}.png")
    hash = Scenic.Cache.Hash.file!(file, :sha)
    Scenic.Cache.File.load(file, hash)

    Map.put(map, String.to_atom(name), hash)
  end

  def get_tile(name) do
    GenServer.call(__MODULE__, name)
  end

  def handle_call(:vertical, _from, state) do
    {:reply, state.line, state}
  end

  def handle_call(:corner, _from, state) do
    {:reply, state.corner, state}
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], [{:name, __MODULE__}])
  end

end

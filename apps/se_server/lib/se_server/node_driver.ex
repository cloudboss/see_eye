defmodule SeServer.NodeDriver do
  @callback spawn_node(String.t) :: any
end

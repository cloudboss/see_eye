defmodule SeServer.NodeDriver do
  @callback spawn_node(String.t) :: {atom, any}
end

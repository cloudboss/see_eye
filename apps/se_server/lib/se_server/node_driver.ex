defmodule SeServer.NodeDriver do
  @callback spawn_node(String.t) :: {:ok, term} | {:error, term}
end

defmodule SeServer.ProcessNodeDriver do
  @behaviour SeServer.NodeDriver

  require Logger

  def spawn_node(uuid) do
    env = erlexecify_env(
      Map.merge(System.get_env, %{"SE_MASTER" => Atom.to_string(Node.self), "SE_WORKER_ID" => uuid})
    )
    cmd = ['/bin/sh', '-c', 'se_worker start']
    opts = [:monitor, {:env, env}]

    {:ok, _, _} = :exec.run_link(cmd, opts)
    {:ok, nil}
  end

  defp erlexecify_env(env) do
    Enum.map(env, fn {k, v} -> {to_char_list(k), to_char_list(v)} end)
  end
end

defmodule SeServer.DockerNodeDriver do
  @behaviour SeServer.NodeDriver

  require Logger

  def spawn_node(uuid) do
    env = [to_char_list("SE_MASTER=#{Atom.to_string(Node.self)}"),
           to_char_list("SE_WORKER_ID=#{uuid}"),
           to_char_list("SE_KOOKY=#{Atom.to_string(Node.get_cookie)}")]
    cmd = [
      '/usr/bin/docker', 'run', '-d',
      '-e', Enum.at(env, 0),
      '-e', Enum.at(env, 1),
      '-e', Enum.at(env, 2),
      '--net', 'see_eye',
      'se_worker:latest', 'foreground'
    ]
    Logger.debug("Spawning container: '#{Enum.join(Enum.map(cmd, &to_string/1), " ")}'")
    opts = [:sync, :stdout, :stderr, {:env, env}]
    case :exec.run_link(cmd, opts) do
      {:ok, [stdout: stdout]} -> {:ok, stdout}
      {:error, [exit_status: exit_status]} -> {:error, exit_status}
    end
  end
end

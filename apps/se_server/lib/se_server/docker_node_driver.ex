defmodule SeServer.DockerNodeDriver do
  @behaviour SeServer.NodeDriver

  require Logger

  def spawn_node(uuid) do
    env = [to_char_list("SE_MASTER=#{Atom.to_string(Node.self)}"),
           to_char_list("SE_WORKER_ID=#{uuid}")]
    cmd = [
      'docker', 'run', '-d',
      '-e', Enum.at(env, 0),
      '-e', Enum.at(env, 1),
      '--net', 'see_eye',
      'se_worker:latest', 'foreground'
    ]
    opts = [
      {:env, env},
      {:stdout, fn (_, _, out) -> Logger.info(out) end},
      :stderr
    ]
    case :exec.run_link(cmd, opts) do
      {:ok, [stdout: stdout]} -> {:ok, stdout}
      {:error, [exit_status: exit_status]} -> {:error, exit_status}
    end
  end
end

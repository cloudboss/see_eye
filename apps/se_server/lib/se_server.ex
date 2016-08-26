defmodule SeServer do
  use Application
  use Supervisor
  require Logger

  def start(_type, _args) do
    :syn.init
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    Logger.info("Initializing server #{Atom.to_string(Node.self)}")
    children = [
      supervisor(SeServer.JobSupervisor, []),
      Plug.Adapters.Cowboy.child_spec(:http, SeServer.Web.Router, [], [port: 4001])
    ]
    supervise(children, strategy: :one_for_one)
  end
end

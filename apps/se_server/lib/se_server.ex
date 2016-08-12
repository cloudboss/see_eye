defmodule SeServer do
  use Application
  use Supervisor

  def start(_type, _args) do
    :syn.init
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [
      supervisor(SeServer.JobSupervisor, []),
      Plug.Adapters.Cowboy.child_spec(:http, SeServer.Web.Router, [], [port: 4001])
    ]
    supervise(children, strategy: :one_for_one)
  end
end

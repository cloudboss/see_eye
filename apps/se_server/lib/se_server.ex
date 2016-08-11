defmodule SeServer do
  use Application
  use Supervisor

  def start(_type, _args) do
    :syn.init
    Supervisor.start_link(__MODULE__, :ok, name: {:via, :syn, __MODULE__})
  end

  def init(:ok) do
    children = [
      supervisor(SeServer.JobSupervisor, [])
    ]
    supervise(children, strategy: :one_for_one)
  end
end

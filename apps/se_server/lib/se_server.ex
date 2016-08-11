import UUID

defmodule SeServer do
  use Application
  use Supervisor

  def start_job(cmd, args) do
    uuid = UUID.uuid4
    {:ok, _} = Supervisor.start_child({:via, :syn, __MODULE__}, [uuid, cmd, args])
    {:ok, uuid}
  end

  def start(_type, _args) do
    :syn.init
    Supervisor.start_link(__MODULE__, :ok, name: {:via, :syn, __MODULE__})
  end

  def init(:ok) do
    supervise(
      [worker(SeServer.Job, [], restart: :temporary)],
      strategy: :simple_one_for_one
    )
  end
end

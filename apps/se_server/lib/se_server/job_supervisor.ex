import UUID

defmodule SeServer.JobSupervisor do
  use Supervisor

  def start_job(cmd, args) do
    uuid = UUID.uuid4
    {:ok, _} = Supervisor.start_child({:via, :syn, :job_supervisor}, [uuid, cmd, args])
    {:ok, uuid}
  end

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: {:via, :syn, :job_supervisor})
  end

  def init(:ok) do
    supervise(
      [worker(SeServer.Job, [], restart: :temporary)],
      strategy: :simple_one_for_one
    )
  end
end

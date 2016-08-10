defmodule SeWorker do
  use Application
  require Logger

  def get_master do
    master = System.get_env("SE_MASTER")
    if master, do: {:ok, String.to_atom(master)}
  end

  def get_uuid do
    uuid = System.get_env("SE_WORKER_ID")
    if uuid, do: {:ok, uuid}
  end

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    {:ok, master} = get_master
    {:ok, uuid} = get_uuid

    true = Node.connect(master)

    :ok = :syn.init

    Supervisor.start_link(
      [worker(SeWorker.Executor, [uuid])],
      strategy: :one_for_one, name: SeWorker.Supervisor
    )
  end
end

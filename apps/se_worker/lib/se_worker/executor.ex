defmodule SeWorker.Executor do
  use GenServer
  require Logger

  def start_link(uuid) do
    GenServer.start_link(__MODULE__, uuid, name: {:via, :syn, {:worker, uuid}})
  end

  def init(uuid) do
    Logger.info("Initializing executor #{uuid}")
    register(uuid)
    {:ok, uuid}
  end

  defp register(uuid) do
    GenServer.cast({:via, :syn, {:job, uuid}}, {:register, {:worker, uuid}})
  end

  def handle_call({:run, {cmd, args}}, _from, uuid) do
    {output, exitcode} = System.cmd(cmd, args)
    {:reply, {output, exitcode}, uuid}
  end

  def handle_cast({:stop, exitcode}, uuid) do
    :syn.unregister({:worker, uuid})
    Logger.debug("Will halt with exit code #{exitcode}")
    System.halt(exitcode)
  end
end

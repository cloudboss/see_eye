defmodule SeServer.Job do
  use GenServer
  require Logger

  def start_link(uuid, cmd, args) do
    GenServer.start_link(__MODULE__, {uuid, {cmd, args}}, name: {:via, :syn, {:job, uuid}})
  end

  def init({uuid, {cmd, args}}) do
    GenServer.cast({:via, :syn, {:job, uuid}}, :spawn_node)
    {:ok, {uuid, {cmd, args}}}
  end

  def stop(uuid, exitcode) do
    GenServer.cast({:via, :syn, {:worker, uuid}}, {:stop, exitcode})
  end

  def handle_cast({:register, {:worker, uuid}}, state) do
    {_, {cmd, args}} = state
    {output, exitcode} = GenServer.call({:via, :syn, {:worker, uuid}}, {:run, {cmd, args}})
    Logger.debug(output)
    stop(uuid, exitcode)
    {:noreply, state}
  end

  def handle_cast(:spawn_node, state) do
    {uuid, _} = state
    {:ok, factory} = Application.fetch_env(:se_server, :node_driver)
    {:ok, _} = factory.spawn_node(uuid)
    {:noreply, state}
  end
end

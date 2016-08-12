defmodule SeServer.Web.Router do
  import Poison, only: [encode!: 1]
  use Plug.Router

  plug Plug.Logger, log: :debug
  plug Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  plug :match
  plug :dispatch

  get "/api/v1" do
    send_resp(conn, 200, encode!(%{message: "api"}))
  end

  post "/api/v1/jobs" do
    %{"cmd" => cmd, "args" => args} = conn.params
    {:ok, uuid} = SeServer.JobSupervisor.start_job(cmd, args)
    message = %{message: "Job #{uuid} created"}
    send_resp(conn, 202, encode!(message))
  end

  match _ do
    send_resp(conn, 404, encode!(%{error: "Not found"}))
  end
end

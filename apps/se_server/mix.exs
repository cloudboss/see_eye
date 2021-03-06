defmodule SeServer.Mixfile do
  use Mix.Project

  def project do
    [app: :se_server,
     version: "0.1.0",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:cowboy, :erlexec, :logger, :plug, :syn],
     included_applications: [:poison, :uuid],
     mod: {SeServer, []}]
  end

  defp deps do
    [{:cowboy, "== 1.0.4"},
     {:erlexec, "== 1.2.2"},
     {:plug, "== 1.2.0"},
     {:poison, "== 2.2.0"},
     {:syn, "== 1.5.0"},
     {:uuid, "== 1.1.4"}]
  end
end

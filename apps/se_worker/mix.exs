defmodule SeWorker.Mixfile do
  use Mix.Project

  def project do
    [app: :se_worker,
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
    [applications: [:logger, :syn],
     mod: {SeWorker, []}]
  end

  defp deps do
    [{:exrm, "== 1.0.8"},
#     {:se_server, in_umbrella: true},
     {:syn, "== 1.5.0"},
     {:uuid, "== 1.1.4"}]
  end
end

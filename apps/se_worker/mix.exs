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
     included_applications: [:se_server],
     mod: {SeWorker, []}]
  end

  defp deps do
    [{:syn, "== 1.5.0"},
     {:se_server, in_umbrella: true}]
  end
end

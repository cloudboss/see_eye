use Mix.Config

config :se_server, SeServer.Job,
  node_driver: SeServer.ProcessNodeDriver

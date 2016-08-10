use Mix.Config

import_config "../apps/*/config/config.exs"

config :logger, :console,
  format: "$date $time [$level] $metadata$message\n",
  level: :debug

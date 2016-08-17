#!/bin/sh

mix deps.get
mix release

docker build -t se_worker .

#!/bin/sh -e

mix deps.get
mix release
docker build -t se_server .

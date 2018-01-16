#!/bin/sh

docker rm dpos_explorer
docker run --name=dpos_explorer -p 6040:6040 dpos-explorer/explorer

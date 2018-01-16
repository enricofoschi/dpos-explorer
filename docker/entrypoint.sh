#!/bin/sh

# Run Redis server
nohup redis-server &

# Initializing candlestick data
RUN grunt candles:build

# Starting app
node /dpos-explorer/app.js

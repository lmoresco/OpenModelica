#!/bin/bash
./TwoTanks.TanksConnectedPI$(EXT) -interactive > trace-server.txt 2>&1 &
tankspid=$!

./client interactive-simulation-commands.txt > trace-client.txt 2>&1 &
pid=$!
for i in $(seq 1 60); do
    kill -0 $pid >/dev/null 2>&1 || break
    sleep 1
done
kill -0 $pid >/dev/null 2>&1 || kill -TERM $pid >/dev/null 2>&1
kill -TERM $tankspid >/dev/null 2>&1

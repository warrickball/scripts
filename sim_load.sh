#!/usr/bin/env bash

function query {
    echo name 1min 5min 15min
    for x in sim1 sim2 sim3
    do
	ssh $x uptime |& grep load | sed 's/^.*load average://' | sed "s/^/$x /" | sed 's/\,//g'
    done
}

echo
date +"%Y-%m-%d %H:%M:%S"
echo
query | column -t -R 4,11,12,13
echo

#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

if [ -v 1 ]; then
    count=$1
else
    count=10
fi

dotoold &

sleep 0.1

for i in $(seq $count); do
    echo key ctrl+equal | dotoolc
done

trap 'echo key ctrl+0 | dotoolc; kill %1; exit' EXIT
while true; do
    read -p "> " input
done

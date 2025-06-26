#!/bin/bash

ENDPOINT="https://admin.turuncupro.com/clients/system-diagnostics"
SELF=$(basename "$0")

while true; do
    timestamp=$(date +%s)
    payload="{\"timestamp\": $timestamp"

    for script in *.sh; do
        [[ "$script" == "$SELF" ]] && continue
        [[ ! -x "$script" ]] && continue

        key="${script%.sh}"
        value=$("./$script")
        payload+=", \"$key\": \"$value\""
    done

    payload+="}"

    curl -s -X POST -H "Content-Type: application/json" -d "$payload" "$ENDPOINT" >/dev/null

    sleep 30
done

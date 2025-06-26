#!/bin/bash

uptime_info() {
    export LC_ALL=C
    start=$(uptime -s 2>/dev/null)
    [[ -z "$start" ]] && echo null && return

    boot=$(date -u -d "$start" +%s 2>/dev/null)
    now=$(date -u +%s 2>/dev/null)

    [[ -z "$boot" || -z "$now" ]] && echo null && return

    diff=$(( (now - boot) / 60 ))
    echo "$diff"
}

uptime_info


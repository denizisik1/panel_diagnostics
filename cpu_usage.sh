#!/bin/bash

cpu_usage() {
    output=$(top -bn1 2>/dev/null | awk '/^%?Cpu/ {print 100 - $8"%"}')
    [[ -z "$output" ]] && echo null || echo "$output"
}

cpu_usage

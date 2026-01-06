#!/bin/bash

ram_usage() {
    value=$(free 2>/dev/null | awk '/Mem:/ {printf "%.2f", $3/$2 * 100}')
    [[ -z "$value" ]] && echo null || echo "$value"
}

ram_usage

# Output is in GB.

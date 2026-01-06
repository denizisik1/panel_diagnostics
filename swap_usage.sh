#!/bin/bash

swap_usage() {
    value=$(free 2>/dev/null | awk '/Swap:/ {
        if ($2 == 0) {
            print "0.00"
        } else {
            printf "%.2f", $3/$2 * 100
        }
    }')
    [[ -z "$value" ]] && echo null || echo "$value"
}

swap_usage


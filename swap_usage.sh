#!/bin/bash

swap_usage() {
    free | awk '/Swap:/ {if ($2 == 0) {print "0.00%"} else {printf "%.2f%%\n", $3/$2 * 100}}'
}

swap_usage

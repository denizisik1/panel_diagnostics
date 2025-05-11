#!/bin/bash

ram_usage() {
    free | awk '/Mem:/ {printf "%.2f%%\n", $3/$2 * 100}'
}

ram_usage

#!/bin/bash

disk_usage=$(df -h / 2>/dev/null | awk 'NR==2 {print $5}')
[[ -z "$disk_usage" ]] && echo null || echo "$disk_usage"

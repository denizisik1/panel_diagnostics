#!/bin/bash

disk_usage=$(df -h / | awk 'NR==2 {print $5}')

echo "$disk_usage"
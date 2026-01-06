#!/bin/bash

initial=$(awk '/:/ {if ($1 != "lo:") print $1, $2}' /proc/net/dev 2>/dev/null | sed 's/://g')
sleep 1
final=$(awk '/:/ {if ($1 != "lo:") print $1, $2}' /proc/net/dev 2>/dev/null | sed 's/://g')

[[ -z "$initial" || -z "$final" ]] && { echo null; exit; }

total=0
while read -r iface rx1; do
    rx2=$(echo "$final" | awk -v iface="$iface" '$1 == iface {print $2}')
    [[ -z "$rx2" ]] && { echo null; exit; }
    delta=$((rx2 - rx1))
    total=$(echo "$total + ($delta * 8 / 1024)" | bc)
done <<< "$initial"

[[ -z "$total" ]] && echo null || echo "$total"

# Output is in Kbps.

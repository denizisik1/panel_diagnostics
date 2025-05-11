#!/bin/bash

network_usage() {
    initial=$(awk '/:/ {if ($1 != "lo:") print $1, $2, $10}' /proc/net/dev | sed 's/://g')

    sleep 1

    final=$(awk '/:/ {if ($1 != "lo:") print $1, $2, $10}' /proc/net/dev | sed 's/://g')

    echo "Interface       Download (Kbps)       Upload (Kbps)"
    while read -r iface rx1 tx1; do
        while read -r iface2 rx2 tx2; do
            if [ "$iface" == "$iface2" ]; then
                rx_rate=$(bc <<< "scale=2; ($rx2 - $rx1) * 8 / 1024")
                tx_rate=$(bc <<< "scale=2; ($tx2 - $tx1) * 8 / 1024")
                printf "%-15s %-20s %-20s\n" "$iface" "$rx_rate" "$tx_rate"
            fi
        done <<< "$final"
    done <<< "$initial"
}

network_usage

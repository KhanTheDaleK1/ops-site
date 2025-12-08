#!/bin/bash
# Find primary interface
INTERFACE=$(ip route | grep default | awk '{print $5}' | head -n1)
while true; do
    clear
    echo "================================================="
    echo "   WIRESHARK PROTOCOL ANALYZER ($INTERFACE)"
    echo "================================================="
    echo "CAPTURING: Traffic Sample (5s)..."
    # Capture 5 seconds, show hierarchy stats
    # We use sudo here if needed, but the group membership should handle it
    tshark -i "$INTERFACE" -a duration:5 -z io,phs -q
    echo ""
    echo "Scanning next block..."
    sleep 2
done

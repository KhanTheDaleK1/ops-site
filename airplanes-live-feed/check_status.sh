#!/bin/bash
echo "--- Service Status ---"
sudo systemctl status airplanes-feed --no-pager | head -n 5
echo ""
echo "--- MLAT Status ---"
sudo systemctl status airplanes-mlat --no-pager | head -n 5
echo ""
echo "--- Network Connections ---"
netstat -tn | grep -E '30004|31090' | grep 'ESTABLISHED'
if [ $? -eq 0 ]; then
    echo ">> SUCCESS: Connected to Airplanes.live servers."
else
    echo ">> WARNING: No active connection found yet."
fi

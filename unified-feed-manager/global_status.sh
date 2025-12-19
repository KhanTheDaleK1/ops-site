#!/bin/bash
echo "--- Service Status ---"
systemctl is-active airplanes-feed adsbexchange-feed piaware fr24feed
echo "--- Connections to Local Hub (30005) ---"
netstat -tn | grep '127.0.0.1:30005' | grep 'ESTABLISHED' | wc -l | awk '{print $1 " clients connected (Target: 4)"}'

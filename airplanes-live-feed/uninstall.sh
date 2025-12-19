#!/bin/bash
echo ">> Removing Airplanes.live services..."
if [ -f "/usr/local/share/airplanes/uninstall.sh" ]; then
    sudo bash /usr/local/share/airplanes/uninstall.sh
else
    sudo systemctl disable --now airplanes-feed
    sudo systemctl disable --now airplanes-mlat
    echo ">> Services disabled manually."
fi

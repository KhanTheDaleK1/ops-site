#!/bin/bash
echo ">> Preparing to install Airplanes.live feeder..."

# Check for curl
if ! command -v curl &> /dev/null; then
    echo ">> curl is missing. Installing..."
    sudo apt-get update && sudo apt-get install -y curl
fi

# Download and run the official install script
echo ">> Downloading official installer..."
INSTALL_SCRIPT="/tmp/airplanes_install.sh"
curl -L -o "$INSTALL_SCRIPT" https://raw.githubusercontent.com/airplanes-live/feed/main/install.sh

if [ -f "$INSTALL_SCRIPT" ]; then
    echo ">> Executing installer..."
    sudo bash "$INSTALL_SCRIPT"
    echo ">> Installation process finished."
else
    echo "ERROR: Failed to download installer."
    exit 1
fi

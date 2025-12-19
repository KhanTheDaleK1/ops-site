#!/bin/bash
CONFIG_FILE="$HOME/.project_host_target"
PROJECT_ROOT="$(head -n 1 "$CONFIG_FILE")"
SCRIPT_DIR="$PROJECT_ROOT/3. ops.beechem.site/unified-feed-manager"
echo ">> [1/4] Airplanes.live"
if ! systemctl is-active --quiet airplanes-feed; then
    curl -L -o /tmp/airplanes.sh https://raw.githubusercontent.com/airplanes-live/feed/main/install.sh
    sudo bash /tmp/airplanes.sh
fi
echo ">> [2/4] ADS-B Exchange"
if ! systemctl is-active --quiet adsbexchange-feed; then
    curl -L -o /tmp/axfeed.sh https://www.adsbexchange.com/feed.sh
    sudo bash /tmp/axfeed.sh
fi
echo ">> [3/4] FlightAware"
if ! command -v piaware &> /dev/null; then
    wget -O /tmp/piaware.deb https://www.flightaware.com/adsb/piaware/files/packages/pool/piaware/p/piaware-repository/piaware-repository_7.2_all.deb
    sudo dpkg -i /tmp/piaware.deb
    sudo apt-get update && sudo apt-get install -y piaware
    sudo bash "$SCRIPT_DIR/configure_piaware.sh"
fi
echo ">> [4/4] FlightRadar24"
if ! command -v fr24feed &> /dev/null; then
    echo "Starting FR24 Installer. Select 'ModeS Beast TCP' -> '127.0.0.1' -> '30005'."
    sudo bash -c "$(wget -O - https://repo-feed.flightradar24.com/install_fr24_rpi.sh)"
fi
echo "Done."

#!/bin/bash
# ==========================================
# Script: full_service_scan.sh
# Purpose: Deep scan of open ports, running processes, and binary locations.
#          Identifies "Purpose" based on the Cyber-Ops stack.
# ==========================================

# 1. Configuration & Storage
CONFIG_FILE="$HOME/.project_host_target"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "ERROR: $CONFIG_FILE not found."
    exit 1
fi
PROJECT_ROOT="$(head -n 1 "$CONFIG_FILE")"
SCAN_FILE="$PROJECT_ROOT/system_scan_$(date +%Y%m%d_%H%M%S).txt"

echo "INITIATING DEEP SYSTEM SCAN..."
echo "Target Host: $(hostname)"
echo "Output Log:  $SCAN_FILE"
echo "-----------------------------------------------------------------------------------------------------------------" | tee -a "$SCAN_FILE"
printf "% -10s | % -20s | % -45s | % -30s\n" "PORT" "SERVICE" "BINARY PATH" "LIKELY PURPOSE" | tee -a "$SCAN_FILE"
echo "-----------------------------------------------------------------------------------------------------------------" | tee -a "$SCAN_FILE"

# 2. Scanning Logic
# ss arguments: -l (listening), -n (numeric), -t (tcp), -u (udp), -p (processes)
# We skip localhost-only DNS (53 on 127.0.0.53) to reduce noise
sudo ss -lntup | grep -v "127.0.0.53" | awk 'NR>1 {print $1, $5, $7}' | while read -r TYPE ADDRESS PROC_INFO; do
    
    # 3. Extract Port
    # Address is IP:PORT or *:PORT. We want the last field.
    PORT=$(echo "$ADDRESS" | awk -F':' '{print $NF}')
    
    # 4. Extract Process Info
    # Format: users:(("process_name",pid=123,fd=4))
    PID=$(echo "$PROC_INFO" | grep -o 'pid=[0-9]*' | cut -d= -f2)
    PROCESS_NAME=$(echo "$PROC_INFO" | grep -o '"[^" ]*"' | tr -d '"' | head -n 1)

    if [ -z "$PID" ]; then
        continue 
    fi

    # 5. Resolve Binary Path
    # /proc/PID/exe is a symlink to the actual binary
    EXE_PATH=$(sudo readlink -f /proc/$PID/exe 2>/dev/null)
    # Fallback to cmdline if exe is unreadable (e.g., kernel threads or script wrappers)
    if [ -z "$EXE_PATH" ]; then
        EXE_PATH=$(cat /proc/$PID/cmdline 2>/dev/null | tr '\0' ' ' | awk '{print $1}')
    fi

    # 6. Determine Purpose (Cyber-Ops Intelligence)
    PURPOSE="Unknown Service"
    CMDLINE=$(cat /proc/$PID/cmdline 2>/dev/null | tr '\0' ' ')

    case "$PROCESS_NAME" in
        "lighttpd")      PURPOSE="Web Dashboard (Main HTTP)" ;; 
        "sshd")          PURPOSE="SSH / VS Code Tunnel" ;; 
        "readsb")        PURPOSE="ADS-B Decoder (SDR Data)" ;; 
        "tar1090")       PURPOSE="Map Interface Backend" ;; 
        "ttyd")          PURPOSE="Web Terminal Service" ;; 

            if [[ "$CMDLINE" == *"antenna_lab"* ]] || [[ "$CMDLINE" == *"app.py"* ]]; then
                PURPOSE="Antenna Lab (Physics Engine)"
            elif [[ "$CMDLINE" == *"glances"* ]]; then
                PURPOSE="Glances Telemetry"
            elif [[ "$CMDLINE" == *"mlat-client"* ]]; then
                PURPOSE="MLAT Sync Client"
            elif [[ "$CMDLINE" == *"feed-adsbx"* ]]; then
                PURPOSE="ADS-B Exchange Feeder"
            fi
            ;; 
        "cloudflared")   PURPOSE="Cloudflare Tunnel (Remote)" ;; 
        "rustdesk")      PURPOSE="Remote Desktop Service" ;; 
        "avahi-daemon")  PURPOSE="mDNS / Service Discovery" ;; 
    esac

    # 7. Output Row
    printf "% -10s | % -20s | % -45s | % -30s\n" "$PORT" "$PROCESS_NAME" "${EXE_PATH:0:45}" "$PURPOSE" | tee -a "$SCAN_FILE"

done | sort -n -k1 | uniq

echo "-----------------------------------------------------------------------------------------------------------------" | tee -a "$SCAN_FILE"
echo "SCAN COMPLETE. Saved to: $SCAN_FILE"

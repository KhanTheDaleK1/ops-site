#!/bin/bash
# Launch Slurm in graph mode
# -i: Interface
# -d: Delay (2 seconds)
# -c: Classic colors
echo "Initializing Network Scope..."
sleep 1
slurm -i wlx98254a7413d1 -d 2

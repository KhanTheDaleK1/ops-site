# Workspace Projects

This directory contains the active software engineering projects and operational tools for the **Evan-Beechem** ecosystem.

## Active Projects

### 1. [Project Overwatch](./project_overwatch/)
**Tactical Air Traffic Radar**
A specialized, "Night Vision" style air traffic monitor. It features automatic military/emergency identification (IFF), real-time weather overlays, and integration with the local intelligence database.

### 2. [Station Dashboard](./station_dashboard/)
**Central Command Interface**
The primary landing page for the local operations center. It provides quick links to all subsystems (Ignition, OctoPrint, Radar) and displays high-level status metrics.

### 3. Intel Gatherer (`intel_gatherer.py`)
**Background Intelligence Service**
A Python service that runs in the background. It watches the local ADSB feed, detects new aircraft, and automatically fetches registration details (from Airplanes.live) and photos (from Planespotters.net). It saves these as static files in `intel_images/` for instant access by the dashboards.

### 4. [Cyber Ops Dashboard](./cyber-ops-dashboard/)
**System Monitoring**
A comprehensive dashboard for monitoring server health, network latency, and service status.

### 5. [Evan-Beechem](./Evan-Beechem/)
**Public Portfolio**
The source code for the public-facing portfolio website, including the "Matrix" rain effect and project showcases.

## Common Utilities
*   **`intel_gatherer.py`**: The core data enrichment service.
*   **`intel_images/`**: The shared data store for aircraft metadata and photos.
*   **`Active/aircraft_tracking/`**: Configuration for the ADSB receiver hardware.

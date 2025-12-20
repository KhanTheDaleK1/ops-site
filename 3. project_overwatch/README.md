# Project Overwatch

Project Overwatch is a sophisticated air traffic visualization tool designed for tactical monitoring and analysis of real-time flight data. It provides a specialized user interface to display aircraft positions, flight paths, and supplementary intelligence, making it an essential component of the Ops Site for situational awareness.

## 🚀 Purpose

This module is dedicated to presenting an operational overview of air traffic. It consumes external data feeds and internal intelligence to render a dynamic and interactive radar-like display, crucial for tracking airborne assets and identifying points of interest.

## 📁 Components

*   **`index.html`**: The main entry point for the Project Overwatch web application. It structures the user interface and loads the necessary styles and scripts.
*   **`radar.js`**: The core JavaScript logic responsible for fetching, processing, and rendering real-time aircraft data on the tactical display. It handles map interactions, data overlays, and visual updates.
*   **`style.css`**: Defines the visual styling and layout for the Project Overwatch interface, contributing to its distinct tactical aesthetic.
*   **`intel_gatherer.py` (Expected):** This Python script is crucial for populating the `/intel/` data endpoint, providing supplementary intelligence data that `radar.js` integrates into the display. *(Note: A placeholder for this script has been created, and its full implementation is pending.)*

## 📊 Data Sources

Project Overwatch relies on the following data feeds:

*   **`tar1090`:** Real-time Mode S/ADS-B aircraft data, typically served from a local or networked `tar1090` instance.
*   **`/intel/` Endpoint:** An internal API endpoint (expected to be served by `intel_gatherer.py`) that provides supplementary intelligence related to aircraft or specific regions.

## 🛠️ Setup and Usage

To run Project Overwatch:

1.  **Ensure Data Feeds are Active:** Project Overwatch expects a running `tar1090` instance and the `/intel/` endpoint (populated by `intel_gatherer.py`) to be accessible.
2.  **Open `index.html`:** Simply open `index.html` in your web browser. For development, serving it via a local HTTP server is recommended.
3.  **Integration with Ops Site:** This module is typically integrated as an `iframe` within the main `www/index.html` dashboard of the Ops Site.

## 🤝 Contributing

Please refer to the main [CONTRIBUTING.md](../../CONTRIBUTING.md) for general contribution guidelines. For this module, contributions are welcome for enhancing the UI, improving data processing in `radar.js`, and especially for implementing and extending `intel_gatherer.py`.

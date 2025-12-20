# Ops Site

The `Ops Site` is a comprehensive operational platform designed for monitoring, data analysis, and automation in a dynamic environment. It serves as a centralized hub for various tools and services, focusing on real-time flight tracking, network diagnostics, and system management. This repository functions as a monorepo, housing several interconnected modules that contribute to the overall operational intelligence.

## 🚀 Project Overview

The core mission of the Ops Site is to provide real-time insights and control over critical operational data. It integrates custom-developed applications with existing open-source tools to create a powerful, unified dashboard. Key functionalities include:

*   **Real-time Flight Tracking:** Monitoring of live aircraft data, including positions, altitudes, and flight paths.
*   **Network Diagnostics:** Tools for analyzing network traffic, identifying issues, and ensuring connectivity.
*   **Automated Feed Management:** Scripts for setting up, managing, and monitoring various data feeds.
*   **System Monitoring:** Services to oversee the health and performance of underlying systems.
*   **Interactive Web Dashboards:** User-friendly interfaces for visualizing data and interacting with the operational tools.

## 🏛️ Architecture

The Ops Site is built with a modular architecture, allowing components to operate independently while contributing to a cohesive system.

*   **Main Web Portal (`www/`):** The primary user interface, acting as a dashboard aggregator. It uses `iframes` to embed views from other modules and external services (e.g., `tar1090`, `graphs1090`).
*   **Project Overwatch (`3. project_overwatch/`):** A sophisticated air traffic visualization tool with a tactical user interface. It consumes real-time aircraft data and relies on an `/intel/` data endpoint for supplementary aircraft details (which is currently expected to be populated by `intel_gatherer.py`).
*   **Flight Logger (`flight_logger/`):** A Python Flask application responsible for logging flight data into a database and providing an API for historical flight information.
*   **Network Tools (`net_tools/`):** A collection of shell scripts for advanced network analysis, such as traffic visualization and packet capturing.
*   **Unified Feed Manager (`unified-feed-manager/`):** Shell scripts designed to configure and manage various data feeds, like those for flight tracking.
*   **System Services (`services/`):** Contains systemd service unit files for managing background processes and ensuring continuous operation of critical components.

## 📦 Setup and Installation

Due to the modular nature of this project, setup involves configuring individual components.

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/KhanTheDaleK1/ops-site.git
    cd ops-site
    ```
2.  **Python Dependencies:**
    Navigate to the Python-based modules (e.g., `flight_logger/`) and install their respective dependencies from `requirements.txt`.
    ```bash
    # Example for flight_logger
    cd flight_logger
    pip install -r requirements.txt
    cd ..
    ```
3.  **Web Assets:**
    Web components (`www/`, `3. project_overwatch/`) are primarily static HTML/CSS/JS. No specific `npm install` is currently required unless `package.json` is introduced for frontend tooling.
4.  **Shell Scripts:**
    Many operational tasks are managed via shell scripts. Review the scripts in `airplanes-live-feed/`, `net_tools/`, and `unified-feed-manager/` for specific usage instructions.
5.  **System Services:**
    The `services/` directory contains systemd unit files. These can be deployed to your Linux system to manage background tasks.
    ```bash
    # Example deployment for a service
    sudo cp services/your-service.service /etc/systemd/system/
    sudo systemctl enable your-service.service
    sudo systemctl start your-service.service
    ```
6.  **Missing Components:**
    Note that `3. project_overwatch` expects an `intel_gatherer.py` script to populate its `/intel/` endpoint. A placeholder exists, but its full implementation is pending.

## 🛠️ Usage

*   **Access the Main Dashboard:** Open `www/index.html` in your web browser, or host it with a simple HTTP server.
*   **Flight Logger:** Run `flight_logger/app.py` (e.g., using `flask run`) to start the Flask application.
*   **Network Tools:** Execute scripts in `net_tools/` as needed for diagnostics.
*   **Feed Management:** Use scripts in `unified-feed-manager/` to configure and maintain data feeds.

## 🤝 Contributing

We welcome contributions! Please see our [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines on how to contribute to specific modules and maintain consistency across the monorepo.

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

# Codex Documentation: Ops Site

This document provides technical details about the `Ops Site` project for developers.

## Project Structure

The project is a monorepo containing several distinct but related operational tools:

*   `.git/`: Git version control files.
*   `3. project_overwatch/`: A project monitoring tool with a radar-like interface.
*   `airplanes-live-feed/`: Scripts for setting up and managing a live airplane data feed.
*   `flight_logger/`: A Python/Flask application for logging and tracking flights.
*   `net_tools/`: Network analysis and visualization scripts.
*   `services/`: `systemd` service files for running background processes.
*   `unified-feed-manager/`: Scripts for installing and managing various data feeds.
*   `www/`: The frontend website for the ops site.
*   `GEMINI.md`: Gemini interaction guide.
*   `robots.txt`: Search engine indexing rules.
*   `sitemap.xml`: Sitemap for crawlers.

## Key Files

*   `www/index.html`: The main entry point for the ops website.
*   `flight_logger/app.py`: The main application file for the flight logger.
*   `unified-feed-manager/install_all_feeds.sh`: A script to automate the installation of all data feeds.
*   `airplanes-live-feed/setup_feed.sh`: A script to set up the airplane live feed.

## Development Setup

The project is a mix of shell scripts, Python applications, and a static website. Each subdirectory is a self-contained micro-project. Refer to the individual subdirectories for more specific development information.

*This document is intended for developers and contributors.*

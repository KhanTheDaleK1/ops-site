# Contributing to Ops Site

We welcome contributions to the Ops Site project! This is a modular monorepo, so contributions can range from individual scripts to web components or Python applications. To ensure a smooth and effective collaboration, please follow these guidelines.

## How Can I Contribute?

### Reporting Bugs

*   Ensure the bug hasn't already been reported.
*   Clearly describe the bug, including steps to reproduce it, expected behavior, and actual behavior.
*   Provide any relevant error messages or logs.
*   Specify which module (e.g., `flight_logger`, `net_tools`, `www`) the bug relates to.

### Suggesting Enhancements

*   Explain why this enhancement would be useful.
*   Describe the proposed solution in detail.
*   Indicate which module(s) would be affected.

### Code Contributions (General)

*   Adhere to the established coding style of the respective module (Python, JavaScript, Shell Script).
*   Include appropriate documentation within your code.
*   Write tests for new features or bug fixes where applicable.

### Code Contributions (Python Modules)

*   Ensure you have a `requirements.txt` file listing all Python dependencies for your module.
*   Adhere to PEP 8 style guidelines.

### Code Contributions (Web Modules)

*   For web-related changes (HTML, CSS, JavaScript), please ensure your code adheres to standard web development practices.
*   Avoid duplicating existing functionality (e.g., ensure JavaScript utility functions are shared).

### Code Contributions (Shell Scripts & Services)

*   Ensure scripts are robust, idempotent, and handle errors gracefully.
*   Provide clear comments for complex logic.
*   If adding a new service, provide corresponding systemd unit files or clear instructions for service management.

## Project Structure

Please familiarize yourself with the modular structure of this repository. Contributions should generally be confined to their respective module directories (e.g., `flight_logger`, `net_tools`, `www`, `3. project_overwatch`).

## Code of Conduct

Please note that this project is released with a Contributor Code of Conduct. By participating in this project, you agree to abide by its terms.

Thank you for contributing!

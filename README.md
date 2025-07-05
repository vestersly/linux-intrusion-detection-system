# HIDS-Toolkit: A Modular Bash-based Intrusion Detection System

![Bash](https://img.shields.io/badge/Language-Bash-blue?style=for-the-badge&logo=gnu-bash)
![Linux](https://img.shields.io/badge/Platform-Linux-yellow?style=for-the-badge&logo=linux)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

A comprehensive, modular Host-based Intrusion Detection System (HIDS) developed as a team project to monitor Linux systems for unauthorized activity and potential security breaches. This toolkit establishes a secure baseline of the system and uses scheduled, automated checks to detect and report deviations.

---

### 演示

*A short GIF demonstrating a clean scan, an attack, the alert, and the cleanup.*
**[INSERT YOUR DEMO GIF HERE]**

---

### ✨ Key Features

*   **File Integrity Monitoring (FIM):** Detects unauthorized modifications, additions, or deletions of critical system files using `sha256sum` checksums.
*   **User & Group Monitoring:** Audits `/etc/passwd`, `/etc/shadow`, and `/etc/group` to detect illicit user account creation or modification.
*   **Log Analysis Engine:** Scans system logs (e.g., `/var/log/auth.log`) for suspicious keywords like "Failed password" or "authentication failure".
*   **Process & Network Auditing:** Identifies processes running from unusual locations (like `/tmp`) and detects unauthorized listening network ports.
*   **System Configuration Checks:** Monitors critical configuration files, such as the root user's crontab, for unauthorized changes.
*   **System Health Monitoring:** Tracks CPU load, memory usage, and disk space against configurable thresholds to prevent performance-related outages.
*   **Automated Scanning & Alerting:** Utilizes `cron` for continuous, automated monitoring and sends detailed email alerts upon threat detection.

---

### 🏛️ System Architecture

The HIDS-Toolkit is built on a modular architecture to ensure scalability and maintainability. A central controller script, `hids-toolkit.sh`, orchestrates the execution of various monitoring modules, each responsible for a specific security domain.

```
hids-toolkit/
├── hids-toolkit.sh         # Main controller script
├── hids.conf               # Unified configuration for all modules
├── modules/                # Directory for all monitoring logic
│   ├── 10_fim.sh
│   ├── 20_users.sh
│   ├── 30_logs.sh
│   ├── 40_processes_network.sh
│   ├── 50_system_config.sh
│   └── 60_resource_monitor.sh
├── db/                       # Stores all baseline state files
├── reports/                  # Contains timestamped scan reports
└── README.md
```

---

### 🛠️ Tech Stack

*   **Primary Language:** Bash Scripting
*   **Core Utilities:** `grep`, `awk`, `sed`, `diff`, `sha256sum`, `ps`, `ss`, `free`, `df`
*   **Automation:** `cron`
*   **Environment:** Linux (tested on Kali Linux and Ubuntu)

---

### 🚀 Getting Started

Follow these steps to deploy the HIDS-Toolkit on your own Linux system.

#### Prerequisites
*   A Linux-based OS
*   `sudo` privileges
*   `mailutils` for email alerts (`sudo apt install mailutils`)

#### 1. Clone the Repository
```bash
git clone https://github.com/YOUR_USERNAME/hids-toolkit.git
cd hids-toolkit
```

#### 2. Configure the Toolkit
Open `hids.conf` and set your email address for alerts. Adjust any thresholds as needed.
```ini
# Change this line
REPORT_EMAIL="your-email@example.com"
```

#### 3. Set Permissions
Make the main controller script executable.
```bash
chmod +x hids-toolkit.sh
```

---

### 📖 Usage Guide

#### 1. Initialize the Baseline
Run the `init` command on a known-clean system. This creates the secure baseline that all future scans will compare against.
```bash
sudo ./hids-toolkit.sh init
```

#### 2. Perform a Manual Check
Run a manual security scan at any time.
```bash
sudo ./hids-toolkit.sh check
```
The output will be displayed on the screen and saved to a new file in the `reports/` directory. If an alert is found, an email will be sent.

#### 3. Automate with Cron
To set up automated scanning every 5 minutes, edit the root crontab:
```bash
sudo crontab -e
```
Add the following line, making sure to use the absolute path to your project directory:
```cron
*/5 * * * * cd /home/papi-kali/hids-toolkit && ./hids-toolkit.sh check
```

---

### 🤝 The Team

This project was a collaborative effort, and its success is a testament to our teamwork.

*   **Yuri (Team Lead & System Health Specialist):** Guided the project vision and developed the resource monitoring module.
*   **Sylvester (HIDS Core Architect):** Designed the modular framework, the controller, and the core security detection modules.
*   **Patrick (Lead Security Analyst & Tool Developer):** Created advanced standalone tools for deep-dive log and process analysis.
*   **Asiye (QA & Documentation Lead):** Led the testing efforts, validated functionality, and ensured the project was comprehensively documented.

---

### 📄 License
This project is licensed under the MIT License. See the `LICENSE` file for details.

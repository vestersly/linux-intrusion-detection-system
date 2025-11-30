# Linux Intrusion Detection System (HIDS)

## Overview
This project implements a modular Host-Based Intrusion Detection System (HIDS) written in Bash for Linux environments.

It was developed as a collaborative security engineering project at BeCode Brussels and focuses on real-time detection of unauthorized system changes, suspicious user activity, and log anomalies.

---

## Features

- File integrity monitoring using SHA-256 checksums
- Detection of unauthorized file modification and creation
- User and account auditing via /etc/passwd and /etc/shadow
- Log anomaly detection using grep
- Network and process analysis using ss and ps
- Automated alert scheduling with cron jobs
- Modular design for easy extension and testing
- Baseline generation and continuous monitoring mode

---

## Project Structure

hids-toolkit.sh # Main controller script
hids.conf # Configuration file
/modules/ # Detection modules
/db/ # Baseline fingerprint hashes
/reports/ # Scan logs and alerts


---

## Testing Environment

- Kali Linux (monitored host)
- Ubuntu Linux (attack simulation)

The toolkit was tested with simulated attacks to verify:
- Detection of unauthorized file modifications
- Identification of suspicious account changes
- Logging and reporting of security anomalies

---

## Team & Contributions

This was a collaborative team project:

- Yuri — Team Lead & system monitoring
- **Sylvester — Core Architect (System integration & testing)**
- Patrick — Log analysis & user auditing
- Asiye — QA, automation & documentation

---

## Learning Objectives

This project was developed to:
- Practice defensive security techniques
- Apply Linux security fundamentals
- Understand host level monitoring concepts
- Build modular detection logic
- Automate reporting and alerting mechanisms

---

## Author
Sylvester Awungjia  
Cybersecurity graduate | AWS Certified Solutions Architect



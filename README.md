## Overview
This project implements a **modular, high-fidelity Host-Based Intrusion Detection System (HIDS)** designed for **continuous, automated security monitoring** on Linux systems.

The system focuses on detecting **unauthorized system state changes and persistence mechanisms** in environments where availability and integrity are critical.  
It was developed as a **collaborative security engineering project** within a controlled professional training context, with all organizational identifiers intentionally omitted in accordance with confidentiality and responsible disclosure practices.

---

## ⚡ Professional Security Modules

### Cryptographic Integrity Monitoring (FIM)
- Uses SHA-256 fingerprinting to detect unauthorized creation or modification of protected system files
- Enables state-based detection rather than reliance on log events alone

### Persistence Detection
- Monitors privileged scheduled tasks (e.g. root crontab) to detect unauthorized persistence mechanisms
- Targets low-noise techniques commonly used in real-world intrusions

### Resource-Aware Monitoring
- Includes system health checks to validate that monitoring activities do not impact availability
- Validated during testing to operate with **low CPU and memory utilization**

---

## 📩 Automated Alerting & Continuous Operations
The HIDS is engineered for **autonomous operation** to reduce Mean Time to Detect (MTTD) and minimize manual intervention.

### Scheduled Auditing
- Monitoring cycles are executed automatically via cron
- Each cycle compares current system state against a trusted baseline

### Incident Notification
- High-severity detections trigger structured reports
- **Automated email notifications** are sent to the security operator via SMTP relay

### Operational Validation
During controlled testing scenarios, the system successfully:
- Detected unauthorized configuration and file integrity changes
- Identified persistence-related modifications
- Delivered immediate alert notifications to the security operator

All validation artifacts are documented in a sanitized form to preserve confidentiality.



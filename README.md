# Linux Intrusion Detection System (HIDS)

## Overview
This project implements a **modular, high-fidelity Host-Based Intrusion Detection System (HIDS)** designed for **continuous, automated security monitoring** on Linux systems.

The system focuses on detecting **unauthorized system state changes and persistence mechanisms** in environments where **integrity, availability, and operational reliability** are critical.

It was developed as part of a **professionally delivered security engineering engagement**, executed within a structured training program and applied to a **real operational context**. The solution was **designed, tested, validated, and adopted for practical use** under defined security objectives.

All organizational identifiers, infrastructure details, and environment-specific metadata have been **intentionally omitted** in accordance with **confidentiality requirements, contractual obligations, and responsible disclosure practices**.

---

## ⚡ Professional Security Capabilities

### Cryptographic Integrity Monitoring (FIM)
- Uses **SHA-256 cryptographic fingerprints** to detect unauthorized creation or modification of protected system files
- Enables **state-based detection**, independent of log integrity

### Persistence Detection
- Monitors privileged scheduled tasks (e.g. **root crontab**)
- Detects unauthorized persistence mechanisms commonly used in real-world intrusions and post-exploitation activity

### Resource-Aware Monitoring
- Includes system health checks to preserve system availability
- Validated during testing to operate with **low CPU and memory utilization**, suitable for continuous operation on production-like systems

---

## 🔄 Continuous Monitoring & Automation Pipeline
The HIDS operates as a **continuous, automated security monitoring pipeline**, not as a manual or ad-hoc scanning tool.

### Execution Model
1. A trusted baseline of system state is generated and securely stored
2. Monitoring checks execute automatically on a **scheduled basis via cron**
3. Current system state is compared against the trusted baseline
4. Deviations trigger automated reporting and notification workflows

This design enables **hands-off operation**, early detection of persistence techniques, and reduced **Mean Time To Detect (MTTD)** without constant human intervention.

---

## 📩 Operational Validation & Alerting Pipeline
The validation below reflects the **collective implementation and testing efforts of the project team**.

The alert shown was generated during a **scheduled automated execution cycle** and is presented in a **sanitized representative form**.

### HIDS ALERT — Automated System Audit
- **Trigger Type:** File Integrity Monitoring (FIM) & Persistence Detection
- **Severity:** High
- **Automated Response:** Execution → Report generation → SMTP notification

**Security Audit Summary**
- **File Integrity:** 🚩 ALERT (Unauthorized modification detected in protected system area)
- **Persistence Check:** 🚩 ALERT (Privileged scheduled task modification detected)
- **System Health:** ✅ OK (Low CPU load | Low memory utilization)
- **Network / Processes:** ✅ OK (No unauthorized ports or processes observed)

> **Operational Insight**  
> This validation confirms end-to-end automation with **high-fidelity detection** and **immediate notification**, while maintaining a **minimal operational footprint** suitable for production-like environments.

---

## 🔐 Security Architecture Mapping (McCumber Cube)

| Dimension | Application in This System |
|--------|-----------------------------|
| **Technology** | Automated integrity scanning and persistence detection with controlled notification channels |
| **Process** | Scheduled execution and defined *human-in-the-loop* alert workflow |
| **People** | Actionable, summarized alerts delivered to the security operator for rapid decision-making |

---

## 🎯 CIA Mapping

- **Confidentiality:** Controlled alert content and anonymized documentation
- **Integrity:** Detection of unauthorized file and scheduled task modifications
- **Availability:** Continuous monitoring with low operational overhead

---

## 🧪 Testing & Validation Environment
The system was validated using **controlled attack simulations** across multiple Linux hosts to verify detection accuracy and operational safety.

- **Monitored Host:** Linux system under active protection
- **Attack Simulation Host:** Separate Linux system used to generate controlled test events

Validation scenarios included:
- Unauthorized file creation and modification
- Privileged scheduled task tampering
- Log, process, and system state inspection
- Continuous execution under constrained system resources

---

## 📁 Project Structure



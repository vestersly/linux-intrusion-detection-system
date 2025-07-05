# 🛡 Linux Intrusion Detection System (HIDS) – Final Collaborative Edition

> 📍 Developed by: **Yuri, Sylvester (Core Architect), Patrick, Asiye**  
> 🏫 Project presented at **BeCode Brussels, July 2025**

---

## 🔥 Project Summary (English)

This project showcases a collaborative, modular **Host-Based Intrusion Detection System (HIDS)** built entirely in **Bash** for Linux environments. Designed to detect system compromise, unauthorized access, and configuration changes in real-time.

### 🔐 Key Features

- ✅ Real-time file integrity monitoring using `sha256sum` and `diff`
- ✅ User account auditing of `/etc/passwd` and `/etc/shadow`
- ✅ Log and process anomaly detection using `grep`, `ss`, and `ps`
- ✅ Automated email alerts via `cron`
- ✅ Modular structure for easy extension and testing
- ✅ Baseline creation (`init`) and intrusion checks (`check`)

### 🧪 Testing Environment

- **Kali Linux (Victim):** HIDS installed and monitored
- **Ubuntu (Attacker):** Simulated attacker machine
- ✅ Real-time detection of unauthorized file creation and system changes

### 📂 Toolkit Structure

- `hids-toolkit.sh` – Main script controller
- `hids.conf` – Configuration file
- `/modules/` – Modular scans (file, users, logs, processes, etc.)
- `/db/` – Fingerprint database (baselines)
- `/reports/` – Auto-generated scan logs

### 👥 Contributors & Roles

- **Yuri** – Team Lead & System Health Monitoring  
- **Sylvester** – Core Architect (Framework Integration & Testing)  
- **Patrick** – Log Analysis & User Monitoring  
- **Asiye** – QA, Automation & Documentation

### 📸 Demo & Source Code

🔗 GitHub Repository: [linux-intrusion-detection-system](https://github.com/vestersly/linux-intrusion-detection-system)

---

## 🇫🇷 Résumé du Projet (French)

Ce projet présente un **Système de Détection d'Intrusion Hôte (HIDS)** modulaire, collaboratif et automatisé, codé entièrement en **Bash** pour les environnements Linux. Il détecte efficacement les activités non autorisées et les changements critiques du système.

### 🔐 Fonctionnalités Principales

- ✅ Surveillance de l’intégrité des fichiers (`sha256sum`, `diff`)
- ✅ Audit des comptes utilisateurs (`/etc/passwd`, `/etc/shadow`)
- ✅ Analyse des journaux et processus (`grep`, `ss`, `ps`)
- ✅ Alertes envoyées automatiquement par e-mail (via `cron`)
- ✅ Structure modulaire facilement extensible
- ✅ Création de base (`init`) et vérification (`check`)

### 🧪 Environnement de Test

- **Kali Linux (Cible)** : Déploiement du HIDS  
- **Ubuntu (Attaquant)** : Machine d'attaque simulée  
- ✅ Détection en temps réel des modifications non autorisées

### 📂 Structure de l’Outil

- `hids-toolkit.sh` – Contrôleur principal  
- `hids.conf` – Fichier de configuration  
- `/modules/` – Modules de vérification  
- `/db/` – Base de données d’empreintes  
- `/reports/` – Rapports d’analyse générés automatiquement  

### 👥 Membres de l’Équipe

- **Yuri** – Chef d’équipe & Surveillance Système  
- **Sylvester** – Architecte Principal (Intégration & Tests)  
- **Patrick** – Analyste de Journaux & Comptes  
- **Asiye** – QA, Automatisation & Documentation

---



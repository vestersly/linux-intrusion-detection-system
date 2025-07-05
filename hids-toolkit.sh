#!/bin/bash

# Main HIDS Toolkit Controller

# Ensure the script runs from its own directory
cd "$(dirname "$0")"

# --- Configuration ---
CONFIG_FILE="hids.conf"
MODULES_DIR="modules"
REPORTS_DIR="reports"
DB_DIR="db"

# --- Functions ---
show_help() {
    echo "Usage: $0 {init|check|help}"
    echo "  init    - Initializes all module baselines."
    echo "  check   - Runs all checks and generates a report."
    echo "  help    - Shows this help message."
}

load_dependencies() {
    if [ ! -f "$CONFIG_FILE" ]; then
        echo "FATAL: Configuration file '$CONFIG_FILE' not found."
        exit 1
    fi
    source "$CONFIG_FILE"
    
    for module in "$MODULES_DIR"/*.sh; do
        if [ -f "$module" ]; then
            source "$module"
        fi
    done
}

# --- Main Logic ---
if [ $# -eq 0 ]; then
    show_help
    exit 1
fi

load_dependencies

case "$1" in
    init)
        echo "===== HIDS Initialization Started ====="
        mkdir -p "$DB_DIR" "$REPORTS_DIR"
        
        initialize_fim
        initialize_users
        initialize_logs
        initialize_processes_network
        initialize_system_config
        initialize_resource_monitor

        echo "===== HIDS Initialization Complete ====="
        ;;
    check)
        report_file="${REPORTS_DIR}/report_$(date +%Y-%m-%d_%H-%M-%S).txt"
        
        exec > >(tee -a "$report_file") 2>&1

        echo "===== HIDS Check Started: $(date) ====="
        echo "Report will be saved to: $report_file"
        echo "----------------------------------------"

        check_fim
        check_users
        check_logs
        check_processes_network
        check_system_config
        check_resource_monitor

        echo "===== HIDS Check Complete ====="

        if [ ! -z "$REPORT_EMAIL" ] && grep -q -i "ALERT" "$report_file"; then
            echo "Alert detected, sending email to $REPORT_EMAIL..."
            mail -s "HIDS Alert on $(hostname)" "$REPORT_EMAIL" < "$report_file"
            echo "Email alert sent."
        fi
        ;;
    *)
        show_help
        exit 1
        ;;
esac

exit 0

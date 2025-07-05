#!/bin/bash
initialize_system_config() {
    echo "Initializing Crontab baseline..."
    sudo crontab -l -u root > "$CRON_BASELINE_ROOT" 2>/dev/null || touch "$CRON_BASELINE_ROOT"
    echo "OK: Crontab baseline created."
}
check_system_config() {
    echo "--- [50] Checking System Config ---"
    local has_issue=0
    local current_cron=$(mktemp)
    sudo crontab -l -u root > "$current_cron" 2>/dev/null || true
    if ! diff -q "$CRON_BASELINE_ROOT" "$current_cron" >/dev/null; then
        echo "ALERT: Root crontab has been modified."
        has_issue=1
    fi
    rm "$current_cron"
    if [ $has_issue -eq 0 ]; then
        echo "OK: No critical system config changes found."
    fi
}

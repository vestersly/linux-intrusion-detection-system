#!/bin/bash
initialize_resource_monitor() {
    echo "Resource Monitor module requires no initialization."
}
check_resource_monitor() {
    echo "--- [60] Checking System Resources ---"
    local has_issue=0
    local load
    load=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d',' -f1 | xargs)
    echo "INFO: Current 1-min CPU Load Average: $load"
    if (( $(echo "$load > $CPU_THRESHOLD" | bc -l) )); then
        echo "ALERT: CPU load ($load) exceeded threshold ($CPU_THRESHOLD)"
        has_issue=1
    fi
    local total used mem_usage
    read total used <<< $(free -m | awk '/Mem:/ {print $2, $3}')
    mem_usage=$((100 * used / total))
    echo "INFO: Memory Usage: $mem_usage% ($used MB used of $total MB)"
    if (( mem_usage > MEMORY_THRESHOLD )); then
        echo "ALERT: Memory usage ($mem_usage%) exceeded threshold ($MEMORY_THRESHOLD%)"
        has_issue=1
    fi
    df -h --output=pcent,target | tail -n +2 | while IFS= read -r line; do
        local usage mount_point
        usage=$(echo "$line" | awk '{print $1}' | tr -d '%')
        mount_point=$(echo "$line" | awk '{print $2}')
        echo "INFO: Disk Usage on $mount_point: $usage%"
        if (( usage > DISK_THRESHOLD )); then
            echo "ALERT: Disk usage ($usage%) on $mount_point exceeded threshold ($DISK_THRESHOLD%)"
            has_issue=1
        fi
    done
    if [ $has_issue -eq 0 ]; then
        echo "OK: System resources are within defined thresholds."
    fi
}

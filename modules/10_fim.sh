#!/bin/bash
initialize_fim() { 
    echo "Initializing File Integrity baseline..."; 
    # This part was already correct.
    find $MONITORED_DIRS -type f -print0 | xargs -0 sha256sum > "$BASELINE_FILE"
    echo "OK: FIM baseline created."
}
check_fim() {
    echo "--- [10] Checking File Integrity ---"
    local changes=0

    # This part correctly checks for MODIFIED files because sha256sum handles the format properly.
    sha256sum -c --quiet "$BASELINE_FILE" | grep -v 'OK$' >> /dev/null && changes=1

    # This is the corrected part. It now handles filenames with spaces correctly
    # by using 'sed' to remove the hash and spaces, instead of the buggy 'awk'.
    # This part checks for ADDED or DELETED files.
    # The 'sed' regex matches 64 hex characters (the sha256sum) followed by two spaces.
    diff <(sed 's/^[a-f0-9]\{64\}  //' "$BASELINE_FILE" | sort) <(find $MONITORED_DIRS -type f | sort) | grep -q '[<>]' && changes=1
    
    if [ $changes -eq 0 ]; then 
        echo "OK: No file changes."
    else 
        echo "ALERT: File integrity change detected. Review report for details."
        # Also using the corrected 'sed' command for the detailed report.
        echo "Detailed Changes:"
        diff <(sed 's/^[a-f0-9]\{64\}  //' "$BASELINE_FILE" | sort) <(find $MONITORED_DIRS -type f | sort) | grep '[<>]'
    fi
}

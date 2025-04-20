#!/bin/bash

# Load config
source ./loganalyzer.conf

LOGFILE="$OUTPUT_LOG"

# Prepare output file
echo "==== Log Analysis Report ====" > "$LOGFILE"
echo "Generated on: $(date)" >> "$LOGFILE"
echo "-----------------------------" >> "$LOGFILE"

# Failed login attempts
echo -e "\n[FAILED LOGIN ATTEMPTS]" >> "$LOGFILE"
grep "Failed password" "$AUTH_LOG" >> "$LOGFILE"

# Successful sudo usage
echo -e "\n[SUDO USAGE]" >> "$LOGFILE"
grep "sudo" "$AUTH_LOG" >> "$LOGFILE"

# System Errors
echo -e "\n[SYSTEM ERRORS]" >> "$LOGFILE"
grep -i "error" "$SYS_LOG" >> "$LOGFILE"

# SSH Access
echo -e "\n[SSH ACCESS LOGS]" >> "$LOGFILE"
grep "sshd" "$AUTH_LOG" >> "$LOGFILE"

echo -e "\n==== End of Report ====\n" >> "$LOGFILE"

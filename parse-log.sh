#!/bin/bash

# Goal: Parse log file for IP address and date.

# Ensure log file has been supplied, if not return exit 1 and send to STDERR
LOG_FILE=${1}

if [[ ! -e "${LOG_FILE}" ]]
then
 echo "Cannot open log file: ${LOG_FILE}" >&2
 exit 1
fi
# Create Header with IP address and date
HEADER="IP Address   Date"
echo "${HEADER}"
# Parse log file for IP
IP_ADDRESS=$(grep "rhost" syslog-s | cut -d " " -f 14 | cut -d "=" -f 2)
# Parse log file for Date
DATE=$(cut -d ' ' -f 1-4 ${LOG_FILE})

echo "${IP_ADDRESS}  ${DATE}"

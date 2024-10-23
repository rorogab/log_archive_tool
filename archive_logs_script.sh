#!/bin/bash

if [ "$#" -ne 1 ]; then 
    echo "Usage: "$0" <log_directory>"
    exit 1
fi 

LOG_DIR=$1

if [ ! -d "$LOG_DIR" ]; then 
    echo "The directory "$LOG_DIR" does not exist"
    exit 1
fi

ARCHIVE_DIR="$HOME/log_archives"

mkdir -p "$ARCHIVE_DIR"

TIMESTAMP=$(date + "%D%M%Y%_%H%M%S")

ARCHIVE_FILE="$ARCHIVE_DIR/logs_archive_$TIMESTAMP.tar.gz"

tar -czf"$ARCHIVE_FILE" -C "$LOG_DIR" .

if [ $? -eq 0 ]; then 
    echo "Logs successfully archived to $ARCHIVE_FILE"
else
    echo "Failed to archive logs"
    exit 1
fi

LOG_FILE="$ARCHIVE_DIR/archive_log.txt"
echo "[$(date)] Archived $LOG_DIR to $ARCHIVE_FILE" >> "$LOG_FILE"

echo "Archive datails logged to $LOG_FILE"

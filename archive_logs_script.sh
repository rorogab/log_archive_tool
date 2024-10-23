#!/bin/bash

# Check if a directory argument is provided
if [ "$#" -ne 1 ]; then 
    echo "Usage: "$0" <log_directory>"
    exit 1
fi 

# Set the log directory from the argument
LOG_DIR=$1

# Check if the directory exists
if [ ! -d "$LOG_DIR" ]; then 
    echo "The directory "$LOG_DIR" does not exist"
    exit 1
fi

# Set the archive directory
ARCHIVE_DIR="$HOME/log_archives"

# Create the archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Create a timestamp for the archive file
TIMESTAMP=$(date + "%D%M%Y%_%H%M%S")

# Set the name of the archive file
ARCHIVE_FILE="$ARCHIVE_DIR/logs_archive_$TIMESTAMP.tar.gz"

# Compress the log files into a tar.gz file
tar -czf"$ARCHIVE_FILE" -C "$LOG_DIR" .

# Check if the tar command succeeded
if [ $? -eq 0 ]; then 
    echo "Logs successfully archived to $ARCHIVE_FILE"
else
    echo "Failed to archive logs"
    exit 1
fi

# Log the archive details
LOG_FILE="$ARCHIVE_DIR/archive_log.txt"
echo "[$(date)] Archived $LOG_DIR to $ARCHIVE_FILE" >> "$LOG_FILE"

# Print confirmation of the log entry
echo "Archive datails logged to $LOG_FILE"

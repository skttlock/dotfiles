#!/bin/bash
#
# Use this script to back-up and compress Projects directory using rsync and tar.
# Might be automated by cron in the future
#

echo "Starting back-up: Projects directory."

# paths
PROJECTS="${HOME}/Documents/Projects/"

BACKUP_FOLDER="${HOME}/Documents/Backups/Projects"
# backup timestamp
BACKUP_DATE=$(date +"%Y-%m-%d")

# create backup dir
mkdir -p "$BACKUP_FOLDER/$BACKUP_DATE"

# back it up and compress
rsync -a "$PROJECTS/" "$BACKUP_FOLDER/$BACKUP_DATE/"

tar -czf "$BACKUP_FOLDER/$BACKUP_DATE.tar.gz" -C "$BACKUP_FOLDER" "$BACKUP_DATE"

echo "Completed back-up: Projects directory."

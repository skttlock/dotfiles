#!/bin/bash
#
# Use this script to back-up and compress Personal Documents directory using rsync and tar.
# Might be automated by cron in the future
#

echo "Starting back-up: Personal Documents directory."

# paths
SOURCE_FOLDER="${HOME}/Documents/Personal Documents/"

BACKUP_FOLDER="${HOME}/Documents/Backups/Personal Documents/"
# backup timestamp
BACKUP_DATE=$(date +"%Y-%m-%d")

# create backup dir
mkdir -p "$BACKUP_FOLDER/$BACKUP_DATE"

# back it up and compress
rsync -a "$SOURCE_FOLDER/" "$BACKUP_FOLDER/$BACKUP_DATE/"

tar -czf "$BACKUP_FOLDER/$BACKUP_DATE.tar.gz" -C "$BACKUP_FOLDER" "$BACKUP_DATE"

echo "Completed back-up: Personal Documents directory."

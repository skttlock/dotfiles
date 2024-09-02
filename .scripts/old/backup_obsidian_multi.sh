#!/bin/bash
#
# Use this script to back-up and compress Obsidian Vaults using rsync and tar.
# Might be automated by cron in the future
#

echo "Starting back-up: Obsidian Personal and Work Vaults."

# paths
PERSONAL_VAULT="${HOME}/Documents/Personal Vault"
WORK_VAULT="${HOME}/Documents/Work Vault"

BACKUP_FOLDER="${HOME}/Documents/Backups/Obsidian"
# backup timestamp
BACKUP_DATE=$(date +"%Y-%m-%d")

# create backup dir
mkdir -p "$BACKUP_FOLDER/$BACKUP_DATE"

# back it up and compress
rsync -a "$PERSONAL_VAULT/" "$BACKUP_FOLDER/$BACKUP_DATE/personal_vault/"
rsync -a "$WORK_VAULT/" "$BACKUP_FOLDER/$BACKUP_DATE/work_vault/"

tar -czf "$BACKUP_FOLDER/$BACKUP_DATE.tar.gz" -C "$BACKUP_FOLDER" "$BACKUP_DATE"

echo "Completed back-up: Obsidian Personal and Work Vaults."

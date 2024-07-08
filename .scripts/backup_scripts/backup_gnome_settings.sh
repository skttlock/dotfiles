#!/bin/bash

#NOTE: written by chatgpt 4

# Directory to store the backup
BACKUP_DIR=~/Documents/Backups/gnome_settings_backup

# Create the backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

echo "Backing up dconf settings..."
# Backup dconf settings
dconf dump / >$BACKUP_DIR/gnome-settings.dconf

echo "Backing up gsettings..."
# Backup gsettings
gsettings list-recursively >$BACKUP_DIR/gsettings-backup.txt

echo "Backing up GTK settings..."
# Backup GTK settings
cp -r ~/.config/gtk-3.0 $BACKUP_DIR/gtk-3.0
cp -r ~/.config/gtk-4.0 $BACKUP_DIR/gtk-4.0

echo "Backing up GNOME extensions..."
# Backup GNOME extensions
cp -r ~/.local/share/gnome-shell/extensions $BACKUP_DIR/extensions

echo "Backing up GNOME shell configuration..."
# Backup GNOME shell configuration
cp -r ~/.config/gnome-shell $BACKUP_DIR/gnome-shell

echo "Backing up GNOME Terminal settings..."
# Backup GNOME Terminal settings
dconf dump /org/gnome/terminal/ >$BACKUP_DIR/gnome-terminal-settings.dconf

echo "Backing up custom themes and icons..."
# Backup custom themes and icons
cp -r ~/.themes $BACKUP_DIR/themes
cp -r ~/.icons $BACKUP_DIR/icons

echo "Backing up autostart applications..."
# Backup autostart applications
cp -r ~/.config/autostart $BACKUP_DIR/autostart

echo "Backing up fonts configuration..."
# Backup fonts configuration
cp -r ~/.fonts $BACKUP_DIR/fonts
cp -r ~/.config/fontconfig $BACKUP_DIR/fontconfig

echo "Compressing the backup directory..."
# Compress the backup directory
tar czf $BACKUP_DIR.tar.gz -C $BACKUP_DIR .

# Clean up temporary backup directory
rm -rf $BACKUP_DIR

echo "Backup completed and stored in $BACKUP_DIR.tar.gz"

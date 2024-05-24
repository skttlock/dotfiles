#!/bin/bash
# called by install.sh

echo "Running: font_installs.sh"
# path setups
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RELATIVE_FOLDER="fonts/liberation-fonts-ttf-2.1.5"
FOLDER_PATH="$SCRIPT_DIR/$RELATIVE_FOLDER/*/"
DESTINATION_DIR="~/.local/share/fonts/"
cp -r $FOLDER_PATH $DESTINATION_DIR
fc-cache -v

echo "Completed: font_installs.sh"

#!/bin/bash
# called by install.sh

echo -e "${INFO}Running:${RESET} font_installs.sh"

# path setups
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RELATIVE_FOLDER="fonts/liberation-fonts-ttf-2.1.5"
# RELATIVE_FOLDER="fonts/*"
FOLDER_PATH="$SCRIPT_DIR/$RELATIVE_FOLDER/*/"
DESTINATION_DIR="$HOME/.local/share/fonts/"

mkdir -p $DESTINATION_DIR


cp -r $FOLDER_PATH $DESTINATION_DIR
fc-cache

echo -e "${INFO}Completed:${RESET} font_installs.sh"

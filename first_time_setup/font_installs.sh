#!/bin/bash
# called by install.sh

echo "${YELLOW}Running: font_installs.sh${RESET}"
# path setups
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RELATIVE_FOLDER="fonts/liberation-fonts-ttf-2.1.5"
FOLDER_PATH="$SCRIPT_DIR/$RELATIVE_FOLDER/*/"
DESTINATION_DIR="~/.local/share/fonts/"
mkdir $DESTINATION_DIR
cp -r $FOLDER_PATH $DESTINATION_DIR
fc-cache -v

echo "${GREEN}Completed:${RESET} font_installs.sh"

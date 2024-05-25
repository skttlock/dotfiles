#!/bin/bash
# called by install.sh

echo -e "${YELLOW}Running: font_installs.sh${RESET}"

# path setups
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RELATIVE_FOLDER="fonts/liberation-fonts-ttf-2.1.5"
FOLDER_PATH="$SCRIPT_DIR/$RELATIVE_FOLDER/*/"
DESTINATION_DIR="$HOME/.local/share/fonts/"

if [ -d "$DESTINATION_DIR" ]; then
	mkdir -p $DESTINATION_DIR
fi
cp -r $FOLDER_PATH $DESTINATION_DIR
fc-cache

echo -e "${GREEN}Completed:${RESET} font_installs.sh"

#!/bin/bash
# called by install.sh

echo -e "${YELLOW}Running: wallpaper_installs.sh${RESET}"
# find wallpaper folder
# path setups
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# echo "script dir=$SCRIPT_DIR"
RELATIVE_FOLDER="wallpapers/patched_daynight_wallpapers"
# echo "relative dir=$RELATIVE_FOLDER"
FOLDER_PATH="$SCRIPT_DIR/$RELATIVE_FOLDER/*/"
FILE_PATH="$SCRIPT_DIR/$RELATIVE_FOLDER/custom_wallpapers.xml"
# echo "full path=$FOLDER_PATH"
# echo "file path=$FILE_PATH"
DESTINATION_DIR="~/.local/share/backgrounds/"
# copy patched wallpapers to .local/share/backgrounds
mkdir $DESTINATION_PATH
cp -r $FOLDER_PATH $DESTINATION_DIR
# copy xml to .local/share/gnome-background-properties
mkdir ~/.local/share/gnome-background-properties
cp $FILE_PATH ~/.local/share/gnome-background-properties
echo -e "${GREEN}Completed:${RESET} wallpaper_installs.sh"

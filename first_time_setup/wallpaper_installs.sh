#!/bin/bash
# called by install.sh

# Function to update XML files in a folder
# this was all written by chatgpt- double check it later
# for example: remove home_dir variable and replace with $HOME
update_xml_files() {
    local home_dir="$HOME"
    local xml_folder="$1"

    # Check if the folder exists and is readable
    if [ -d "$xml_folder" ] && [ -r "$xml_folder" ]; then
        # Loop through each XML file in the folder
        for xml_file in "$xml_folder"/*.xml; do
            # Check if the file is a regular file and is readable
            if [ -f "$xml_file" ] && [ -r "$xml_file" ]; then
                # Replace $home_var with the value of HOME environment variable in the XML file
                sed -i "s|\$home_var|$home_dir|g" "$xml_file"
                echo "Updated: $xml_file"
            fi
        done
    else
        echo "Error: XML folder not found or not readable."
    fi
}

echo -e "${YELLOW}Running: wallpaper_installs.sh${RESET}"

# path setups
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RELATIVE_FOLDER="wallpapers/patched_daynight_wallpapers"
IMAGE_PATH="$SCRIPT_DIR/$RELATIVE_FOLDER/*/"
XML_PATH="$SCRIPT_DIR/$RELATIVE_FOLDER/"
DESTINATION_DIR="$HOME/.local/share/backgrounds/"

# copy patched wallpapers to .local/share/backgrounds
mkdir -p $DESTINATION_DIR
cp -r $IMAGE_PATH $DESTINATION_DIR

# edit xml files to have proper path
update_xml_files "$XML_PATH"

# copy xml files to .local/share/gnome-background-properties
mkdir -p "$HOME/.local/share/gnome-background-properties/"
cp "$XML_PATH*.xml" "$HOME/.local/share/gnome-background-properties/"

echo -e "${GREEN}Completed:${RESET} wallpaper_installs.sh"

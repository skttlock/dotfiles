#!/bin/bash
# Define variables for text formatting
RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
UNDERLINE='\e[4m'
RESET='\e[0m'


echo -e "${UNDERLINE}Start of install.sh script.${RESET}"
echo -e "Detecting: package manager(s)."
# detect the package manager
if [ -x "$(command -v apt)" ]; then
	PACKAGE_MANAGER="apt"
elif [ -x "$(command -v dnf)" ]; then
	PACKAGE_MANAGER="dnf"
else
	echo -e "${RED}Unsupported operating system.${RESET}"
	exit 1
fi
echo -e  "${GREEN}Detected:${RESET} $PACKAGE_MANAGER."
# detect flatpak presence.
if [ -x "$(command -v flatpak)" ]; then
	echo -e "${GREEN}Detected:${RESET} flatpak."
	echo -e "Updating: flatpak."
	flatpak update -y
	FLATPAK_FOUND=1
else
	echo -e "${RED}Skipping:${RESET} Flatpak installs; Flatpak is not present."
fi

# # update packages
echo "Updating $PACKAGE_MANAGER."
echo "This may take a minute."
sudo $PACKAGE_MANAGER update -y -q
sudo $PACKAGE_MANAGER clean packages

# run the install scripts found in this directory.
echo -e "${UNDERLNE}Running install scripts.${RESET}"
source bash_installs.sh
source programming_language_installs.sh
source font_installs.sh
source wallpaper_installs.sh
source app_installs.sh
echo -e "${UNDERLINE}Finished install scripts. Cleaning up.${RESET}"

echo -e  "${GREEN}Install complete.${RESET}"

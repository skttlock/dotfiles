#!/bin/bash
# Define variables for text formatting
# note: all colors are bolded
RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
MAGENTA='\e[1;35m'
UNDERLINE='\e[4m'
RESET='\e[0m'
RESET_DIR=$(pwd)

#?TODO: add options: full install, custom install, etc.
echo -e "${UNDERLINE}Start of install.sh script.${RESET}"

echo -e "Detecting: operating system."
if [ -f /etc/os-release ]; then
	. /etc/os-release
	echo -e "${GREEN}Detected:${RESET}"
	echo -e "Operating System: $NAME"
	echo -e "Version: $VERSION"
else
	echo -e "/etc/os-release file not found."
	exit 1
fi

echo -e "${YELLOW}Detecting:${RESET} package manager(s)."
# detect the package manager
if [ -x "$(command -v apt)" ]; then
	PACKAGE_MANAGER="apt"
elif [ -x "$(command -v dnf)" ]; then
	PACKAGE_MANAGER="dnf"
else
	echo -e "${RED}Unsupported package manager.${RESET}"
	exit 1
fi
echo -e "${GREEN}Detected:${RESET} $PACKAGE_MANAGER."

# detect flatpak presence.
if [ -x "$(command -v flatpak)" ]; then
	echo -e "${GREEN}Detected:${RESET} flatpak."
	echo -e "${YELLOW}Adding repo:${RESET} flathub."
	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

	echo -e "${YELLOW}Updating:${RESET} flatpak."
	flatpak update -y
	echo -e "${GREEN}Updates completed.${RESET}"
	FLATPAK_FOUND=1
else
	echo -e "${RED}Skipping:${RESET} Flatpak installs; Flatpak is not present."
fi

# # update packages
echo -e "${YELLOW}Updating:${RESET} $PACKAGE_MANAGER."
echo -e "This may take a minute."
sudo $PACKAGE_MANAGER update -y -q
sudo $PACKAGE_MANAGER clean packages
echo -e "${GREEN}Updates completed.${RESET}"

# run the install scripts found in this directory.
echo -e "${UNDERLINE}Running install subscripts.${RESET}"
source bash_installs.sh
source programming_language_installs.sh
source font_installs.sh
source wallpaper_installs.sh
source app_installs.sh
echo -e "${UNDERLINE}Finished install scripts.${RESET}"

# wrap things up
echo -e "${YELLOW}Updating:${RESET} $PACKAGE_MANAGER."
echo -e "This may take a minute."
sudo $PACKAGE_MANAGER update -y -q
echo -e "${GREEN}Updates complete.${RESET}"
echo -e "${YELLOW}Cleaning-up:${RESET} $PACKAGE_MANAGER."
sudo $PACKAGE_MANAGER clean packages
echo -e "${GREEN}Clean-up complete.${RESET}"

echo -e "${GREEN}Install complete.${RESET}"

echo -e "Please restart your shell to see full changes."

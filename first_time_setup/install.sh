#!/bin/bash
# Define variables for text formatting
# note: all colors are bolded
RED='\e[1;31m'
GREEN='\e[1;32m'
BLUE='\e[1;34m'
YELLOW='\e[1;33m'
MAGENTA='\e[1;35m'
WHITE='\e[1;37m'
ONBLACK='\e[40m'
UNDERLINE='\e[4m'

STAGE=$WHITE$ONBLACK$UNDERLINE
ERROR=$RED
SUCCESS=$GREEN
INFO=$BLUE
WARNING=$YELLOW
TIP=$MAGENTA
RESET='\e[0m'

RESET_DIR=$(pwd)

# usage() {
# echo "Usage: $0 [-a] [-b]"
# exit 1
# }
#
# getopts

#?TODO: add options: full install, custom install, etc.
echo -e "${STAGE}Start of install.sh script.${RESET}"

echo -e "${INFO}Detecting:${RESET} operating system."
if [ -f /etc/os-release ]; then
	. /etc/os-release
	echo -e "${SUCCESS}Detected:${RESET}"
	echo -e "Operating System: $NAME"
	echo -e "Version: $VERSION"
else
	echo -e "${ERROR}/etc/os-release file not found.${RESET}"
	echo -e "${STAGE}Exiting Program.${RESET}"
	exit 1
fi

echo -e "${INFO}Detecting:${RESET} package manager(s)."
# detect the package manager
if [ -x "$(command -v apt)" ]; then
	PACKAGE_MANAGER="apt"
elif [ -x "$(command -v dnf)" ]; then
	PACKAGE_MANAGER="dnf"
else
	echo -e "${ERROR}Unsupported package manager.${RESET}"
	echo -e "${STAGE}Exiting Program.${RESET}"
	exit 1
fi
echo -e "${SUCCESS}Detected:${RESET} $PACKAGE_MANAGER."

# detect flatpak presence.
echo -e "${INFO}Detecting:${RESET} flatpak."
if [ -x "$(command -v flatpak)" ]; then
	echo -e "${SUCCESS}Detected:${RESET} flatpak."
	echo -e "Adding repo: flathub."
	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

	echo -e "Updating: flatpak."
	flatpak update -y --noninteractive
	echo -e "${SUCCESS}Updates completed.${RESET}"
	FLATPAK_FOUND=1
else
	echo -e "${WARNING}Skipping:${RESET} Flatpak installs; Flatpak is not present."
fi

# # update packages
echo -e "Updating: $PACKAGE_MANAGER."
echo -e "This may take a minute."
sudo $PACKAGE_MANAGER update -y -q
sudo $PACKAGE_MANAGER clean packages -y -q
echo -e "${SUCCESS}Updates completed.${RESET}"

# run the install scripts found in this directory.
echo -e "${STAGE}Running install subscripts.${RESET}"
source bash_installs.sh
source programming_language_installs.sh
source font_installs.sh
source wallpaper_installs.sh
source app_installs.sh
echo -e "${STAGE}Finished install scripts.${RESET}"

# wrap things up
echo -e "Updating: $PACKAGE_MANAGER."
echo -e "This may take a minute."
sudo $PACKAGE_MANAGER update -y -q
echo -e "${SUCCESS}Updates complete.${RESET}"
echo -e "${INFO}Cleaning-up:${RESET} $PACKAGE_MANAGER."
sudo $PACKAGE_MANAGER clean packages
echo -e "${SUCCESS}Clean-up complete.${RESET}"

echo -e "${SUCCESS}Install complete.${RESET}"

echo -e "${STAGE}Finished install.sh.${RESET}"

echo -e "Please restart your shell to see full changes."

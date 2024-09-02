#!/bin/bash

#text colors & formatting things
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

detect_os() {
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
}

detect_package_manager() {
	echo -e "${INFO}Detecting:${RESET} package manager(s)."
	if [ -x "$(command -v dnf)" ]; then
		PACKAGE_MANAGER="dnf"
	# elif [ -x "$(command -v apt)" ]; then
	# 	PACKAGE_MANAGER="apt"
	else
		echo -e "${ERROR}Unsupported package manager.${RESET}"
		echo -e "${STAGE}Exiting Program.${RESET}"
		exit 1
	fi
	echo -e "${SUCCESS}Detected:${RESET} $PACKAGE_MANAGER."
}

detect_flatpak() {
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
}

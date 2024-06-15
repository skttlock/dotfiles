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

# Define variables for directory switching
RESET_DIR=$(pwd)

# Define arrays (dictionaries?) of things to be installed
Languages=('rust' 'vala' 'crystal' 'elm' 'julia' 'mercury' 'nodejs' 'ruby' 'sqlite' 'typescript' 'zig')
Art_Apps=('audacity' 'gimp' 'kdenlive' 'synfig')
CLI_Apps=('bat' 'bats' 'fastfetch' 'flatpak' 'gh' 'lsd' 'mise' 'neovim' 'rsync' 'starship' 'tmux' 'tldr')
Dev_Apps=('wezterm')
General_Apps=('authenticator' 'deja-dup' 'discord' 'vencord' 'libreoffice' 'obsidian' 'wike')
# Extensions=()

# Define dictionary of install command to use?
# declare -A Languages #
# Languages[rust]=""
# Languages[vala]=""
# Languages[crystal]="mise"
# Languages[elm]="mise"
# Languages[julia]="mise"
# Languages[mercury]="mise"
# Languages[nodejs]="mise"
# Languages[ruby]="mise"
# Languages[sqlite]="mise"
# Languages[typescript]="mise"
# Languages[zig]=""
#
# declare -A Art_Apps #
# Art_Apps[audacity]="$PACKAGE_MANAGER"
# Art_Apps[gimp]="$PACKAGE_MANAGER"
# Art_Apps[kdenlive]="$PACKAGE_MANAGER"
# Art_Apps[synfig]="$PACKAGE_MANAGER"
# 
# declare -A CLI_Apps #
# CLI_Apps[bat]="$PACKAGE_MANAGER"

#?TODO: add options: full install, custom install, etc.
# add selections... whole thing in selections?

usage() {
	echo "Usage: $0 [options]"
	echo "Options:"
	echo "	-h,	--help		Show this message and exit"
	echo "	-y,	--assume-yes	Accept all"
	echo "	-q,	--quiet		Minimum output mode"
	echo "		--verbose	Verbose output mode"
	echo "	-o,	--log		<file> Specify a log file to write to"
	echo "		--noexec, --dryrun"
	exit 1
}
	# echo "	-a,	--all		Install everything"
	# echo "	-s,	--select	Show software selection menu"

# TODO: getopts

echo -e "${STAGE}Start of install.sh script.${RESET}"

echo -e "${STAGE}Select option:${RESET}"
select item in "all" "exit" "update" "list" "programming languages" "cli apps" "dev apps" "general applications" "art applications" ;
do
	echo "$item"
	case "$item" in
		"exit")
			echo "cya"
			break
			;;
		"update")
			echo "[Update] selected. Updating all software."
			;;
		"list")
			echo "[List] selected, listing all software & their respective category and returning to this menu."
			echo -e "${INFO}Programming Languages:${RESET}"
			echo "${Languages[*]}"
			echo -e "${INFO}Art Applications:${RESET}"
			echo "${Art_Apps[*]}"
			echo -e "${INFO}General Applications:${RESET}"
			echo "${General_Apps[*]}"
			echo -e "${INFO}CLI Applications:${RESET}"
			echo "${CLI_Apps[*]}"
			echo -e "${INFO}Dev Applications:${RESET}"
			echo "${Dev_Apps[*]}"
			;;
		"all")
			echo "[All] selected, installation will proceed and then exit."
			;;
		"programming languages")
			echo "[Programming Languages] selected, installation will proceed and return to this menu."
			;;
		"general applications")
			echo "[General Applications] selected, installation will proceed and return to this menu."
			;;
		"art applications")
			echo "[Art Applications] selected, installation will proceed and return to this menu."
			;;
		*)
			echo -e "${ERROR}Invalid selection detected. How'd you do that?${RESET}"
			;;
	esac
	echo -e "${STAGE}Select another option:${RESET}"
	REPLY=
done


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

update() {
	echo "update method"
}

echo -e "${STAGE}Finished install.sh.${RESET}"

#
# # # update packages
# echo -e "Updating: $PACKAGE_MANAGER."
# echo -e "This may take a minute."
# sudo $PACKAGE_MANAGER update -y -q
# sudo $PACKAGE_MANAGER clean packages -y -q
# echo -e "${SUCCESS}Updates completed.${RESET}"
#
# # run the install scripts found in this directory.
# echo -e "${STAGE}Running install subscripts.${RESET}"
# source bash_installs.sh
# source programming_language_installs.sh
# source font_installs.sh
# source wallpaper_installs.sh
# source app_installs.sh
# echo -e "${STAGE}Finished install scripts.${RESET}"
#
# # wrap things up
# echo -e "Updating: $PACKAGE_MANAGER."
# echo -e "This may take a minute."
# sudo $PACKAGE_MANAGER update -y -q
# echo -e "${SUCCESS}Updates complete.${RESET}"
# echo -e "${INFO}Cleaning-up:${RESET} $PACKAGE_MANAGER."
# sudo $PACKAGE_MANAGER clean packages
# echo -e "${SUCCESS}Clean-up complete.${RESET}"
#
# echo -e "${SUCCESS}Install complete.${RESET}"
#
# echo -e "${STAGE}Finished install.sh.${RESET}"
#
# echo -e "Please restart your shell to see full changes."

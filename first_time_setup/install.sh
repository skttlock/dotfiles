#!/bin/bash

echo "Detecting: system package manager."
# detect the package manager
if [ -x "$(command -v apt)" ]; then
	PACKAGE_MANAGER="apt"
elif [ -x "$(command -v dnf)" ]; then
	PACKAGE_MANAGER="dnf"
else
	echo "Unsupported operating system."
	exit 1
fi
echo "Detected: $PACKAGE_MANAGER."
# detect flatpak presence.
echo "Detecting: flatpak."
if [ -x "$(command -v flatpak)" ]; then
	FLATPAK_FOUND=1
	flatpak update
	echo "Detected: flatpak."
else
	echo "Skipping: Flatpak installs; Flatpak is not present."
fi
# update packages
echo "Updating packages."
sudo $PACKAGE_MANAGER update

# run the install scripts found in this directory.
echo "Running install scripts."
source bash_installs.sh
source programming_language_installs.sh
source font_installs.sh
source wallpaper_installs.sh
source app_installs.sh

# upgrading packages
sudo $PACKAGE_MANAGER check-update -y
sudo $PACKAGE_MANAGER upgrade -y
# autoremoving packages
sudo $PACKAGE_MANGER autoremove -y

echo "Install complete."

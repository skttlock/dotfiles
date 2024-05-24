#!/bin/bash
# called by install.sh

echo "${YELLOW}Running: app_installs.sh${RESET}"
# run default package manager installs
sudo $PACKAGE_MANAGER install -y deja-dup
echo "deja-dup, AKA Backups, installed."

# install proton vpn
# TODO: add proton mail for fedora&ubuntu + protonVPN for ubuntu
if [ -x "$(command -v dnf)" ]; then
	wget "https://repo.protonvpn.com/fedora-$(cat /etc/fedora-release | cut -d\  -f 3)-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.1-2.noarch.rpm"
	sudo dnf install -y ./protonvpn-stable-release-1.0.1-2.noarch.rpm
	sudo dnf install -y --refresh proton-vpn-gnome-desktop 
	echo "ProtonVPN for Fedora installed."
fi
echo "To install ProtonMail, find the package on their website."

# run flatpak installs
if [ "$FLATPAK_FOUND" -eq 1 ]; then
	flatpak install flathub org.synfig.SynfigStudio -y
	flatpak install flathub md.obsidian.Obsidian -y
	echo "Obsidian, Synfig installed via Flatpak."
fi
echo "${GREEN}Completed:${RESET} app_installs.sh"

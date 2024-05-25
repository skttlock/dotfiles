#!/bin/bash
# called by install.sh

echo -e "${YELLOW}Running: app_installs.sh${RESET}"
# run default package manager installs
sudo $PACKAGE_MANAGER install -y -q deja-dup
echo -e "deja-dup, AKA Backups, installed."

# install proton vpn
# TODO: add proton mail for fedora&ubuntu + protonVPN for ubuntu
#
# if [ -x "$(command -v dnf)" ]; then
# 	wget "https://repo.protonvpn.com/fedora-$(cat /etc/fedora-release | cut -d\  -f 3)-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.1-2.noarch.rpm"
# 	sudo dnf install -y -q ./protonvpn-stable-release-1.0.1-2.noarch.rpm
# 	sudo dnf install -y --refresh -q proton-vpn-gnome-desktop 
# 	echo -e "ProtonVPN for Fedora installed."
# fi

echo -e "To install ProtonMail and ProtonVPN, find the package on their website."

# run flatpak installs
if [ "$FLATPAK_FOUND" -eq 1 ]; then
	flatpak install flathub -y --noninteractive org.synfig.SynfigStudio
	flatpak install flathub -y --noninteractive md.obsidian.Obsidian
	echo -e "Obsidian, Synfig installed via Flatpak."
fi
echo -e "${GREEN}Completed:${RESET} app_installs.sh"

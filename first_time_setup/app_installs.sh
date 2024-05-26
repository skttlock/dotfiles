#!/bin/bash
# called by install.sh

echo -e "${YELLOW}Running: app_installs.sh${RESET}"
# run default package manager installs
#${GREEN}Success:${RESET}
echo -e "${YELLOW}Installing:${RESET} deja-dup via $PACKAGE_MANAGER."
sudo $PACKAGE_MANAGER install -y -q deja-dup
if [ $? -eq 0 ]; then
	echo -e "${GREEN}Success:${RESET} deja-dup, AKA Backups, installed."
else
	echo -e "${RED}Failed:${RESET} deja-dup install via $PACKAGE_MANAGER."
fi

# run flatpak installs
if [ "$FLATPAK_FOUND" -eq 1 ]; then
	# synfig, animation tool
	echo -e "${YELLOW}Installing:${RESET} Synfig via Flatpak."
	flatpak install flathub -y org.synfig.SynfigStudio
	if [ $? -eq 0 ]; then
		echo -e "${GREEN}Success:${RESET} Synfig installed via Flatpak."
	else
		echo -e "${RED}Failed:${RESET} Synfig install via Flatpak."
	fi

	# obsidian.md, personal knowledge base tool
	echo -e "${YELLOW}Installing:${RESET} Obsidian via Flatpak."
	flatpak install flathub -y md.obsidian.Obsidian
	if [ $? -eq 0 ]; then
		echo -e "${GREEN}Success:${RESET} Obsidian installed via Flatpak."
	else
		echo -e "${RED}Failed:${RESET} Obsidian install via Flatpak."
	fi

	# wike, wikipedia viewer
	echo -e "${YELLOW}Installing:${RESET} Wike via Flatpak."
	flatpak install flathub -y com.github.hugolabe.Wike
	if [ $? -eq 0 ]; then
		echo -e "${GREEN}Success:${RESET} Wike installed via Flatpak."
	else
		echo -e "${RED}Failed:${RESET} Wike install via Flatpak."
	fi

	# authenticator, 2fa client
	echo -e "${YELLOW}Installing:${RESET} Authenticator via Flatpak."
	flatpak install flathub -y com.belmoussaoui.Authenticator
	if [ $? -eq 0 ]; then
		echo -e "${GREEN}Success:${RESET} Authenticator installed via Flatpak."
	else
		echo -e "${RED}Failed:${RESET} Authenticator install via Flatpak."
	fi

	# thunderbird, email&calendar&rss client
	echo -e "${YELLOW}Installing:${RESET} Thunderbird via Flatpak."
	flatpak install flathub -y org.mozilla.Thunderbird
	if [ $? -eq 0 ]; then
		echo -e "${GREEN}Success:${RESET} Thunderbird installed via Flatpak."
	else
		echo -e "${RED}Failed:${RESET} Thunderbird install via Flatpak."
	fi
fi

echo -e "${MAGENTA}NOTE:${RESET} To install ProtonMail, Proton Mail Bridge, and/or ProtonVPN, find the packages on their website."

echo -e "${GREEN}Completed:${RESET} app_installs.sh"

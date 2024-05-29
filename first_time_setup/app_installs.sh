#!/bin/bash
# called by install.sh

echo -e "${INFO}Running:${RESET} app_installs.sh"
# run default package manager installs

echo -e "Installing: deja-dup via $PACKAGE_MANAGER."
sudo $PACKAGE_MANAGER install -y -q deja-dup
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}Success:${RESET} deja-dup, AKA Backups, installed."
else
	echo -e "${ERROR}Failed:${RESET} deja-dup install via $PACKAGE_MANAGER."
fi

echo -e "Installing: rsync via $PACKAGE_MANAGER."
sudo $PACKAGE_MANAGER install -y -q rsync
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}Success:${RESET} rsync installed."
else
	echo -e "${ERROR}Failed:${RESET} rsync install via $PACKAGE_MANAGER."
fi

# run flatpak installs
if [ "$FLATPAK_FOUND" -eq 1 ]; then
	# synfig, animation tool
	echo -e "Installing: Synfig via Flatpak."
	flatpak install flathub -y org.synfig.SynfigStudio
	if [ $? -eq 0 ]; then
		echo -e "${SUCCESS}Success:${RESET} Synfig installed via Flatpak."
	else
		echo -e "${ERROR}Failed:${RESET} Synfig install via Flatpak."
	fi

	# obsidian.md, personal knowledge base tool
	echo -e "Installing: Obsidian via Flatpak."
	flatpak install flathub -y md.obsidian.Obsidian
	if [ $? -eq 0 ]; then
		echo -e "${SUCCESS}Success:${RESET} Obsidian installed via Flatpak."
	else
		echo -e "${ERROR}Failed:${RESET} Obsidian install via Flatpak."
	fi

	# wike, wikipedia viewer
	echo -e "Installing: Wike via Flatpak."
	flatpak install flathub -y com.github.hugolabe.Wike
	if [ $? -eq 0 ]; then
		echo -e "${SUCCESS}Success:${RESET} Wike installed via Flatpak."
	else
		echo -e "${ERROR}Failed:${RESET} Wike install via Flatpak."
	fi

	# authenticator, 2fa client
	echo -e "Installing: Authenticator via Flatpak."
	flatpak install flathub -y com.belmoussaoui.Authenticator
	if [ $? -eq 0 ]; then
		echo -e "${SUCCESS}Success:${RESET} Authenticator installed via Flatpak."
	else
		echo -e "${ERROR}Failed:${RESET} Authenticator install via Flatpak."
	fi

fi

echo -e "${TIP}NOTE:${RESET} To install ProtonMail and ProtonVPN, find the packages on their website."

echo -e "${INFO}Completed:${RESET} app_installs.sh"

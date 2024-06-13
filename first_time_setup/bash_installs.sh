#!/bin/bash
# called by install.sh

echo -e "${INFO}Running:${RESET} bash_installs.sh"
# general bash tools
echo -e "Installing: Fastfetch, NeoVIM, TMUX, Starship, Bat, LSD, TLDR, Bats, and GitHub-CLI via $PACKAGE_MANAGER."

echo -e "Installing: Fastfetch via $PACKAGE_MANAGER."
sudo $PACKAGE_MANAGER install -y -q fastfetch
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}Success:${RESET} Fastfetch installed via $PACKAGE_MANAGER."
else
	echo -e "${ERROR}Failed:{$RESET} Fastfetch install."
fi

echo -e "Installing: NeoVIM via $PACKAGE_MANAGER."
sudo $PACKAGE_MANAGER install -y -q neovim
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}Success:${RESET} NeoVIM installed via $PACKAGE_MANAGER."
else
	echo -e "${ERROR}Failed:{$RESET} NeoVIM install."
fi

echo -e "Installing: TMUX via $PACKAGE_MANAGER."
sudo $PACKAGE_MANAGER install -y -q tmux
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}Success:${RESET} TMUX installed via $PACKAGE_MANAGER."
else
	echo -e "${ERROR}Failed:{$RESET} TMUX install."
fi


echo -e "Enabling: Starship in $PACKAGE_MANAGER via copr (dnf)."
sudo dnf copr enable -y -q atim/starship
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}Success:${RESET} Starship repo added to $PACKAGE_MANAGER from copr."
	echo -e "Installing: Starship via $PACKAGE_MANAGER."
	sudo $PACKAGE_MANAGER install -y -q starship
	if [ $? -eq 0 ]; then
		echo -e "${SUCCESS}Success:${RESET} Starship installed via $PACKAGE_MANAGER."
	else
		echo -e "${ERROR}Failed:{$RESET} Starship install."
	fi
else
	echo -e "${ERROR}Failed:{$RESET} Starship repo enable."
fi

echo -e "Installing: Bat via $PACKAGE_MANAGER."
sudo $PACKAGE_MANAGER install -y -q bat
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}Success:${RESET} Bat installed via $PACKAGE_MANAGER."
else
	echo -e "${ERROR}Failed:{$RESET} Bat install."
fi

echo -e "Installing: LSD via $PACKAGE_MANAGER."
sudo $PACKAGE_MANAGER install -y -q lsd
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}Success:${RESET} LSD installed via $PACKAGE_MANAGER."
else
	echo -e "${ERROR}Failed:{$RESET} LSD install."
fi

echo -e "Installing: TLDR via $PACKAGE_MANAGER."
sudo $PACKAGE_MANAGER install -y -q tldr
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}Success:${RESET} TLDR installed via $PACKAGE_MANAGER."
else
	echo -e "${ERROR}Failed:{$RESET} TLDR install."
fi

echo -e "Installing: Bats via $PACKAGE_MANAGER."
sudo $PACKAGE_MANAGER install -y -q bats
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}Success:${RESET} Bats installed via $PACKAGE_MANAGER."
else
	echo -e "${ERROR}Failed:{$RESET} Bats install."
fi

echo -e "Installing: GitHub-CLI via $PACKAGE_MANAGER."
sudo $PACKAGE_MANAGER install -y -q gh
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}Success:${RESET} GitHub-CLI installed via $PACKAGE_MANAGER."
else
	echo -e "${ERROR}Failed:{$RESET} GitHub-CLI install."
fi

echo -e "${INFO}Completed:${RESET} bash_installs.sh"

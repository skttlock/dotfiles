#!/bin/bash
# called by install.sh

echo -e "${INFO}Running:${RESET} bash_installs.sh"
# general bash tools
echo -e "Installing: NeoVIM, TMUX, Bat, LSD, and TLDR via $PACKAGE_MANAGER."
sudo $PACKAGE_MANAGER install -y -q neovim tmux bat lsd tldr
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}Success:${RESET} NeoVIM, TMUX, Bat, LSD, and TLDR installed via $PACKAGE_MANAGER."
else
	echo -e "${ERROR}Failed:{$RESET} NeoVIM, TMUX, Bat, LSD, TLDR installs."
fi

echo -e "${INFO}Completed:${RESET} bash_installs.sh"

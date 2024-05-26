#!/bin/bash
# called by install.sh

echo -e "${YELLOW}Running: bash_installs.sh${RESET}"
# general bash tools
echo -e "${YELLOW}Installing:${RESET}NeoVIM, TMUX, Bat, LSD, and TLDR via $PACKAGE_MANAGER."
sudo $PACKAGE_MANAGER install -y -q neovim tmux bat lsd tldr
if [ $? -eq 0 ]; then
	echo -e "${GREEN}Success:${RESET} NeoVIM, TMUX, Bat, LSD, and TLDR installed via $PACKAGE_MANAGER."
else
	echo -e "${RED}Failed:{$RESET} NeoVIM, TMUX, Bat, LSD, TLDR installs."
fi

echo -e "${GREEN}Completed:${RESET} bash_installs.sh"

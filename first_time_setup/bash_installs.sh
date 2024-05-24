#!/bin/bash
# called by install.sh

echo "${YELLOW}Running: bash_installs.sh${RESET}"
# general bash tools
sudo $PACKAGE_MANAGER install -y neovim tmux bat lsd tldr
echo "NeoVIM, TMUX, Bat, LSD, and TLDR installed."
#
echo "${GREEN}Completed:${RESET} bash_installs.sh"

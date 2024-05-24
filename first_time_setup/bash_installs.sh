#!/bin/bash
# called by install.sh

echo "Running: bash_installs.sh"
# general bash tools
sudo $PACKAGE_MANAGER install -y git nvim tmux bat lsd tldr
echo "Git, NeoVIM, TMUX, Bat, LSD, and TLDR installed."
#
echo "Completed: bash_installs.sh"

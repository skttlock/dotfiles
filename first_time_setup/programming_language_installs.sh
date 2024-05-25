#!/bin/bash
# called by install.sh

echo -e "${YELLOW}Running: programming_language_installs.sh{$RESET}"
# ruby bash tools
# using git
git clone --quiet https://github.com/rbenv/rbenv.git ~/.rbenv
if [ $? -eq 0 ]; then
	echo -e "rbenv installed via Git."
else
	echo -e "{$RED}Failed:{$RESET} rbenv install via Git."
fi

# rust
# curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
# echo "rust installed via RustUp."
# v-lang
# echo "V installed."
# go-lang
# echo "go-lang installed."
# typescript
# echo "typescript installed."

echo -e "${GREEN}Completed:${RESET} programming_language_installs.sh"

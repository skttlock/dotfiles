#!/bin/bash
# called by install.sh

echo "Running: programming_language_installs.sh"
# ruby bash tools
# using git
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo "rbenv installed via Git."
# echo "rbenv, ruby, ruby-gem installed."
# rust
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
echo "rust installed."
# go-lang
# echo "go-lang installed."
# typescript
# echo "typescript installed."

echo "Completed: programming_language_installs.sh"

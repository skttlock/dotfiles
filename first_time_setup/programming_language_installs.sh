#!/bin/bash
# called by install.sh
# - ruby
# - elm
# - julia
# - mercury
# - rust
# - zig
# - vala...

echo -e "${INFO}Running:${RESET} programming_language_installs.sh"

# install: rust
echo -e "Installing: rustup via sh.rustup.rs"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -q -y >/dev/null
if [ $? -eq 0 ]; then
	~/.cargo/bin/rustup --version
	echo -e "${SUCCESS}Success:${RESET} rustup installed via sh.rustup.rs."
	echo -e "rustup symlinks automatically."
	rustc --version
	echo -e "${SUCCESS}Success:${RESET} rustc installed via rustup."
else
	echo -e "${ERROR}Failed:${RESET} rustup install via sh.rustup.rs."
fi

# install: vala
echo -e "Installing: Vala via $PACKAGE_MANAGER"
sudo $PACKAGE_MANAGER install vala -y -q
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}Success:${RESET} Vala installed via $PACKAGE_MANAGER."
else
	echo -e "${ERROR}Failed:${RESET} Vala install via $PACKAGE_MANAGER."
fi

# install: ruby, elm, julia, mercury, npm, typescript+repl, zig
echo -e "Installing: mise for language install & version management. Similiar to rbenv."
curl https://mise.run | sh -s -- -y -q
if [ $? -eq 0 ]; then
	~/.local/bin/mise version
	echo -e "${SUCCESS}Success:${RESET} mise installed."
	echo 'eval "$(~/.local/bin/mise activate bash)"' >>~/.bashrc
	if [ $? -eq 0 ]; then
		source ~/.bashrc
		echo -e "${SUCCESS}Success:${RESET} mise symlinked in ~/.bashrc."
		echo -e "mise will symlink all installs."

		echo -e "Installing: Ruby"
		echo -e "Installing: Prerequisites for Ruby via $PACKAGE_MANAGER."
		sudo $PACKAGE_MANAGER install autoconf gcc rust patch make bzip2 openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel -y -q
		mise use -g ruby --quiet -y
		if [ $? -eq 0 ]; then
			echo -e "${SUCCESS}Success:${RESET} Ruby installed with mise."
		else
			echo -e "${ERROR}Failed:${RESET} Ruby install."
		fi

		echo -e "Installing: Crystal"
		mise use -g crystal --quiet -y
		if [ $? -eq 0 ]; then
			echo -e "${SUCCESS}Success:${RESET} Crystal installed with mise."
		else
			echo -e "${ERROR}Failed:${RESET} Crystal install."
		fi

		echo -e "Installing: Elm"
		mise use -g elm --quiet -y
		if [ $? -eq 0 ]; then
			echo -e "${SUCCESS}Success:${RESET} Elm installed with mise."
		else
			echo -e "${ERROR}Failed:${RESET} Elm install."
		fi

		echo -e "Installing: Julia"
		mise use -g julia --quiet -y
		if [ $? -eq 0 ]; then
			echo -e "${SUCCESS}Success:${RESET} Julia installed with mise."
		else
			echo -e "${ERROR}Failed:${RESET} Julia install."
		fi

		# echo -e "Installing: Mercury"
		# mise use -g mercury --quiet -y
		# if [ $? -eq 0 ]; then
		#	source ~/.bashrc
		# 	mmc -v
		# 	echo -e "${SUCCESS}Success:${RESET} Mercury installed with mise."
		# else
		# 	echo -e "${ERROR}Failed:${RESET} Mercury install."
		# fi

		echo -e "Installing Node.js"
		mise use -g node --quiet -y
		if [ $? -eq 0 ]; then
			echo -e "${SUCCESS}Success:${RESET} Node.js installed with mise."

			echo -e "Installing: TypeScript via NPM"
			npm install -g typescript
			if [ $? -eq 0 ]; then
				echo -e "${SUCCESS}Success:${RESET} TypeScript installed with NPM."

				echo -e "Installing: TypeScript REPL with NPM."
				npm install -g ts-node
				if [ $? -eq 0 ]; then
					echo -e "${SUCCESS}Success:${RESET} TypeScript REPL installed with NPM."
				else
					echo -e "${ERROR}Failed:${RESET} TypeScript REPL install via NPM."
				fi
			else
				echo -e "${ERROR}Failed:${RESET} TypeScript install via NPM."
			fi
		else
			echo -e "${ERROR}Failed:${RESET} Node.js install."
		fi

		echo -e "Installing: Zig"
		mise use -g zig --quiet -y
		if [ $? -eq 0 ]; then
			echo -e "${SUCCESS}Success:${RESET} Zig installed with mise."
		else
			echo -e "${ERROR}Failed:${RESET} Zig install."
		fi
	else
		echo -e "${ERROR}Failed:${RESET} mise symlink."
	fi
else
	echo -e "${ERROR}Failed:${RESET} mise install via curl."
fi

echo -e "Restart shell to see effects of symlinking."
echo -e "${INFO}Completed:${RESET} programming_language_installs.sh"

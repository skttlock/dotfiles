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
echo -e "Installing: rustup via sh.rustup.rs."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y -q
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
#TODO: test
echo -e "Installing Prerequisites (Vala): GCC, glibc, glib, gobject-introspection, flex, bison, Graphviz, make, autoconf, autoconf-archive, automake, and libtool via $PACKAGE_MANAGER."
sudo $PACKAGE_MANAGER install -y -q gcc glibc glib gobject-introspection flex bison graphviz make autoconf autoconf-archive automake libtool
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}Success:${RESET} GCC, glibc, glib, gobject-introspection, flex, bison, Graphviz, make, autoconf, autoconf-archive, automake, and libtool installed via $PACKAGE_MANAGER."
	echo -e "Installing: Vala via Git"
	git clone --quiet https://gitlab.gnome.org/Archive/vala-bootstrap ~/.vala-bootstrap
	if [ $? -eq 0 ]; then
		echo -e "${SUCCESS}Success:${RESET} vala-bootstrap installed via Git."
		cd ~/.vala-bootstrap
		touch */*.stamp
		VALAC=/no-valac ./configure --prefix=/opt/vala-bootstrap
		make && sudo make install
		if [ $? -eq 0 ]; then
			echo -e "${SUCCESS}Success:${RESET} vala-bootstrap compiled via Make."
			git clone https://gitlab.gnome.org/GNOME/vala ~/.vala
			if [ $? -eq 0 ]; then
				echo -e "${SUCCESS}Success:${RESET} vala installed via Git."
				cd ~/.vala
				VALAC=/opt/vala-bootstrap/bin/valac ./autogen.sh
				make && sudo make install
				if [ $? -eq 0 ]; then
					valac --version
					echo -e "${SUCCESS}Success:${RESET} vala compiled via Make."
				else
					echo -e "${ERROR}Failed:${RESET} vala compilation via Make."
				fi
			else
				echo -e "${ERROR}Failed:${RESET} vala install via Git. See error message above."
			fi
		else
			echo -e "${ERROR}Failed:${RESET} vala-bootstrap compilation via Make."
		fi
	else
		echo -e "${ERROR}Failed:${RESET} vala-bootstrap install via Git. See error message above."
	fi
	cd $RESET_DIR
else
	echo -e "${ERROR}Failed:{$RESET} GCC, glibc, glib, gobject-introspection, flex, bison, Graphviz, make, autoconf, autoconf-archive, automake, and libtool installs."
fi

# install: ruby, elm, julia, mercury, zig
#TODO: test, add -q or -y options according to tests
echo -e "Installing: mise for language install & version management. Similiar to rbenv."
curl https://mise.run | sh
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}Success:${RESET} mise installed."
	echo 'eval "$(~/.local/bin/mise activate bash)"' >>~/.bashrc
	if [ $? -eq 0 ]; then
		source ~/.bashrc
		echo -e "${SUCCESS}Success:${RESET} mise symlinked in ~/.bashrc."

		echo -e "Installing: Ruby"
		mise use -g ruby@3.2
		if [ $? -eq 0 ]; then
			ruby -v
			echo -e "${SUCCESS}Success:${RESET} Ruby installed with mise."
		else
			echo -e "${ERROR}Failed:${RESET} Ruby install."
		fi

		echo -e "Installing: Elm"
		mise use -g elm
		if [ $? -eq 0 ]; then
			elm -v
			echo -e "${SUCCESS}Success:${RESET} Elm installed with mise."
		else
			echo -e "${ERROR}Failed:${RESET} Elm install."
		fi

		echo -e "Installing: Julia"
		mise use -g julia
		if [ $? -eq 0 ]; then
			julia -v
			echo -e "${SUCCESS}Success:${RESET} Julia installed with mise."
		else
			echo -e "${ERROR}Failed:${RESET} Julia install."
		fi

		echo -e "Installing: Mercury"
		mise use -g mercury
		if [ $? -eq 0 ]; then
			julia -v
			echo -e "${SUCCESS}Success:${RESET} Mercury installed with mise."
		else
			echo -e "${ERROR}Failed:${RESET} Mercury install."
		fi

		echo -e "Installing: Zig"
		mise use -g zig
		if [ $? -eq 0 ]; then
			julia -v
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

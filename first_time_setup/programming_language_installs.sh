#!/bin/bash
# called by install.sh

# TODO: add different languages, ensure good file location, test, print versions?
# TODO: make it clean.

echo -e "${INFO}Running:${RESET} programming_language_installs.sh"
#TODO: test
# vala
# prereqs
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

#TODO: impl latest ruby install to global, move to after rust install?
# ruby (rbenv, really)
# prereqs
#
echo -e "Installing Prerequisites (Ruby): autoconf, gcc, rust, patch, make, bzip2, openssl-devel, libyaml-devel, libffi-devel, readline-devel, zlib-devel, gdbm-devel, and ncurses-devel via $PACKAGE_MANAGER."
sudo $PACKAGE_MANAGER install -y -q autoconf gcc rust patch make bzip2 openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}Success:${RESET} autoconf, gcc, rust, patch, make, bzip2, openssl-devel, libyaml-devel, libffi-devel, readline-devel, zlib-devel, gdbm-devel, and ncurses-devel installed via $PACKAGE_MANAGER."
	echo -e "Installing: rbenv via Git"
	git clone --quiet https://github.com/rbenv/rbenv.git ~/.rbenv
	if [ $? -eq 0 ]; then
		~/.rbenv/bin/rbenv init
		~/.rbenv/bin/rbenv --version
		echo -e "${SUCCESS}Success:${RESET} rbenv installed via Git."
		echo -e "rbenv symlinks automatically."
		git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
		if [ $? -eq 0 ]; then
			~/.rbenv/bin/rbenv install --version
			echo -e "${SUCCESS}Success:${RESET} ruby-build installed to rbenv via Git."
			~/.rbenv/bin/rbenv install 3.2.4
			if [ $? -eq 0 ]; then
				echo -e "${SUCCESS}Success:${RESET} ruby installed via rbenv/ruby-build."
				~/.rbenv/bin/rbenv global 3.2.4
				if [ $? -eq 0 ]; then
					ruby --version
					echo -e "${SUCCESS}Success:${RESET} global ruby version set via rbenv."
				else
					echo -e "${ERROR}Failed:${RESET} global ruby version set via rbenv."
				fi
			else
				echo -e "${ERROR}Failed:${RESET} ruby install via rbenv/ruby-build."
			fi
		else
			echo -e "${ERROR}Failed:${RESET} ruby-build install via Git. See error message above."
		fi
	else
		echo -e "${ERROR}Failed:${RESET} rbenv install via Git. See error message above."
	fi
else
	echo -e "${ERROR}Failed:${RESET} autoconf, gcc, rust, patch, make, bzip2, openssl-devel, libyaml-devel, libffi-devel, readline-devel, zlib-devel, gdbm-devel, and ncurses-devel installs."
fi

#TODO: test
# rust
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

#TODO: remove? lol
# v
echo -e "Installing: V via Git"
git clone --quiet https://github.com/vlang/v ~/.v
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}Success:${RESET} V source installed via Git."
	cd ~/.v
	make --quiet
	if [ $? -eq 0 ]; then
		./v --version
		echo -e "${SUCCESS}Success:${RESET} V compiled via Make."
		sudo ./v symlink
		if [ $? -eq 0 ]; then
			echo -e "${SUCCESS}Success:${RESET} V successfully symlinked."
		else
			echo -e "${ERROR}Failed:${RESET} V symlink."
		fi
	else
		echo -e "${ERROR}Failed:${RESET} V compilation via Make."
	fi
	cd $RESET_DIR
else
	echo -e "${ERROR}Failed:${RESET} V install via Git. See error message above."
fi

#TODO: impl
# zig

#TODO: impl
# odin

#TODO: impl
# crystal

#TODO: implement
# julia

#TODO: restart implement, test.
# go-lang
#FIX:
#git clone --quiet https://go.googlesource.com/go ~/.go/goroot
#git -C ~/.go/goroot checkout -q
#
#if [ $? -eq 0 ]; then
#	echo -e "${SUCCESS}Success:${RESET} Go source installed via Git."
#
#	#FIX:
#	~/.go/goroot/src/all.bash
#
#	if [ $? -eq 0 ]; then
#		echo -e "${SUCCESS}Success:${RESET} Go compiled via Make."
#		if [ $? -eq 0 ]; then
#			#TODO: add to path
#
#			echo -e "${SUCCESS}Success:${RESET} Go $PATH added to .bashrc."
#		else
#			echo -e "${ERROR}Failed:${RESET} Go $PATH add to .bashrc."
#		fi
#	else
#		echo -e "${ERROR}Failed:${RESET} Go compilation via Make."
#	fi
#else
#	echo -e "${ERROR}Failed:${RESET} Go install via Git."
#fi

#TODO: implement
# typescript
#
# npm install -D typescript
# if [ $? -eq 0 ]; then
# 	echo -e "${SUCCESS}Success:${RESET} Typescript installed via npm."
# 	#TODO: add alias/path?
# else
# 	echo -e "${ERROR}Failed:${RESET} Typescript install via npm."
# fi

#TODO: implement
# python

echo -e "Restart shell to see effects of symlinking."
echo -e "${INFO}Completed:${RESET} programming_language_installs.sh"

#!/bin/bash
# called by install.sh

# TODO: add different languages, ensure good file location, test, print versions?

echo -e "${YELLOW}Running: programming_language_installs.sh${RESET}"
# ruby (rbenv, really)
echo -e "${YELLOW}Installing:${RESET}rbenv via Git"
git clone --quiet https://github.com/rbenv/rbenv.git ~/.rbenv
if [ $? -eq 0 ]; then
	~/.rbenv/bin/rbenv init
	~/.rbenv/bin/rbenv --version
	echo -e "${GREEN}Success:${RESET} rbenv installed via Git."
	echo -e "rbenv symlinks automatically."
else
	echo -e "${RED}Failed:${RESET} rbenv install via Git. See error message above."
fi

#TODO: test
# rust
echo -e "${YELLOW}Installing:${RESET} rustup via sh.rustup.rs."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y -q
if [ $? -eq 0 ]; then
	~/.cargo/bin/rustup --version
	echo -e "${GREEN}Success:${RESET} rustup installed via sh.rustup.rs."
	echo -e "rustup symlinks automatically."
else
	echo -e "${RED}Failed:${RESET} rustup install via sh.rustup.rs."
fi

#TODO: test
# v
echo -e "${YELLOW}Installing:${RESET}V via Git"
git clone --quiet https://github.com/vlang/v ~/.v
if [ $? -eq 0 ]; then
	echo -e "${GREEN}Success:${RESET} V source installed via Git."
	cd ~/.v
	make --quiet
	if [ $? -eq 0 ]; then
		./v --version
		echo -e "${GREEN}Success:${RESET} V compiled via Make."
		sudo ./v symlink
		if [ $? -eq 0 ]; then
			echo -e "${GREEN}Success:${RESET} V successfully symlinked."
		else
			echo -e "${RED}Failed:${RESET} V symlink."
		fi
	else
		echo -e "${RED}Failed:${RESET} V compilation via Make."
	fi
	cd $RESET_DIR
else
	echo -e "${RED}Failed:${RESET} V install via Git. See error message above."
fi

#TODO: implement
# julia

#TODO: restart implement, test.
# go-lang
#FIX:
#git clone --quiet https://go.googlesource.com/go ~/.go/goroot
#git -C ~/.go/goroot checkout -q
#
#if [ $? -eq 0 ]; then
#	echo -e "${GREEN}Success:${RESET} Go source installed via Git."
#
#	#FIX:
#	~/.go/goroot/src/all.bash
#
#	if [ $? -eq 0 ]; then
#		echo -e "${GREEN}Success:${RESET} Go compiled via Make."
#		if [ $? -eq 0 ]; then
#			#TODO: add to path
#
#			echo -e "${GREEN}Success:${RESET} Go $PATH added to .bashrc."
#		else
#			echo -e "${RED}Failed:${RESET} Go $PATH add to .bashrc."
#		fi
#	else
#		echo -e "${RED}Failed:${RESET} Go compilation via Make."
#	fi
#else
#	echo -e "${RED}Failed:${RESET} Go install via Git."
#fi

#TODO: implement
# typescript
#
# npm install -D typescript
# if [ $? -eq 0 ]; then
# 	echo -e "${GREEN}Success:${RESET} Typescript installed via npm."
# 	#TODO: add alias/path?
# else
# 	echo -e "${RED}Failed:${RESET} Typescript install via npm."
# fi

#TODO: implement
# python

echo -e "Restart shell to see effects of symlinking."
echo -e "${GREEN}Completed:${RESET} programming_language_installs.sh"

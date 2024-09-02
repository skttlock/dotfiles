#!/bin/bash

file="config.toml"

source util.sh

echo -e "${STAGE}Start of install.sh script.${RESET}"

echo -e "${STAGE}Detect system tools.${RESET}"
detect_os
detect_package_manager
detect_flatpak

echo -e "${STAGE}Select an option (1-5):${RESET}"
select item in "exit" "config" "install" "list" "explain";
do
	echo "$item"
	case "$item" in
		"exit")
			echo "exiting... cya!"
			break
			;;
		"config")
			read -p "insert name for git: " name
			yq -i .git-info.name=$name install/config.yaml
			read -p "insert email for git: " email

			;;
		"install")
		    echo "installing..."
			;;
		"list")
			echo "list what? (1-4)"
			select item in "all" "tools" "apps" "languages";
			do
				echo "$item"
				case "$item" in
					"all")
						yq -oy config.toml | grep --color=none "name"
						break
						;;
					"tools")
						yq -oy .tools config.toml | grep --color=none "name"
						break
						;;
					"apps")
						yq -oy .apps config.toml | grep --color=none "name"
						break
						;;
					"languages")
						yq -oy .prog-langs config.toml | grep --color=none "name"
						break
						;;
				esac
				REPLY=
			done
			;;
		"explain")
		    echo "explaining..."
			echo "explain what? (1-4)"
			select item in "all" "tools" "apps" "languages";
			do
				echo "$item"
				case "$item" in
					"all")
						yq -oy config.toml
						break
						;;
					"tools")
						yq -oy .tools config.toml
						break
						;;
					"apps")
						yq -oy .apps config.toml
						break
						;;
					"languages")
						yq -oy .prog-langs config.toml
						break
						;;
				esac
				REPLY=
			done
			;;
	esac
	echo -e "${STAGE}Select another option:${RESET}"
	REPLY=
done


echo -e "${STAGE}Finished install.sh.${RESET}"

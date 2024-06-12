#!/bin/bash

RED='\e[1;31m'
GREEN='\e[1;32m'
BLUE='\e[1;34m'
ERROR=$RED
SUCCESS=$GREEN
INFO=$BLUE
RESET='\e[0m'

pwd
PARENT_DIR=$(pwd)
for DIR in "$PARENT_DIR"/*;
do
	if [ -d "$DIR" ]; then
		echo -e "${INFO}Compressing:${RESET} ${DIR}";
		DIR_NAME=$(basename "$DIR")
		tar -czf "$PARENT_DIR/$DIR_NAME.tar.gz" -C "$PARENT_DIR" "$DIR_NAME"
		if [ $? -eq 0 ]; then
			echo -e "${SUCCESS}Success:${RESET} compressed ${DIR}"
		else
			echo -e "${ERROR}Failed:${RESET} compressing ${DIR}"
		fi
	fi
done

echo -e "${SUCCESS}Finished compress_directories.sh${RESET}"

#!/bin/bash
#
# © Potato1682.
# Discord: Potato1682#9684
# EMail: contact@potato1682.ml
#

DOTPATH=~/.dotfiles
GITHUB_URL=https://github.com/Potato1682/dotfiles

# Colored output
ESC=$(printf '\033') 
RESET="${ESC}[0m"
BOLD="${ESC}[1m"
RED="${ESC}[31m"
YELLOW="${ESC}[33m"

if type "git" > /dev/null 2>&1; then
	git clone --depth 1 --recursive "$GITHUB_URL" "$DOTPATH"

elif type "curl" > /dev/null 2>&1 || type "wget" > /dev/null 2>&1; then
	tarball="https://github.com/Potato1682/dotfiles/archive/master.tar.gz"

	if type "curl" > /dev/null 2>&1; then
		curl -L "$tarball"

	elif type "wget" > /dev/null 2>&1; then
		wget -O - "$tarball"
	fi | tar zx

	mv -f dotfiles-master "$DOTPATH"

else
	echo "${RED}${BOLD}ERROR${RESET}: ${BOLD}curl${RESET} or ${BOLD}wget${RESET} required"
	exit 1
fi

cd ~/.dotfiles
if [ $? -ne 0  ]; then
	echo "${RED}${BOLD}ERROR${RESET}: ${BOLD}$DOTPATH not found${RESET}"
	exit 1
fi

make install || echo "${YELLOW}${BOLD}CLEAN${RESET}: ${BOLD}Deleting cache and error occured directory...${RESET}" || rm -rf ~/.cache/dotfiles || rm -rf $HOME/.dotfiles

# End of file

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
	echo "${RED}${BOLD}ERROR${RESET}: curl or wget required"
	exit 1
fi

cd ~/.dotfiles
if [ $? -ne 0  ]; then
	echo "${RED}${BOLD}ERROR${RESET}: $DOTPATH not found"
	exit 1
fi

make install

# End of file

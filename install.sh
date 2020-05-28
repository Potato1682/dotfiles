#!/bin/bash
#
# © Potato1682.
# Discord: Potato1682#9684
# EMail: contact@potato1682.ml
#

DOTPATH=~/.dotfiles
if type "git" > /dev/null 2>&1; then
	git clone --recursive "$GITHUB_URL" "$DOTPATH"

elif type "curl" > /dev/null 2>&1 || type "wget" > /dev/null 2>&1; then
	tarball="https://github.com/Potato1682/dotfiles/archive/master.tar.gz"

	if type "curl" > /dev/null 2>&1; then
		curl -L "$tarball"

	elif type "wget" > /dev/null 2>&1; then
		wget -O - "$tarball"
	fi | tar zxv

	mv -f dotfiles-master "$DOTPATH"

else
	echo "curl or wget required"
	exit 1
fi

cd ~/.dotfiles
if [ $? -ne 0  ]; then
	echo "not found: $DOTPATH"
	exit 1
fi

make install

# End of file

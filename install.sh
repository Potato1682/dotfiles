#!/bin/bash
#
# © Potato1682.
# Discord: Potato1682#9684
# EMail: contact@potato1682.ml
#

DOTPATH=~/.dotfiles

if has "git"; then
	git clone --recursive "$GITHUB_URL" "$DOTPATH"

elif has "curl" || has "wget"; then
	tarball="https://github.com/Potato1682/dotfiles/archive/master.tar.gz"

	if has "curl"; then
		curl -L "$tarball"

	elif has "wget"; then
		wget -O - "$tarball"
	fi | tar zxv

	mv -f dotfiles-master "$DOTPATH"

else
	die "curl or wget required"
fi

cd ~/.dotfiles
if [ $? -ne 0  ]; then
	die "not found: $DOTPATH"
fi

make install

# End of file

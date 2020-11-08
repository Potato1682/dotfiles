#!/sbin/make
#
# © Potato1682.
# Discord: Potato1682#9684
# EMail: contact@potato1682.ml
#

DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*) bin
EXCLUSIONS := .DS_Store .git .gitmodules .gitignore
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
PKGINSSRC  := jq reflector ripgrep sshfs python2-pip python-pip alder aria2-fast aptpac autoconf automake clang cmatrix ctags dirsearch the_silver_searcher exploitdb gist github-cli bottom gradle lostfiles pkgfile pkgtools repoctl repose vrms-arch powerpill less lostfiles lsd lynis w3m maven meson neofetch-git neovim-nightly neovim-drop-in ninja nmap noto-fonts noto-fonts-cjk openvpn pacman-contrib ranger repo ruby screenfetch sshguard tmux tnftp uncrustify wireshark-cli zsh prettyping

.DEFAULT_GOAL := help

all:

list: ## Show dot files in this repo
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

install: ## Install all packages and Create symlink to home directory
	@echo '© Potato1682.'
	@read -p "Install GUI Packages? [y/N]: " ans; \
    if [ "$$ans" = y ]; then  \
    	  PKGINSSRC="ocs-url kaku-bin code discord firefox google-chrome hexchat mikutter pamac-aur wireshark grub-customizer linux-tools $PKGINSSRC"; \
  	fi
	@read -p "Install inverse icon theme and KDE Plasma? [y/N]: " ans; \
	if [ "$$ans" = y ]; then  \
          PKGINSSRC="inverse-icon-theme-git plasma-meta $PKGINSSRC"; \
    fi
	@echo ''
	@echo '==> Creating cache...'
	@mkdir -pv ~/.cache/dotfiles
	@echo '==> Installing base-devel...'
	@sudo pacman -S base-devel --noconfirm --needed
	@echo ''
	@if [ -n command pikaur &2>1 /dev/null ]; then \
		echo '==> Downloading pikaur...'; \
		git clone "https://aur.archlinux.org/pikaur.git" ~/.cache/dotfiles/pikaur; \
		echo '==> Installing pikaur...'; \
		cd ~/.cache/dotfiles/pikaur && makepkg -si --noconfirm; \
	fi
	@echo '==> Updating...'
	-@pikaur -Syyu --noconfirm
	@echo ''
	@echo '==> Installing packages...'
	@pikaur -S --noconfirm --needed ${PKGINSSRC}
	@gem install neovim
	@echo ''
	@echo '==> Deploying dotfiles to your home directory...'
	@rm -rf $HOME/.config
	@cd ~/.dotfiles && $(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@echo ''
	@echo '==> Installing zinit...'
	@cd ~ && sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
	@echo ''
	@echo '==> Deleting cache...'
	@echo ''
	@rm -rfv ~/.cache/dotfiles
	@echo 'Installation finished successfly.'

clean: ## Remove the dot files and this repo
	@echo 'Remove dot files in your home directory...'
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
	-rm -rf $(DOTPATH)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


#!/sbin/make
#
# © Potato1682.
# Discord: Potato1682#9684
# EMail: contact@potato1682.ml
#

DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*) bin
EXCLUSIONS := .DS_Store .git .gitmodules
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
PKGINSSRC  := aptpac autoconf automake clang cmatrix cordless-git ctags dirsearch docker exploitdb filezilla floo-git gist github-cli go ytop gradle htop java-lombok java-openjdk-ea-bin kaku-bin less lostfiles lsd lynis w3m maven meson mplayer mpv msmtp mutt neofetch-git neovim neovim-drop-in ninja nmap noto-fonts noto-fonts-cjk npm ocs-url openvpn pacman-contrib python-pip python-pynvim python2-pynvim ranger repo rkhunter rtorrent ruby rust screenfetch sshguard tmux tnftp uncrustify urlview vim-plug w3m weechat wireshark-cli zsh colormake prettyping lesspipe colordiff ruby-rainbow rainbow python-blessings grc

.DEFAULT_GOAL := help

all:

list: ## Show dot files in this repo
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

install: ## Install all packages and Create symlink to home directory
	@echo '© Potato1682.'
	@read -p "Install GUI Packages? [y/N]:" ans; \
    	if [ "$$ans" = y ]; then  \
    	  PKGINSSRC="code discord firefox google-chrome hexchat intellij-idea-community-edition mikutter pamac-aur wireshark grub-customizer linux-tools $PKGINSSRC"; \
  	fi
	@read -p "Install inverse icon theme and KDE Plasma? [y,N]:" ans; \
	if [ "$$ans" = y ]; then  \
          PKGINSSRC="inverse-icon-theme-git plasma-meta $PKGINSSRC"; \
        fi
	@echo ''
	@echo '==> Creating cache...'
	@bash ~/.dotfiles/check-cache.sh
	@mkdir ~/.cache/dotfiles
	@echo '==> Re-Installing base-devel...'
	@sudo pacman -S base-devel --noconfirm
	@echo ''
	@echo '==> Downloading yay...'
	@git clone "https://aur.archlinux.org/yay-bin.git" ~/.cache/dotfiles/yay
	@echo '==> Installing yay...'
	@cd ~/.cache/dotfiles/yay && makepkg -si --noconfirm
	@echo '==> Installing packages...'
	-@yay -Syyu --noconfirm
	@echo '==> Checking vi and vim confricts before installing neovim...'
	@bash ~/.dotfiles/check-vi.sh
	@yay -S --noconfirm --needed $PKGINSSRC
	@gem install neovim
	@echo 'INFO: CHECKING SUDO!'
	@sudo npm -g install neovim
	@echo ''
	@echo '==> Deploying dotfiles to your home directory...'
	@mkdir -p $HOME/.config
	@mkdir -p $HOME/.gnupg
	@rm ~/.gnupg/gpg.conf
	@cd ~/.dotfiles && $(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@echo ''
	@echo '==> Installing zinit...'
	@sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
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

# End of file

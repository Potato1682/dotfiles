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

.DEFAULT_GOAL := help

all:

list: ## Show dot files in this repo
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

install: ## Create symlink to home directory
	@echo '© Potato1682.'
	@echo ''
	@echo '==> Creating cache...'
	@set +e
	@mkdir -v ~/.cache
	@set -e
	@mkdir -v ~/.cache/dotfiles
	@echo '==> Installing fakeroot...'		
	@sudo pacman -S fakeroot --noconfirm
	@echo ''
	@echo '==> Downloading yay...'
	@git clone "https://aur.archlinux.org/yay.git" ~/.cache/dotfiles/yay
	@echo '==> Installing yay...'
	@cd ~/.cache/dotfiles/yay && makepkg -si --noconfirm
	@echo '==> Installing packages...'
	@yay -Syyu --noconfirm
	@set +e
	@yay -R vim
	@set -e
	@yay -S --noconfirm aircrack-ng aptpac arpwatch autoconf automake clang cmatrix code cordless-git ctags dirsearch discord docker \
		etherape exploitdb filezilla firefox floo-git gist github-cli go google-chrome gotop gradle hexchat htop \
		intellij-idea-community-edition inverse-icon-theme-git iptraf-ng java-lombok java-openjdk-ea-bin jdtls kaku-bin less \
		lostfiles lsd lynis lynx maven meson metasploit mikutter mplayer mpv msmtp mutt neofetch neovim neovim-drop-in ninja \
		nmap noto-fonts noto-fonts-cjk npm ocs-url openvpn oreo-cursors-git pacman-contrib pamac-aur pass plank \
		powershell-preview-bin python-pip python-pynvim python2-pynvim ranger repo rkhunter rtorrent ruby rust screenfetch \
		sshguard tmux tnftp tor tripwire-git uncrustify urlview vim-plug w3m weechat wireshark-cli zsh
	@echo ':: Installation success.'
	@echo ''
	@echo '==> Starting fakeroot environment...'
	@fakeroot
	@cd ~/.dotfiles
	@echo '==> Installing zinit...'
	@sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
	@echo '==> Deploying dotfiles to your home directory...'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@echo ''
	@echo '==> Exiting fakeroot environment...'
	@exit
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

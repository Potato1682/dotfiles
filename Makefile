DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*) bin
EXCLUSIONS := .DS_Store .git .gitmodules .gitignore
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

.DEFAULT_GOAL := help

all:

list: ## Show dot files in this repo
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

install: ## Install all packages and Create symlink to home directory
	@echo '© 2020 Potato1682.'
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
	@pikaur -S --noconfirm --needed $(cat "~/.dotfiles/packages" | sed '/^#/d')
	@gem install neovim
	@echo ''
	@echo '==> Deploying dotfiles to your home directory...'
	@rm -rf ~/.config
	@cd ~/.dotfiles && $(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@echo ''
	@echo '==> Deleting cache...'
	@rm -rfv ~/.cache/dotfiles
	@echo ''
	@echo 'Installation finished successfly.'

clean: ## Remove the dot files and this repo
	@echo 'Remove dot files in your home directory...'
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
	-rm -rf $(DOTPATH)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


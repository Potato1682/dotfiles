# ~/.zshrc
#
# © Potato1682.
# Discord: Potato1682#9684
# EMail: contact@potato1682.ml
#
# This file required git, lsd(cargo), gotop, man-db and zinit.
# Please visit source error message.

# -------
# General
# -------

# Set path. (I setting .dotfiles/bin, npm prefix, Ruby gem local install path and .local path)
export PATH="$HOME/.dotfiles/bin:$HOME/.npm-global/bin:$HOME/.gem/ruby/2.7.0/bin:$HOME/.local/bin:$PATH"

# Set LANG environment variables.
export LANG=ja_JP.UTF-8

# Completion architecture flag.
export ARCHFLAGS="-arch x86_64"

# Customize ls color.
export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'

# Change terminal color rendering.
# "xterm-256color" is compatible many application.
export TERM="xterm-256color"

# Set auto open variables.
export EDITOR="nvim"
export SHELL="zsh"

# Set pulseaudio server and display server address automatically.
# Important: this option only work in WSL2. please commentout WSL1 or other linux!
export PULSE_SERVER=tcp:$(grep nameserver /etc/resolv.conf | awk '{print $2}');
export DISPLAY=$(grep nameserver /etc/resolv.conf | awk '{print $2}'):0.0;

# Add history settings.
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# -------
# Plugins
# -------

# [User]/[Repogitory] zone

# Load with turbo mode. enhance performance.
zinit wait lucid for \
	atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
		zdharma/fast-syntax-highlighting \
	blockf \
	        zsh-users/zsh-completions \
	atload"!_zsh_autosuggest_start" \
		zsh-users/zsh-autosuggestions

zinit light mollifier/cd-bookmark
zinit light mollifier/cd-gitroot
zinit light AdrieanKhisbe/diractions
zinit light rupa/z
zinit light supercrabtree/k
zinit light mollifier/anyframe
zinit light Tarrasch/zsh-bd
zinit light oknowton/zsh-dwim
zinit light tarruda/zsh-fuzzy-match
zinit light chrissicool/zsh-256color
zinit light Tarrasch/zsh-colors
zinit light ascii-soup/zsh-url-highlighter
zinit light voronkovich/gitignore.plugin.zsh
zinit light knu/zsh-git-escape-magic
zinit light peterhurford/git-aliases.zsh
zinit light denysdovhan/spaceship-prompt

# Prezto modules zone
zinit snippet PZT::modules/helper/init.zsh
zinit snippet PZT::modules/pacman/init.zsh
zinit snippet PZT::modules/tmux/init.zsh
zinit snippet PZT::modules/gnu-utility/init.zsh
zinit snippet PZT::modules/environment/init.zsh
zinit snippet PZT::/modules/gpg/init.zsh

# oh-my-zsh plugins zone
zinit snippet OMZL::git.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh
zinit snippet OMZ::plugins/copyfile/copyfile.plugin.zsh
zinit snippet OMZ::plugins/copydir/copydir.plugin.zsh
zinit snippet OMZ::plugins/history/history.plugin.zsh
zinit snippet OMZ::plugins/colorize/colorize.plugin.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet OMZ::plugins/nmap/nmap.plugin.zsh
zinit snippet OMZ::plugins/vscode/vscode.plugin.zsh
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh

# -------
# Options
# -------

# Move current directory without cd.
setopt auto_cd
# Disable beep sound.
setopt no_beep
setopt nolistbeep
# Enable argument completion.
setopt magic_equal_subst
# Enable Auto-Pushd.
setopt auto_pushd
# Ignore duplication pushd.
setopt pushd_ignore_dups
# Automate list-menu display.
setopt auto_list
setopt auto_menu
# Share history to multi shell.
setopt share_history
# Ignore duplication history.
setopt hist_ignore_dups
# Verbose history save.
setopt extended_history
# Ignore save history with only space.
setopt hist_ignore_space
# Share history to multi shell.
setopt inc_append_history
# Enable USEFUL options.
setopt auto_param_keys
setopt auto_param_slash
# Enable comments in shell.
setopt interactive_comments
# Enable word completion.
setopt complete_in_word
# ????????
setopt always_last_prompt
# Enable prompt substring.
setopt prompt_subst
# Enhance glob. (example: ~, *)
setopt extended_glob
# Complete without dots.
setopt globdots
setopt brace_ccl
# Auto-complete histories.
setopt hist_no_store
setopt hist_reduce_blanks
# Enable packet list and colorize.
setopt list_packed
setopt list_types

# --------
# Autoload
# --------

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
autoload -U compinit
compinit -u
autoload colors
colors

# --------
# Bindkeys
# --------

# Display completion menu to Ctrl + I.
bindkey "^I" menu-complete

bindkey '^xb' anyframe-widget-cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

bindkey '^xr' anyframe-widget-execute-history

bindkey '^x^b' anyframe-widget-checkout-git-branch

bindkey '^xg' anyframe-widget-cd-ghq-repository

# -------
# ZStyles
# -------

# Enhance zsh completion.
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*' use-cache true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

# -------
# Aliases
# -------

# Set aliases.
alias ls="lsd -a"
alias la="lsd -la"
alias ll="lsd -lF"
alias help="man"
alias cdu="cd-gitroot"
alias so="source"
alias sorc="source ~/.zshrc"
alias zshrc="vi ~/.zshrc"
alias grep="grep --color"
alias sgrep="grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}"
alias mux="tmuxinator"
alias fd="find . -type d -name"
alias ff="find . -type f -name"
alias mkdir="mkdir -v"
alias mv="mv -vi"
alias rm="rm -i"
alias rmdir="rm -rfi"
alias cp="cp -v"
alias ln="ln -sv"
alias p="ps -f"
alias top="gotop"
alias ...="cd ../.."
alias ...."cd ../../.."
alias .....="cd ../../../.."

# ----
# Misc
# ----

# SSH Connection terminal is display special text.
if [ -n "$SSH_CONNECTION"  ]; then
	cat ~/.ascii
	HOSTNAME=$(hostname)
	echo -n "Welcome to $HOSTNAME" && echo " on SSH environment\!"
	echo -n "Now date is "
	date +%F
fi

# Open tmux if tmux installed.
if [ -z $TMUX ]; then
  tmux -2
  tmux source-file ~/.tmux.conf
fi

# Set Completion cheat-sheet.
cheat-sheet () { zle -M "`cat ~/zsh/cheat-sheet.conf`" }
zle -N cheat-sheet
bindkey "^[^h" cheat-sheet

# Set Git Completion cheat-sheet.
git-cheat () { zle -M "`cat ~/zsh/git-cheat.conf`" }
zle -N git-cheat
bindkey "^[^g" git-cheat

# Colorize git output.
git config --global color.ui true

cd ~

# End of file
fpath=($fpath "/home/potato1682/.zfunctions")

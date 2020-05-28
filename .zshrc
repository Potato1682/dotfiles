# ~/.zshrc
#
# © Potato1682.
# Discord: Potato1682#9684
# EMail: contact@potato1682.ml
#
# This file required git, lsd(cargo), gotop, man-db, oh-my-zsh and 3 additional plugins.
# Please visit source error message.

# -------
# General
# -------

# Set path. (I setting Ruby gem local install path and perl path)
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.gem/ruby/2.7.0/bin:$HOME/.local/bin"

# Set LANG environment variables.
export LANG=ja_JP.UTF-8

# Completion architecture flag.
export ARCHFLAGS="-arch x86_64"

# Customize ls color.
export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'

# -------
# Plugins
# -------
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light mollifier/cd-gitroot
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/gitfast/gitfast.plugin.zsh
zinit snippet OMZ::plugins/git-auto-fetch/git-auto-fetch.plugin.zsh
zinit snippet OMZ::plugins/tmux/tmux.plugin.zsh
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
# Enable USEFUL options.
setopt auto_param_keys
setopt auto_param_slash
# Enable comments with shell.
setopt interactive_comments
# Enable word completion.
setopt complete_in_word
# ????????
setopt always_last_prompt
# SSH Color Compartibility.
setopt print_eight_bit
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
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

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

if [ -n "$SSH_CONNECTION"  ]; then
	cat ~/.ascii
	HOSTNAME=$(hostname)
	echo -n "Welcome to $HOSTNAME" && echo " on SSH environment\!"
	echo -n "Now date is "
	date +%F
fi
# Open tmux if tmux installed.
if [ -z $TMUX ]; then
  tmux
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

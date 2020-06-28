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

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set path. (I setting .dotfiles/bin, ccache/colorgcc path, npm prefix, Ruby gem local install path and .local path)
export PATH="$HOME/.dotfiles/bin:/usr/lib/ccache/bin/:/usr/lib/colorgcc/bin/:$HOME/.npm-global/bin:$HOME/.gem/ruby/2.7.0/bin:$HOME/.local/bin:$PATH"
export CCACHE_PATH="/usr/bin"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

zinit wait lucid nocd depth=1 \
    atinit='ZSH_BASH_COMPLETIONS_FALLBACK_LAZYLOAD_DISABLE=true' \
      for 3v1n0/zsh-bash-completions-fallback

zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit ice depth=1; zinit light mollifier/cd-bookmark
zinit ice depth=1; zinit light mollifier/cd-gitroot
zinit ice depth=1; zinit light AdrieanKhisbe/diractions
zinit ice depth=1; zinit light rupa/z
zinit ice depth=1; zinit light supercrabtree/k
zinit ice depth=1; zinit light mollifier/anyframe
zinit ice depth=1; zinit light Tarrasch/zsh-bd
zinit ice depth=1; zinit light oknowton/zsh-dwim
zinit ice depth=1; zinit light tarruda/zsh-fuzzy-match
zinit ice depth=1; zinit light chrissicool/zsh-256color
zinit ice depth=1; zinit light Tarrasch/zsh-colors
zinit ice depth=1; zinit light ascii-soup/zsh-url-highlighter
zinit ice depth=1; zinit light voronkovich/gitignore.plugin.zsh
zinit ice depth=1; zinit light knu/zsh-git-escape-magic
zinit ice depth=1; zinit light peterhurford/git-aliases.zsh
zinit ice depth=1; zinit light molovo/revolver
zinit ice depth=1; zinit light dbkaplun/smart-cd
zinit ice depth=1; zinit light willghatch/zsh-snippets
zinit ice depth=1; zinit light hcgraf/zsh-sudo
zinit ice depth=1; zinit light le0me55i/zsh-systemd
zinit ice depth=1; zinit light jreese/zsh-titles
zinit ice depth=1; zinit light RobertAudi/tsm
zinit ice depth=1; zinit light joow/youtube-dl
zinit ice depth=1; zinit light zinit-zsh/zinit-console
zinit ice depth=1; zinit light zinit-zsh/z-a-man
zinit ice depth=1; zinit light zinit-zsh/zinit-vim-syntax
zinit ice depth=1; zinit light zdharma/zui
zinit ice depth=1; zinit light lukechilds/zsh-better-npm-completion
zinit ice depth=1; zinit light zpm-zsh/ssh
zinit ice depth=1; zinit light hkupty/ssh-agent
zinit ice depth=1; zinit light g-plane/zsh-yarn-autocompletions
zinit ice depth=1; zinit light sparsick/ansible-zsh
zinit ice depth=1; zinit light voronkovich/apache2.plugin.zsh
zinit ice depth=1; zinit light mollifier/anyframe
zinit ice depth=1; zinit light zpm-zsh/autoenv
zinit ice depth=1; zinit light hlissner/zsh-autopair
zinit ice depth=1; zinit light MichaelAquilina/zsh-autoswitch-virtualenv
zinit ice depth=1; zinit light chriskempson/base16-shell
zinit ice depth=1; zinit light walesmd/caniuse.plugin.zsh
zinit ice depth=1; zinit light zpm-zsh/clipboard
zinit ice depth=1; zinit light zuxfoucault/colored-man-pages_mod
zinit ice depth=1; zinit light molovo/crash
zinit ice depth=1; zinit light zdharma/declare-zsh
zinit ice depth=1; zinit light vladmyr/dotfiles-plugin
zinit ice depth=1; zinit light b4b4r07/emoji-cli
zinit ice depth=1; zinit light xav-b/zsh-extend-history
zinit ice depth=1; zinit light b4b4r07/enhancd
zinit ice depth=1; zinit light zpm-zsh/figures
zinit ice depth=1; zinit light zpm-zsh/colors
zinit ice depth=1; zinit light Tarrasch/zsh-functional
zinit ice depth=1; zinit light diazod/git-prune
zinit ice depth=1; zinit light caarlos0/zsh-git-sync
zinit ice depth=1; zinit light joepvd/grep2awk
zinit ice depth=1; zinit light willghatch/zsh-hooks
zinit ice depth=1; zinit light qoomon/zsh-lazyload
zinit ice depth=1; zinit light oz/safe-paste
zinit ice depth=1; zinit light djui/alias-tips
zinit ice depth=1; zinit light kazhala/dotbare

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
zinit snippet OMZ::plugins/copyfile/copyfile.plugin.zsh
zinit snippet OMZ::plugins/copydir/copydir.plugin.zsh
zinit snippet OMZ::plugins/history/history.plugin.zsh
zinit snippet OMZ::plugins/colorize/colorize.plugin.zsh
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
setopt nohistbeep
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
# Can {a-c} -> a b c.
setopt brace_ccl
# Split words.
setopt sh_word_split
# Remove comannd of 'hostory' or 'fc -l' from history list.
setopt hist_no_store
# Pack extra blank with history.
setopt hist_reduce_blanks
# Do not display a previously found event.
setopt hist_find_no_dups
# Prevent overwrite prompt from output withour cr.
setopt no_prompt_cr
# Ignore case when glob.
setopt no_case_glob
# pushd [no arg] in execute pushd $HOME.
setopt pushd_to_home
# reduce not required quotes.
setopt rc_quotes
# Remove functions from history list.
setopt hist_no_functions
# Enable packet list and colorize.
setopt list_packed
setopt list_types
# can '=ls' -> '/bin/ls'
setopt equals
# Do not use Ctrl-s/Ctrl-q as flow control.
setopt no_flow_control
# Look for a sub-directory in $PATH when the slash is included in the command.
setopt path_dirs
# Confirm when executing 'rm *'.
setopt rm_star_wait
# Let me know immediately when terminating job.
setopt notify
# Show process ID.
setopt long_list_jobs
# Resume when executing the same name command as suspended process name.
setopt auto_resume
# Append to history file.
setopt append_history
# Write to the history file immediately, not when the shell exits.
setopt inc_append_history
# Expire a duplicate event first when trimming history.
setopt hist_expire_dups_first
# If the path is directory, add '/' to path tail when generating path by glob.
setopt mark_dirs

# --------
# Autoload
# --------

autoload -Uz history-search-end
autoload -Uz cdr
autoload -Uz modify-current-argument
autoload -Uz smart-insert-last-word
autoload -Uz terminfo
autoload -Uz vcs_info
autoload -Uz zcalc
autoload -Uz zmv
autoload -Uz run-help-git
autoload -Uz run-help-svk
autoload -Uz run-help-svn
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
autoload -U compinit; compinit -u
autoload colors; colors
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

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
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
zstyle ':completion:*:cd:*' ignore-parents parent pwd
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
alias la="lsd -A"
alias ll="lsd -lFA"
alias sl="lsd -a"
alias relogin="exec $SHELL -l"
alias re="relogin"
alias c=clear
alias cls=reset
alias dir="ll"
alias df="df -h"
alias du="du -h"
alias du1="du -d1"
alias cmd="winpty cmd"
alias psh="winpty powershell"
alias term="echo $TERM"
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
alias rmdir="rm -rf"
alias cp="cp -v"
alias ln="ln -sv"
alias p="ps -f"
alias top="ytop"
alias yay="yay --needed --pacman pacmatic"
alias yayr="yay --pacman pacmatic -Rsnc"
alias pacman="sudo pacman"
alias weather="curl \"wttr.info/Tokyo?lang=ja&MFq\""
alias cweather="curl \"wttr.info/Tokyo?lang=ja&MFq0\""
alias cdwin="source ~/.dotfiles/bin/cdwin"
alias ...="cd ../.."
alias ...."cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."

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

# Open tmux if installed.
if [[ "${+commands[tmux]}" == 1 ]]; then
  clear
  tmux has-session -t global 2>/dev/null || tmux new-session -ds global \
      && tmux attach-session -t global
  exit
fi

# Set Completion cheat-sheet.
cheat-sheet () { zle -M "`cat ~/zsh/cheat-sheet.conf`" }
zle -N cheat-sheet
bindkey "^[^h" cheat-sheet

# Set Git Completion cheat-sheet.
git-cheat () { zle -M "`cat ~/zsh/git-cheat.conf`" }
zle -N git-cheat
bindkey "^[^g" git-cheat

fpath=($fpath "/home/potato1682/.zfunctions")

# Colorize git output.
git config --global color.ui true
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

cd ~

# End of file

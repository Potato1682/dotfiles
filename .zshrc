# -------
# General
# -------

() {
    local src
    for src in $@; do
        ([[ ! -e $src.zwc ]] || [ ${src:A} -nt $src ]) && zcompile $src
    done
} ~/.zshrc ~/.zshenv

if command -v tmux &> /dev/null && [[ -z "$TMUX" ]]; then
    tmux new-session -A -s main
    exit
fi

if (which zprof > /dev/null 2>&1); then
    zprof
    export ZSH_256COLOR_DEBUG=1
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.fnm/fnm ] && eval $(fnm env)
command -v direnv &> /dev/null && eval "$(direnv hook zsh)"

# --------
# Autoload
# --------

autoload -Uz compinit && compinit
autoload -Uz history-search-end cdr modify-current-argument smart-insert-last-word terminfo vcs_info zcalc zmv run-help-git run-help-svk run-help-svn
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# -------
# Plugins
# -------

source () {
    [[ ! "$1.zwc" -nt $1 ]] || zcompile $1
    builtin source $@
}

. () {
    [[ ! "$1.zwc" -nt $1 ]] || zcompile $1
    builtin . $@
}

loadplg () {
    local extensions=(".plugin.zsh" ".zsh-theme")
    for extension in $extensions; do
        if [[ $# == 2 ]]; then
            if [[ $2 == "pzt" ]]; then
                [[ -f "~/.dotfiles/plugins/prezto/${1}/init.zsh" ]] && source "~/.dotfiles/plugins/prezto/${1}/init.zsh" || echo "${1}: ~/.dotfiles/plugins/prezto/${1}/init.zsh not found"
            elif [[ $2 == "omz" ]]; then
                [[ -f "~/.dotfiles/plugins/omz/${1}/${1}${extension}" ]] && source "~/.dotfiles/plugins/omz/${1}/${1}${extension}" || echo "${1}: ~/.dotfiles/plugins/omz/${1}/${1}${extension} not found"
        fi
        [[ -f "~/.dotfiles/plugins/${1}/${1}${extension}" ]] && source "~/.dotfiles/plugins/${1}/${1}${extension}" || echo "${1}: ~/.dotfiles/plugins/${1}/${1}${extension} not found"
    done
}

updateplg () {
    cd ~/.dotfiles || echo "${RED}${BOLD}ERROR${RESET}: ${BOLD}~/.dotfiles not found${RESET}"; exit 1
    git submodule --init --remote --update
}

# Repository zone

loadplg alias-tips
loadplg colorize
loadplg enhancd
loadplg fast-syntax-highlighting
loadplg powerlevel10k
loadplg zsh-autopair
loadplg zsh-autosuggestions
loadplg zsh-expand
loadplg zsh-git-acp
loadplg zsh-more-completions
loadplg zsh-very-colorful-manuals

# Prezto zone

loadplg environment pzt
loadplg gpg pzt

# Other

source /usr/share/doc/pkgfile/command-not-found.zsh

# -------
# Options
# -------

setopt autocd
setopt nobeep
setopt nolistbeep
setopt nohistbeep
setopt magicequalsubst
setopt autopushd
setopt pushdignoredups
setopt autolist
setopt automenu
setopt sharehistory
setopt histignoredups
setopt extendedhistory
setopt histignorespace
setopt incappendhistory
setopt autoparamkeys
setopt autoparamslash
setopt interactivecomments
setopt completeinword
setopt alwayslastprompt
setopt extendedglob
setopt globdots
setopt braceccl
setopt shwordsplit
setopt histnostore
setopt histreduceblanks
setopt histfindnodups
setopt nopromptcr
setopt nocaseglob
setopt pushdtohome
setopt rcquotes
setopt histnofunctions
setopt listpacked
setopt listtypes
setopt equals
setopt noflowcontrol
setopt pathdirs
setopt rmstarwait
setopt notify
setopt longlistjobs
setopt autoresume
setopt appendhistory
setopt incappendhistory
setopt histexpiredupsfirst
setopt markdirs

# --------
# Bindkeys
# --------

bindkey "^I" menu-complete

bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# -------
# ZStyles
# -------

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

alias cat="bat -p"
alias ls="lsd -A"
alias la="lsd -lFa"
alias ll="lsd -lFA"
alias sudo="sudo -E"
alias cls=reset
alias dir="ll"
alias df="df -h"
alias du="du -h"
alias du1="du -d1"
alias cmd="winpty cmd"
alias psh="winpty powershell"
alias dc='docker-compose'
alias dcu='dc up -d'
alias dcd='dc down'
alias dcr='dcd; dcu'
alias dcp='dc pull'
alias dcl='dc logs -f --tail=1000'
alias dce='dc exec'
alias dcs='dc ps'
alias term="echo $TERM"
alias help="man"
alias cdu="cd-gitroot"
alias so="source"
alias sorc="source ~/.zshrc"
alias zshrc="$EDITOR ~/.zshrc"
alias zshenv="$EDITOR ~/.zshenv"
alias grep="rg --hidden --follow --smart-case 2>/dev/null"
alias mux="tmuxinator"
alias fd="find . -type d -name"
alias ff="find . -type f -name"
alias mkdir="mkdir -pv"
alias mv="mv -v"
alias rmdir="rm -rf"
alias cp="rsync -Pr"
alias ln="ln -sv"
alias p="ps -f"
alias top='btm'
alias pu='pikaur -Syu'
alias pi='pikaur -S --needed'
alias pio='pikaur -S --needed $(comm -23 <(expac -l"\n" "%o" | sort -u) <(expac -l"\n" "%n\n%S" | sort -u) | tr "\n" " " | sed -e "s/linux/ /" | sed -e "s/python2-grequests/ /")'
alias pr='pikaur -Rsnc'
alias pacman='pikaur'
alias weather='curl "wttr.in/Osaka?lang=ja&MFq"'
alias cweather='curl "wttr.in/Osaka?lang=ja&MFq0"'
alias make="colormake"
alias ping="prettyping"
alias ip="ip --color=auto"
alias :q="exit"
alias ...='cd ../..'
alias ....'cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

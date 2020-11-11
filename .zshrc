# -------
# General
# -------

if [[ -z "$TMUX" ]]; then
    tmux new-session -A -s main
    exit
fi

() {
    local src
    for src in $@; do
        ([[ ! -e $src.zwc ]] || [ ${src:A} -nt $src ]) && zcompile $src
    done
} ~/.zshrc ~/.zshenv

if (which zprof > /dev/null 2>&1); then
    zprof
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

# [User]/[Repogitory] zone

source ~/.zinit/plugins/romkatv---powerlevel10k/powerlevel10k.zsh-theme
source ~/.zinit/plugins/zdharma---fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.zinit/plugins/zsh-users---zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.zinit/plugins/chrissicool---zsh-256color/zsh-256color.plugin.zsh
source ~/.zinit/plugins/voronkovich---gitignore.plugin.zsh/gitignore.plugin.zsh
source ~/.zinit/plugins/hcgraf---zsh-sudo/sudo.plugin.zsh
source ~/.zinit/plugins/le0me55i---zsh-systemd/systemd.plugin.zsh
source ~/.zinit/plugins/jreese---zsh-titles/titles.plugin.zsh
source ~/.zinit/plugins/RobertAudi---tsm/tsm.plugin.zsh
source ~/.zinit/plugins/g-plane---zsh-yarn-autocompletions/yarn-autocompletions.plugin.zsh
source ~/.zinit/plugins/zpm-zsh---autoenv/autoenv.plugin.zsh
source ~/.zinit/plugins/hlissner---zsh-autopair/zsh-autopair.plugin.zsh
source ~/.zinit/plugins/b4b4r07---emoji-cli/emoji-cli.plugin.zsh
source ~/.zinit/plugins/zpm-zsh---colors/colors.plugin.zsh
source ~/.zinit/plugins/zpm-zsh---figures/figures.plugin.zsh

# Prezto modules zone

source ~/.zinit/snippets/PZT::modules--helper/init.zsh
source ~/.zinit/snippets/PZT::modules--pacman/init.zsh
source ~/.zinit/snippets/PZT::modules--tmux/init.zsh
source ~/.zinit/snippets/PZT::modules--gnu-utility/init.zsh
source ~/.zinit/snippets/PZT::modules--environment/init.zsh
source ~/.zinit/snippets/PZT::modules--gpg/init.zsh
source ~/.zinit/snippets/PZT::modules--rsync/init.zsh

# oh-my-zsh plugins zone

source ~/.zinit/snippets/OMZL::git.zsh/OMZL::git.zsh
source ~/.zinit/snippets/OMZ::plugins--git/git.plugin.zsh
source ~/.zinit/snippets/OMZ::plugins--copyfile/copyfile.plugin.zsh
source ~/.zinit/snippets/OMZ::plugins--copydir/copydir.plugin.zsh
source ~/.zinit/snippets/OMZ::plugins--history/history.plugin.zsh
source ~/.zinit/snippets/OMZ::plugins--colorize/colorize.plugin.zsh
source ~/.zinit/snippets/OMZ::plugins--nmap/nmap.plugin.zsh
source ~/.zinit/snippets/OMZ::plugins--vscode/vscode.plugin.zsh

# other
source /etc/profile.d/cnf.sh

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

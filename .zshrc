function {
    local src
    for src in $@; {
        ([[ ! -e $src.zwc ]] || [ ${src:A} -nt $src ]) && zcompile $src;
    }
} ~/.zshrc ~/.zshenv;

typeset -g HISTSIZE=290000 SAVEHIST=290000 HISTFILE=~/.zhistory ABSD='{${(M)OSTYPE:#*(darwin|bsd)*}:+1}';

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]] {
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f";
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit";
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b";
}

source "$HOME/.zinit/bin/zinit.zsh";
autoload -Uz _zinit;
(( ${+_comps} )) && _comps[zinit]=_zinit;

if command -v tmux &> /dev/null && [[ -z "$TMUX" ]] {
    tmux new-session -As main && exit;
}

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] {
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh";
}

if (which zprof > /dev/null 2>&1) {
    zprof;
}

command -v direnv &> /dev/null && eval "$(direnv hook zsh)";
command -v thefuck &> /dev/null && eval "$(thefuck --alias)";

# --------
# Autoload
# --------

autoload -Uz history-search-end cdr modify-current-argument smart-insert-last-word terminfo vcs_info zcalc zmv run-help-git run-help-svk run-help-svn;
autoload -U up-line-or-beginning-search down-line-or-beginning-search;

autoload -Uz is-at-least

if [[ ${ZSH_VERSION} != 5.1.1 && ${TERM} != "dumb" ]] {
    if (is-at-least 5.2) {
        autoload -Uz bracketed-paste-url-magic
        zle -N bracketed-paste bracketed-paste-url-magic
    } else {
        if (is-at-least 5.1) {
            autoload -Uz bracketed-paste-magic
            zle -N bracketed-paste bracketed-paste-magic
        }
    }
  
    autoload -Uz url-quote-magic
    zle -N self-insert url-quote-magic
}


# -------
# ZStyles
# -------

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

zstyle -e ':completion:*:hosts' hosts 'reply=(
  ${=${=${=${${(f)"$(cat {/etc/ssh/ssh_,~/.ssh/}known_hosts(|2)(N) 2> /dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
  ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2> /dev/null))"}%%(\#${_etc_host_ignores:+|${(j:|:)~_etc_host_ignores}})*}
  ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2> /dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
)'

zstyle ':completion:*:*:*:users' ignored-patterns \
  adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
  dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
  hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
  mailman mailnull mldonkey mysql nagios \
  named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
  operator pcap postfix postgres privoxy pulse pvm quagga radvd \
  rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs '_*'

zstyle '*' single-ignored show

zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single

zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

zstyle ':completion:*:*:mpg123:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
zstyle ':completion:*:*:mpg321:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
zstyle ':completion:*:*:ogg123:*' file-patterns '*.(ogg|OGG|flac):ogg\ files *(-/):directories'
zstyle ':completion:*:*:mocp:*' file-patterns '*.(wav|WAV|mp3|MP3|ogg|OGG|flac):ogg\ files *(-/):directories'

zstyle ':completion:*:(ssh|scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# -------
# Options
# -------

setopt alwayslastprompt
setopt appendhistory
setopt autocd
setopt autolist
setopt automenu
setopt autoparamkeys
setopt autoparamslash
setopt autopushd
setopt autoresume
setopt banghist
setopt braceccl
setopt cbases
setopt cdablevars
setopt combiningchars
setopt completealiases
setopt completeinword
setopt equals
setopt extendedglob
setopt extendedhistory
setopt globdots
setopt histexpiredupsfirst
setopt histfindnodups
setopt histignoredups
setopt histignorealldups
setopt histignorespace
setopt histnofunctions
setopt histnostore
setopt histreduceblanks
setopt histsavenodups
setopt histverify
setopt incappendhistory
setopt interactivecomments
setopt listpacked
setopt listtypes
setopt longlistjobs
setopt magicequalsubst
setopt markdirs
setopt multios
setopt noalwaystoend
setopt nobeep
setopt nocaseglob
setopt noflowcontrol
setopt noglobcomplete
setopt nohistbeep
setopt nolistbeep
setopt nopromptcr
setopt notify
setopt numericglobsort
setopt octalzeroes
setopt pathdirs
setopt promptsubst
setopt pushdignoredups
setopt pushdminus
setopt pushdsilent
setopt pushdtohome
setopt rcquotes
setopt rmstarwait
setopt sharehistory
setopt shwordsplit

zinit wait lucid depth=1 for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit wait lucid nocompile wait'0e' depth=1 nocompletions for \
    MenkeTechnologies/zsh-more-completions

zinit ice depth=1 atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

zinit ice depth=1 as"program" pick"bin/git-dsf"
zinit light zdharma/zsh-diff-so-fancy

zinit wait lucid depth=1 pick"manydots-magic" compile"manydots-magic" for \
    knu/zsh-manydots-magic

zinit wait lucid depth=1 for \
    OMZ::lib/git.zsh \
    OMZ::plugins/git/git.plugin.zsh \
    hlissner/zsh-autopair \
    urbainvaes/fzf-marks

zinit wait"1" lucid depth=1 for \
 atinit'zstyle ":history-search-multi-word" page-size "7"' \
    zdharma/history-search-multi-word \
 atinit"local zew_word_style=whitespace" \
    psprint/zsh-editing-workbench

zinit wait"2" lucid for \
    zdharma/declare-zsh \
    zdharma/zflai \
 blockf \
    zdharma/zui \
    zinit-zsh/zinit-console \
 trigger-load'!crasis' \
    zdharma/zinit-crasis \
 atinit"forgit_ignore='fgi'" \
    wfxr/forgit

zinit ice depth=1
zinit light chuwy/zsh-secrets

zinit ice depth=1 from'gh-r' as'program'
zinit light sei40kr/fast-alias-tips-bin

zinit ice depth=1
zinit light sei40kr/zsh-fast-alias-tips

zinit ice depth=1
zinit light MichaelAquilina/zsh-autoswitch-virtualenv

zinit ice depth=1
zinit light zpm-zsh/clipboard

zinit ice depth=1
zinit light zpm-zsh/colorize

zinit ice depth=1
zinit light axtl/gpg-agent.zsh

zinit ice depth=1
zinit light hcgraf/zsh-sudo

zinit wait"1" lucid depth=1 for \
    sei40kr/zsh-tmux-rename \
    le0me55i/zsh-systemd \
    lukechilds/zsh-better-npm-completion

zinit ice depth=1
zinit light romkatv/powerlevel10k

alias cat="bat -p"
alias ls="lsd -A"
alias la="lsd -lFa"
alias ll="lsd -lFA"
alias cls=reset
alias dir="ll"
alias df="df -h"
alias du="du -h"
alias du1="du -d1"
alias cmd="winpty cmd"
alias psh="winpty powershell"
alias dc="docker-compose"
alias dcu="dc up -d"
alias dcd="dc down"
alias dcr="dcd; dcu"
alias dcp="dc pull"
alias dcl="dc logs -f --tail=1000"
alias dce="dc exec"
alias dcs="dc ps"
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
alias mv="rsync -a --progress --remove-source-files"
alias rmdir="rm -rf"
alias cp="rsync -a --progress"
alias ln="ln -sv"
alias p="ps -f"
alias top="btm"
alias pu="yay -Syu --noconfirm"
alias pi="yay -S --needed --noconfirm"
alias pr="yay -Rsnc --noconfirm"
alias pacman='yay --noconfirm'
alias weather='curl "wttr.in/Osaka?lang=ja&MFq"'
alias cweather='curl "wttr.in/Osaka?lang=ja&MFq0"'
alias make="colormake"
alias ping="prettyping"
alias ip="ip --color=auto"
alias :q="exit"
alias hack="sudo -iu planet"
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

alias -g G="| grep"
alias -g H="| head"
alias -g L="| bat"
alias -g X="| xargs"

alias -s {gz,xz,zst,bz2,tgz,txz,tbz}="tar xf"
alias -s {html,htm}="open"
alias -s {mp3,mp4,wav,mkv,m4v,m4a,wmv,avi,mpeg,mpg,vob,mov,rm}="mplayer"
alias -s {aria2}="aria2c -x16 -s128 -j128"

[ -f ~/.p10k.zsh ] && . ~/.p10k.zsh
[ -f /usr/share/doc/pkgfile/command-not-found.zsh ] && . /usr/share/doc/pkgfile/command-not-found.zsh

#if [ -d ~/.secrets ] && [ -z ${BW_SESSION} ] {
#    secrets source ~/Vault/.secret-env
#}


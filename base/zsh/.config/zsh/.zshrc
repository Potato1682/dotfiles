if [[ "$ZSH_PROFILE_RC" > 0 ]] {
  zmodload zsh/zprof
}

# Load Powerlevel10k instant prompt
if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]] {
  source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
}

#
# Settings
#

# Options
setopt   always_last_prompt
setopt   auto_cd
setopt   auto_list
setopt   auto_param_keys
setopt   auto_param_slash
setopt   brace_ccl
setopt   c_bases
setopt   c_precedences
setopt   cd_silent
setopt   check_jobs
setopt   combining_chars
setopt   complete_aliases
setopt   equals
setopt   extended_glob
setopt   glob_dots
setopt   glob_star_short
setopt   hash_list_all
setopt   hist_fcntl_lock
setopt   hist_find_no_dups
setopt   hist_ignore_all_dups
setopt   hist_reduce_blanks
setopt   interactive_comments
setopt   list_ambiguous
setopt   list_packed
setopt   list_types
setopt   long_list_jobs
setopt   magic_equal_subst
setopt   mark_dirs
setopt   numeric_glob_sort
setopt   print_eight_bit
setopt   pushd_ignore_dups
setopt   pushd_minus
setopt   pushd_silent
setopt   pushd_to_home
setopt   rm_star_wait
unsetopt auto_pushd
unsetopt beep
unsetopt bg_nice
unsetopt check_jobs
unsetopt chase_links
unsetopt list_beep

# Directory hashes
hash -d dl="$XDG_DOWNLOAD_DIR"
hash -d proj="$HOME/Projects"
hash -d dotfiles="$HOME/.dotfiles"
hash -d src="$HOME/Sources"
hash -d run="/run/user/$(id -u)"
hash -d conf="$XDG_CONFIG_HOME"
hash -d cache="$XDG_CACHE_HOME"
hash -d data="$XDG_DATA_HOME"
hash -d state="$XDG_STATE_HOME"
hash -d media="/run/media/$(id -nu)"

# Completion
zstyle ':completion:*:matches' group yes
zstyle ':completion:*:options' description yes
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format '%F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'
zstyle ':completion:*' format '%F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' insert-tab false
zstyle ':completion:*' list-separator " --> "
zstyle ':completion:*:default' list-prompt "%S%M matches%s"
zstyle ':completion:*' accept-exact-dirs yes
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# Ignore useless commands and functions
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec)|prompt_*)'

# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order 'indexes' 'parameters'

# _approximate
zstyle ':completion:*:approximate:' max-errors "reply=( $((($#PREFIX+$#SUFFIX) / 3)) numeric )"

# Command
zstyle ':completion:*:complete:-command-::commands' ignored-patterns "(*.bak|*\~|*%)"

# Directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:cd:*' ignore-parents parent pwd ..
zstyle ':completion:*:*files' ignored-patterns "*?.o" "*?~" '*\#'

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# ssh
zstyle ':completion::*:ssh-master-exit:*:*' file-patterns '~/.ssh/control/*(=):all-files'
zstyle -e ':completion:*:hosts' hosts 'reply=(
  ${=${=${=${${(f)"$(cat {/etc/ssh/ssh_,~/.ssh/}known_hosts{,2} 2>/dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
  ${=${(f)"$(cat /etc/hosts 2>/dev/null; ypcat hosts 2>/dev/null)"}%%(\#)*}
  ${=${${${${(@M)${(f)"$(cat ~/.ssh/config{,.d/*(N)} 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
)'

zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

# cdpaths
cdpath+=("$HOME/Projects" "$HOME/Sources" "/mnt" "/run/media/$(whoami)")

# Set history exclusion
HISTORY_IGNORE="(cd *|z *|exi*|fzf*|ps *|bpytop|top|htop|glances|ls*|la*|ll*|l|l *|eza*|git status -u .|ls -lh)"

# Set where history saved in
HISTFILE="$XDG_STATE_HOME/zsh/history"

=mkdir -p "$(dirname "$HISTFILE")"

# Set history size saved in RAM
HISTSIZE=50000

# Set history size saved in the file
SAVEHIST=100000

# Completion cache settings
mkdir -p "$ZSH_CACHE_DIR"

# Change directory of compdump
ZSH_COMPDUMP="$XDG_STATE_HOME/zsh/compdump-${(%):-%m}-$ZSH_VERSION"
ZSH_COMPCACHE="$ZSH_CACHE_DIR/compcache-${(%):-%m}-$ZSH_VERSION"

# Useful autoloads

autoload -Uz add-zsh-hook bracketed-paste-magic url-quote-magic
zle -N self-insert url-quote-magic
zle -N bracketed-paste bracketed-paste-magic

# Improve pasting experience with zsh-autosuggestions
_magic_paste_init() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}

_magic_paste_finish() {
  zle -N self-insert $OLD_SELF_INSERT
}

zstyle ":bracketed-paste-magic" paste-init _magic_paste_init
zstyle ":bracketed-paste-magic" paste-finish _magic_paste_finish

#
# Plugin manager
#

# Zinit bootstrap
if [[ ! -f "$XDG_DATA_HOME/zinit/bin/zinit.zsh" ]] {
  echo "Setting up zsh..."
  command mkdir -p "$XDG_DATA_HOME/zinit" && command chmod g-rwX "$XDG_DATA_HOME/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$XDG_DATA_HOME/zinit/bin" >/dev/null 2>&1 || \
    print -P "%F{160}▓▒░ Failed cloning plugin manager.%f%b"
}

# Zinit settings
ZINIT_HOME="$XDG_DATA_HOME/zinit"

declare -A ZINIT

ZINIT[ZCOMPDUMP_PATH]="$ZSH_COMPDUMP"

source "$XDG_DATA_HOME/zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#
# Annexes
#

zinit light-mode depth=1 for zdharma-continuum/zinit-annex-default-ice

# Set default ice
zinit default-ice -q light-mode depth=1

zinit for \
  atinit="Z_A_USECOMP=1" \
    NICHOLAS85/z-a-eval

zinit light zdharma-continuum/zinit-annex-bin-gem-node
zinit light zdharma-continuum/zinit-annex-patch-dl

#
# Plugins
#

# Trigger-load block

zinit lucid for \
  trigger-load="!x" \
    OMZ::plugins/extract \
  trigger-load="!clipcopy;!clippaste" \
    OMZL::clipboard.zsh \
  trigger-load="!copyfile" \
    OMZP::copyfile \
  trigger-load="!copypath" \
    OMZP::copypath

# Conditional wait block

zinit lucid for \
  wait='[[ -n "${_ZSH_HIGHLIGHT_PRIOR_BUFFER[(r)git*]}" ]]' \
  autoload="git-escape-magic" atload="git-escape-magic" nocompile \
    knu/zsh-git-escape-magic \
  wait='[[ "${_ZSH_HIGHLIGHT_PRIOR_BUFFER}" =~ ".." ]]' \
  autoload="#manydots-magic" \
    knu/zsh-manydots-magic \
  wait='[[ "$jobstates" =~ "suspended" ]]' \
    OMZP::fancy-ctrl-z

# Wait 0a

zinit wait=0a lucid for \
  atinit='
    ZINIT[COMPINIT_OPTS]=-C

    zicompinit
    zicdreplay

    if (( $+commands[systemctl] )) {
      compdef sc="systemctl"
      compdef scu="systemctl"
    }

    if (( $+commands[mosh] )) {
      compdef mosh="ssh"
    }
  ' nocd \
    zsh-users/zsh-syntax-highlighting \
    https://raw.githubusercontent.com/catppuccin/zsh-syntax-highlighting/main/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh \
  atload='
    typeset -A key

    key[Up]="${terminfo[kcuu1]}"
    key[Down]="${terminfo[kcud1]}"

    bindkey -M emacs "^[[A" history-substring-search-up
    bindkey -M viins "^[[A" history-substring-search-up
    bindkey -M vicmd "^[[A" history-substring-search-up
    bindkey -M emacs "^[[B" history-substring-search-down
    bindkey -M viins "^[[B" history-substring-search-down
    bindkey -M vicmd "^[[B" history-substring-search-down

    if [[ -n "${key[Up]}" ]]; then
      bindkey -M emacs "${key[Up]}" history-substring-search-up
      bindkey -M viins "${key[Up]}" history-substring-search-up
      bindkey -M vicmd "${key[Up]}" history-substring-search-up
    fi

    if [[ -n "${key[Down]}" ]]; then
      bindkey -M emacs "${key[Down]}" history-substring-search-down
      bindkey -M viins "${key[Down]}" history-substring-search-down
      bindkey -M vicmd "${key[Down]}" history-substring-search-down
    fi
  ' \
    zsh-users/zsh-history-substring-search \
  blockf atpull="zinit creinstall -q ." \
    zsh-users/zsh-completions \
  atload='
    zstyle ":completion:*" special-dirs false
    zstyle ":completion::complete:*" cache-path "$ZSH_COMPCACHE"
    zstyle ":completion:*:*:*:*:*" menu select=2
  ' \
    OMZL::completion.zsh \
  as="completion" nocompile \
    OMZ::plugins/gitfast/_git \
  atinit="
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
  " \
  atload="!
    ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste)
    _zsh_autosuggest_start
  " \
  compile='{src/*.zsh,src/strategies/*}' \
    zsh-users/zsh-autosuggestions \
  id-as="zshrc-lazy" atinit='source "$ZDOTDIR/.zshrc.lazy"' nocd \
    zdharma-continuum/null \
  atload"compdef _cd __enhancd::cd" blockf \
    b4b4r07/enhancd

# Wait 0b block

zinit wait=0b lucid for \
  OMZP::magic-enter \
  atload="
    ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(dirhistory_zle_dirhistory_up dirhistory_zle_dirhistory_down dirhistory_zle_dirhistory_back dirhistory_zle_dirhistory_future)
  " \
  OMZP::dirhistory \
  atload="
    ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(autopair-insert)
  " \
  hlissner/zsh-autopair \
  RobSis/zsh-reentry-hook

# Wait 0c block

zinit wait=0c lucid for \
  id-as="direnv" eval="direnv hook zsh" nocompile nocd has="direnv" \
    zdharma-continuum/null \
  pack="bgn-binary+keys" \
    fzf

if (( $+commands[zoxide] )) {
  zinit wait=0c lucid for \
    id-as="zoxide" eval="zoxide init zsh" nocompile nocd \
      zdharma-continuum/null
} else {
  if [[ "$OSTYPE" == "linux-android" ]] {
    zinit wait=0c lucid from="gh-r" as="command" for \
      bpick="zoxide-*-aarch64-unknown-linux-musl.tar.gz" eval="./zoxide init zsh" \
        ajeetdsouza/zoxide
  } else {
    zinit wait=0c lucid from="gh-r" as="command" for \
      eval="./zoxide init zsh" \
        ajeetdsouza/zoxide
  }
}

# Wait 1 block

zinit wait=1 lucid for \
  subst="bindkey -M emacs -> zvm_bindkey viins" \
    jirutka/zsh-shift-select

# Wait 2 block

zinit wait=2 lucid for \
  OMZP::command-not-found \

# Sync block

zinit light romkatv/powerlevel10k

zinit for \
  atinit='
    HIST_STAMPS="yyyy-mm-dd"
  ' \
    OMZL::history.zsh \
  OMZP::last-working-dir \
  atinit="
    ZVM_TERM=xterm-256color
  " \
  atload="
    ZVM_INSERT_MODE_CURSOR=be
    ZVM_NORMAL_MODE_CURSOR=bl
    ZVM_OPPEND_MODE_CURSOR=ul
    ZVM_KEYTIMEOUT=0.01
  " \
  jeffreytse/zsh-vi-mode

if (( $+commands[vivid] )) {
  zinit reset for \
    id-as="dircolors" eval='echo export LS_COLORS=\"$(vivid generate catppuccin-mocha)\"' nocompile nocd \
    atload='zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}' \
      zdharma-continuum/null
} else {
  zinit from="gh-r" reset for \
    mv="vivid* -> vivid" pick="vivid" \
    id-as="dircolors" eval='echo export LS_COLORS=\"$(./vivid*/vivid generate catppuccin-mocha)\"' nocompile \
    atload='zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}' \
      @sharkdp/vivid
}

if ! (( $+commands[atuin] )) {
  zinit from="gh-r" for \
    mv="atuin* -> atuin" pick="atuin" \
      atuinsh/atuin
}

zinit light atuinsh/atuin

if (( $+commands[fw] )) {
  zinit reset for \
    has="fw" id-as="fw" eval="fw print-zsh-setup -f 2>/dev/null" nocompile nocd \
      zdharma-continuum/null
}

# Custom functions

function reset_broken_terminal () {
  printf '%b' '\e[0m\e(B\e)0\017\e[?5l\e7\e[0;0r\e8'
}

function xterm_title_precmd () {
  print -Pn -- '\e]2;%n@%m %~\a'
  [[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
  print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
  [[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

# Finalize

if (( $+commands[fnm] )) {
  FNM_COREPACK_ENABLED=1 eval "$(fnm env --use-on-cd)"
}

[ -f "$ZDOTDIR/.p10k.zsh" ] && . "$ZDOTDIR/.p10k.zsh"


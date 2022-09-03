# Init or Attach tmux session if available
# if ( (( $+commands[tmux] )) && [[ -z "$TMUX" ]] ) {
#   tmux new-session -As main
# }

# Load Powerlevel10k instant prompt
if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]] {
  source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
}

#
# Settings
#

# Options
setopt   always_last_prompt
setopt   always_to_end
setopt   auto_cd
setopt   auto_list
setopt   auto_menu
setopt   auto_param_keys
setopt   auto_param_slash
setopt   brace_ccl
setopt   c_bases
setopt   c_precedences
setopt   cd_silent
setopt   check_jobs
setopt   combining_chars
setopt   complete_aliases
setopt   complete_in_word
setopt   equals
setopt   extended_glob
setopt   extended_history
setopt   glob_dots
setopt   glob_star_short
setopt   hash_list_all
setopt   hist_expire_dups_first
setopt   hist_fcntl_lock
setopt   hist_find_no_dups
setopt   hist_ignore_all_dups
setopt   hist_ignore_dups
setopt   hist_ignore_space
setopt   hist_reduce_blanks
setopt   hist_verify
setopt   ignore_eof
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
setopt   rm_star_silent
setopt   share_history
setopt   transient_rprompt
unsetopt auto_pushd
unsetopt auto_remove_slash
unsetopt beep
unsetopt bg_nice
unsetopt check_jobs
unsetopt chase_links
unsetopt flow_control
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

# Set history exclusion
HISTORY_IGNORE="(cd *|z *|exit *|fzf*|ps *|bpytop|top|htop|glances|ls*|la*|ll*|l|l *|exa*|exity)"

# Set where history saved in
HISTFILE="$XDG_STATE_HOME/zsh/history"

mkdir -p "$(dirname "$HISTFILE")"

# Set history size saved in RAM
HISTSIZE=10000

# Set history size saved in the file
SAVEHIST=100000

#
# Plugin manager
#

# Zinit bootstrap
if [[ ! -f "$XDG_DATA_HOME/zinit/bin/zinit.zsh" ]] {
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

zinit light-mode depth=1 for \
  atinit="Z_A_USECOMP=1" \
    NICHOLAS85/z-a-eval

#
# Plugins
#

zinit nocd for \
  atload='
    source "$ZDOTDIR/.p10k.zsh"
    (( ! ${+functions[p10k]} )) || p10k finalize
  ' \
    romkatv/powerlevel10k

zinit reset \
  eval="dircolors -b LS_COLORS" \
  atload='zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}' for \
    trapd00r/LS_COLORS

zinit atinit="zstyle ':zim:input' double-dot-expand yes" for \
  zimfw/input

zinit for OMZP::last-working-dir

zinit wait lucid for \
  zsh-users/zsh-history-substring-search

zinit wait lucid null for \
  id-as="zshrc-lazy" atinit='source "$ZDOTDIR/.zshrc.lazy"' \
    zdharma-continuum/null

zinit wait=0a lucid for \
  atinit='
    ZINIT[COMPINIT_OPTS]=-C

    typeset -gA FAST_HIGHLIGHT
    FAST_HIGHLIGHT[git-cmsg-len]=100

    zicompinit
    zicdreplay

    if (( $+commands[systemctl] )) {
      compdef sc="systemctl"
      compdef scu="systemctl"
    }

    if (( $+commands[mosh] )) {
      compdef mosh="ssh"
    }
  ' \
    zdharma-continuum/fast-syntax-highlighting \
  blockf atpull="zinit creinstall -q ." \
    zsh-users/zsh-completions \
  atinit="
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
  " \
  atload="!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit wait=0b lucid for \
  OMZL::termsupport.zsh \
  as="completion" \
    OMZP::ipfs/_ipfs \
  as="completion" \
    OMZP::rust/_rustc

zinit wait=0e lucid nocompile nocompletions for \
  MenkeTechnologies/zsh-more-completions

if (( $+commands[zoxide] )) {
  zinit wait=2a lucid for \
    id-as="zoxide" eval="zoxide init zsh" \
      zdharma-continuum/null
} else {
  if [[ "$OSTYPE" == "linux-android" ]] {
    zinit wait=0f lucid from="gh-r" as="command" for \
      bpick="zoxide-*-aarch64-unknown-linux-musl.tar.gz" eval="./zoxide init zsh" \
        ajeetdsouza/zoxide
  } else {
    zinit wait=0f lucid from="gh-r" as="command" for \
      eval="./zoxide init zsh" \
        ajeetdsouza/zoxide
  }
}

zinit wait=1a lucid for \
  hlissner/zsh-autopair \
  atinit="
    export ZPWR_EXPAND_BLACKLIST=(cat diff g grep ls ll cp mv mkdir ln ebuild man mysql sudo su w3m)
    export ZPWR_EXPAND=true
    export ZPWR_EXPAND_SECOND_POSITION=true
    export ZPWR_EXPAND_NATIVE=false
    export ZPWR_CORRECT=true
    export ZPWR_CORRECT_EXPAND=true
    export ZPWR_EXPAND_QUOTE_DOUBLE=true
    export ZPWR_EXPAND_QUOTE_SINGLE=false
    export ZPWR_EXPAND_TO_HISTORY=false
  " \
    MenkeTechnologies/zsh-expand \
  MenkeTechnologies/zsh-git-acp

if (( $+commands[direnv] )) {
  zinit wait=2a lucid for \
    id-as="direnv" eval="direnv hook zsh" \
      zdharma-continuum/null
} else {
  if [[ "$OSTYPE" == "linux-android" ]] {
    zinit wait=2a lucid from="gh-r" as="command" for \
      bpick="direnv.linux-arm64" mv="direnv* -> direnv" eval="./direnv hook zsh" pick="direnv" \
        direnv/direnv
  } else {
    zinit wait=2a lucid from="gh-r" as="command" for \
      mv="direnv* -> direnv" eval="./direnv hook zsh" pick="direnv" \
        direnv/direnv
  }
}

zinit wait=2b lucid for \
  OMZL::clipboard.zsh \
  OMZP::command-not-found \
  OMZP::extract \
  OMZP::git-lfs \
  OMZP::isodate \
  OMZP::safe-paste

zinit wait=2c lucid for \
  id-as="brew-shellenv" has="brew" \
  eval="brew shellenv" run-atpull \
    zdharma-continuum/null \
  id-as="poetry-completion" has="poetry" nocompile \
  atclone="poetry completions zsh > _poetry" atpull="%atclone" \
    zdharma-continuum/null


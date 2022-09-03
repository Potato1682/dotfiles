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

# Set history exclusion.
HISTORY_IGNORE="(cd *|z *|exit *|fzf*|ps *|bpytop|top|htop|glances|ls*|la*|ll*|l|l *|exa*|exity)"

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

zinit light-mode depth=1 for NICHOLAS85/z-a-eval

#
# Plugins
#

zinit nocd for \
  atload='
    source $ZDOTDIR/.p10k.zsh
    (( ! ${+functions[p10k]} )) || p10k finalize
  ' \
    romkatv/powerlevel10k

zinit reset \
  eval="dircolors -b LS_COLORS" \
  atload='zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}' for \
    trapd00r/LS_COLORS

zinit atinit="zstyle ':zim:input' double-dot-expand yes" for \
  zimfw/input

zinit wait lucid null for \
  atinit='source "$ZDOTDIR/.zshrc.lazy"' \
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
  ' \
    zdharma-continuum/fast-syntax-highlighting \
  blockf atpull="zinit creinstall -q ." \
    zsh-users/zsh-completions \
  atinit="
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
  " \
  atload="!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit wait=0e lucid nocompile nocompletions for \
  MenkeTechnologies/zsh-more-completions

zinit wait=0f lucid from="gh-r" as="command" for \
  eval="./zoxide init zsh" \
    ajeetdsouza/zoxide

zinit lucid wait=2a from="gh-r" as="program" for \
  mv="direnv* -> direnv" eval="./direnv hook zsh" pick="direnv" \
    direnv/direnv

zinit lucid wait=2b for \
  OMZP::command-not-found/command-not-found.plugin.zsh


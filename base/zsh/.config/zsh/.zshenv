for file ($HOME/.config/profile.d/*.sh) source "$file"

# unique paths
typeset -U path cdpath fpath manpath

if [[ -z "$ZSH_CACHE_DIR" ]] {
  export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
}

mkdir -p "$ZSH_CACHE_DIR"

# Change directory of compdump
ZSH_COMPDUMP="$XDG_STATE_HOME/zsh/compdump-${(%):-%m}-$ZSH_VERSION"
ZSH_COMPCACHE="$ZSH_CACHE_DIR/compcache-${(%):-%m}-$ZSH_VERSION"

if [[ -z "$ZIM_HOME" ]] {
  export ZIM_HOME="$XDG_DATA_HOME/zim"
}

export ZSHENV_LOADED=1


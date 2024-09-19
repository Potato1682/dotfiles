if [[ -z "$PROFILE_D_LOADED" ]] {
  for file ($HOME/.config/profile.d/*.sh) source "$file"
}

# unique paths
typeset -U path cdpath fpath manpath

if [[ -z "$ZSH_CACHE_DIR" ]] {
  export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
}

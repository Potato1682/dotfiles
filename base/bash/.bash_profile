if [[ -z "$PROFILE_D_LOADED" ]]; then
  for file in ~/.config/profile.d/*.sh; do
    source "$file"
  done
fi

[[ -f ~/.bashrc ]] && source ~/.bashrc


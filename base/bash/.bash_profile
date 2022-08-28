for file in ~/.config/profile.d/*.sh; do
  source "$file"
done

[[ -f ~/.bashrc ]] && source ~/.bashrc


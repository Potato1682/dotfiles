if [ ! -d ~/.cache ]; then
  mkdir -v ~/.cache;
fi
if [ -d ~/.cache/dotfiles ]; then
  rm -rf ~/.cache/dotfiles
fi

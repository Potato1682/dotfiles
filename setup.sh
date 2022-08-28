if ! command -v stow >/dev/null; then
  PERL_MM_USE_DEFAULT=1 cpan -T Stow && source ~/.bashrc
fi

rm ~/.bashrc ~/.zshrc && ~/.bcd base && stow -t ~ *


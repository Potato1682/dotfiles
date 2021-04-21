[[ -z $TMUX ]] && export PATH="/usr/lib/colorgcc/bin:$HOME/.gem/ruby/2.7.0/bin:$HOME/.fnm:$HOME/bin:$PATH"
export CCACHE_PATH="/usr/bin" 
export DOCKER_HOST=unix:///run/user/1000/docker.sock
export LANG=ja_JP.UTF-8
export TERM="xterm-256color"
export EDITOR="nvim"
export VISUAL="nvim"
export WINEPREFIX="$HOME/.wine"
export SHELL="zsh"
export HISTFILE=$HOME/.zsh-history
export HISTSIZE=100000
export SAVEHIST=1000000
export PERL_CPANM_OPT="--local-lib=~/extlib"
export PERL5LIB="$HOME/extlib/lib/perl5:$HOME/extlib/lib/perl5/i386-freebsd-64int:$PERL5LIB"
export RECIPIENT="contact@potato1682.ml"
export RECEPIENT=$RECIPIENT
source "$HOME/.cargo/env"
skip_global_compinit=1
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.


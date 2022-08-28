# if the shell is not a interactive session, do nothing
[[ $- != *i* ]] && return

if [[ ! -d "$XDG_DATA_HOME/bash" ]]; then
  mkdir -p "$XDG_DATA_HOME/bash"
fi

if [[ ! -f "$XDG_DATA_HOME/bash/lscolors.sh" ]]; then
  curl -fsSL -o "$XDG_DATA_HOME/bash" https://raw.githubusercontent.com/trapd00r/LS_COLORS/master/lscolors.sh >/dev/null 2>&1
fi

# ble.sh bootstrap
if [[ ! -f "$XDG_DATA_HOME/blesh/ble.sh" ]]; then
  command mkdir -p "$XDG_DATA_HOME/blesh-src"
  command git clone https://github.com/akinomyoga/ble.sh --recursive "$XDG_DATA_HOME/blesh-src" >/dev/null 2>&1 || \
    echo "error: Failed cloning ble.sh."
  cd "$XDG_DATA_HOME/blesh-src" && make install PREFIX="$XDG_DATA_HOME/.." >/dev/null || \
    echo "error: Failed making ble.sh."
fi

#
# Settings
#

shopt -s \
  autocd \
  cdable_vars \
  cdspell \
  direxpand \
  dirspell \
  execfail \
  extglob \
  failglob \
  globstar \
  histverify \
  nocaseglob \
  nocasematch \
  nullglob \
  xpg_echo

shopt -u no_empty_cmd_completion

set -o vi

PS1='
\[\e[0;38;5;69m\]\u \[\e[0;4;38;5;33m\]\W
\[\e[0;32m\]❯\[\e[0m\] '
#
# Finalization
#

for file in "$XDG_CONFIG_HOME"/rc.d/*.sh; do
  source "$file"
done

if command -v zoxide >/dev/null; then
  eval "$(zoxide init bash)"
fi

if command -v direnv >/dev/null; then
  eval "$(direnv hook bash)"
fi

[[ -f "$XDG_DATA_HOME/bash/lscolors.sh" ]] && source "$XDG_DATA_HOME/bash/lscolors.sh"

[[ "$TERM_PROGRAM" == "vscode" ]] && source "$(code --locate-shell-integration-path bash)"

if [[ -f "$XDG_DATA_HOME/blesh/ble.sh" ]]; then
  source "$XDG_DATA_HOME/blesh/ble.sh" --rcfile "$XDG_CONFIG_HOME/blesh/blerc"
fi


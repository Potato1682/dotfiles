alias bathelp="bat --plain --language=help"

help() {
  "$@" --help 2>&1 | bathelp
}


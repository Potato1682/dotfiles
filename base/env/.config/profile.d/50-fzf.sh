#!/usr/bin/sh

export FZF_DEFAULT_OPTS="--scroll-off=3 \
--height=60% --layout=reverse --border --border-label='fzf' --border-label-pos=-3:bottom --margin=0,4 --padding=1,2 --info=inline --separator='·' --prompt='❯ ' --pointer='' --marker='+' --header-first --ellipsis='' \
--tabstop=2 \
--history='$XDG_STATE_HOME/fzf/history' \
--preview='[[ \$(file -Li {}) =~ directory ]] && (command -v exa >/dev/null && exa -TL 3 --color=always --icons {} || ls -l --color) || ([[ \$(file -Li {}) =~ binary ]] && echo {} is a binary file || (command -v bat >/dev/null && bat --color=always --line-range=:500 {} || cat -n {}) 2> /dev/null) | head -500' \
--preview-window='right,60%' --preview-label='Preview' --preview-label-pos=4 \
-1 \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=border:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

export FZF_DEFAULT_COMMAND="command -v fd >/dev/null && fd --type f --hidden --follow --exclude '.git' || find . -path '*/\.*' -prune -o -type f -print -o -type l -print | sed s/^..//"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS --bind='ctrl-t:toggle-sort'"

export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude '.git'"
export FZF_ALT_C_OPTS="$FZF_DEFAULT_OPTS"

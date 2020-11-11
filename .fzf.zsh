# Setup fzf
# ---------
if [[ ! "$PATH" == */home/potato1682/.fzf/bin* ]]; then
    export PATH="${PATH:+${PATH}:}/home/potato1682/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/potato1682/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/potato1682/.fzf/shell/key-bindings.zsh"

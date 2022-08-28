export ZDOTDIR="$HOME/.config/zsh"

counter=0
max_count=20

while [[ ! -f "$ZDOTDIR/.zshenv" ]] {
  if (( counter == 20 )) {
    echo "error: maximum counter exceeded, zsh will stop sourcing zshenv!"

    return
  }

  sleep 0.5

  (( counter++ ))
}

source "$ZDOTDIR/.zshenv"

